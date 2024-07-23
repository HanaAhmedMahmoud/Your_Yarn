//
//  UserDBFunctions.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 23/07/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class UserDBFunctions: ObservableObject{
    
    @Published var user: User? = nil
    @Published var errorMessage = ""
    
    
    init() {
        fetchUser()
    }
    
    private func getUserID() -> String? {
        return Auth.auth().currentUser?.uid
    }
    
    func fetchUser(){
        
        //get userID
        guard let userID = getUserID() else {
            self.errorMessage = "No user is currently signed in."
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userID).getDocument{ [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            DispatchQueue.main.async{
                self?.user = User(id: data["id"] as? String ?? "",
                                  username: data["username"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
    }
    
    func getUsername() -> String {
           return user?.username ?? "Error"
    }
    
    func getEmail() -> String {
           return user?.email ?? "Error"
    }
    
    func getMemberSince() -> String {
        return Date(timeIntervalSince1970: user?.joined ?? 0.0).formatted(date: .abbreviated, time: .shortened)
    }
    
    func logout() {
        do{
            try Auth.auth().signOut()
        }catch{
            print(errorMessage)
        }
        
    }
    
    func deleteAccount(){
        //get user id
        guard let userID = getUserID() else {
            self.errorMessage = "No user is currently signed in."
            return
        }
        
        //get reference to Reference to db
        let db = Firestore.firestore()
        
        //delete account from firebase auth
        Auth.auth().currentUser?.delete { [weak self] error in
            if error != nil {
                self?.errorMessage = "Failed to delete user account"
            } else {
                self?.errorMessage = ""
                return
            }
        }
        
        //delete data
        db.collection("users").document(userID).delete { error in
            if error != nil {
                self.errorMessage = "error to delete user account"
            } else {
                self.errorMessage = ""
                return
            }
        }

    }
    
}
