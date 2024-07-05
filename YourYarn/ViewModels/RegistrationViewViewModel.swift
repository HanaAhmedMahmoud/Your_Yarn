//
//  RegistrationViewViewModel.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegistrationViewViewModel : ObservableObject{
    
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage = "" 
    
    
    init(){}
    
    func register() {
        let validationErrorMessage = Validate.validateCreateAccount(email: email, username: username, password: password, confirmPassword: confirmPassword)
        guard validationErrorMessage.isEmpty else {
            self.errorMessage = validationErrorMessage
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result, error in
            guard let userID = result?.user.uid else{
                self?.errorMessage = "User already exists, sign in"
                return
            }
            
            self?.insertUserRecord(id: userID)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           username: username,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
}
