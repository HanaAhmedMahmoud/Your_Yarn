//
//  TotalYarnViewViewModel.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 18/07/2024.
//

import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import Foundation

class TotalYarnViewViewModel: ObservableObject {
    
    @Published var retrievedImages = [UIImage]()
    @Published var yarnImage: UIImage? = nil
    
    private let userID: String
    
    init(userId: String) {
        self.userID = userId
    }
    

    func setYarnPhoto(yarnId: String) {
        
        // Get user ID
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Get the data from the database
        let db = Firestore.firestore()
        
        db.collection("users")
        db.collection("users")
            .document(uID)
            .collection("yarnItems")
            .document(yarnId)
            .getDocument { snapshot, error in
                
                // If there is an error, return
                guard let data = snapshot?.data(), error == nil else {
                    return
                }
                
                let path = data["yarnImage"] as? String ?? ""
                
                // Get a reference to storage
                let storageRef = Storage.storage().reference()
                
                // Specify the path
                let fileRef = storageRef.child(path)
                
                // Retrieve the data
                fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                    if let error = error {
                        print("Error getting data: \(error.localizedDescription)")
                    } else if let data = data, let image = UIImage(data: data) {
                        self.yarnImage = image
                        return
                    } else {
                        return
                    }
                }
            }
    }
    
    func retrieveYarnPhotos() {
        //get user ID
        guard let uID = Auth.auth().currentUser?.uid else { return }
        
        // Get the data from the database
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uID)
            .collection("yarnItems")
            .getDocuments { snapshot, error in
                if error == nil && snapshot != nil {
                    //Array for paths
                    var paths = [String]()
                    
                    //loop through all the returned documents
                    for doc in snapshot!.documents{
                        //extract the file path
                        paths.append(doc["yarnImage"] as! String)
                    }
                    
                    //Loop through each file path and get data from storage
                    for path in paths {
                        
                        //Get a reference to storage
                        let storageRef = Storage.storage().reference()
                        
                        //Specify the path
                        let fileRef = storageRef.child(path)
                        
                        //Retrieve the data
                        fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                            if error == nil && data != nil{
                                // Create a UI image and put it into array for display
                                if let image = UIImage(data: data!) {
                                    //Pass to main thread
                                    DispatchQueue.main.async{
                                        self.retrievedImages.append(image)
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
    }
    
    
    func editYarns() {
        
    }
}
