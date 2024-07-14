//
//  AddYarnViewViewModel.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class AddYarnViewViewModel : ObservableObject{
    @Published var yarnName = ""
    @Published var yarnType = ""
    @Published var yarnWeight = ""
    @Published var yarnDesc = ""
    @Published var errorMessage = ""
    @Published var successMessage = ""
    
    init(){}
    
    func addToWishlist(){
        
        //validating that the first field is not empty
        guard Validate.emptySpaceValidation(string: yarnName) else {
            errorMessage = "Please fill in the item name field"
            return
        }
        
        guard Validate.emptySpaceValidation(string: yarnType) else {
            errorMessage = "Please fill in the yarn type field"
            return
        }
        
        guard Validate.emptySpaceValidation(string: yarnWeight) else {
            errorMessage = "Please fill in the yarn weight field"
            return
        }
        
        if !Validate.emptySpaceValidation(string: yarnDesc) {
            yarnDesc = "N/A"
        }
        
        //Get current user id
        guard let uID = Auth.auth().currentUser?.uid else{
            return
        }
        
        
        //HANA CHANGE THIS, COME BACK HERE 
        
        //Create a model
        let newID = UUID().uuidString
        //let newItem = WishlistItem(id: newID,
                                 //  yarnName: yarnName,
                                   //yarnType: yarnType,
                                 //  isBought: false)
        
        //Save model to database
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("wishlistItems")
            .document(newID)
           // .setData(newItem.asDictionary())
        
        successMessage = "Added to wishlist successfully"
        errorMessage = ""
        yarnName = ""
        yarnType = ""
        yarnWeight = ""
        yarnDesc = ""
    }
}


