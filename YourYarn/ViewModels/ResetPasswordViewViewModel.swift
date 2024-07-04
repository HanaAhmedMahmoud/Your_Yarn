//
//  ResetPasswordViewViewModel.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 30/06/2024.
//

import FirebaseAuth
import Foundation

class ResetPasswordViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var errorMessage = ""
    @Published var successMessage = ""
    
    init() {}
    
    func resetPassword(){
        
        //validate email entered
        guard validate() else{
            return
        }
        
        //check if account exists
        Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            }
            else{
                self?.successMessage = "Password reset email sent successfully."
            }
        }
       
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        //Empty space validation
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in all fields."
            return false
        }
        
        //email validation
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email."
            return false
        }
        
        return true
        
    }
    
    
}
