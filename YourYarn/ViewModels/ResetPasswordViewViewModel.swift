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
        let validationErrorMessage = Validate.emailValidation(email: email)
        guard validationErrorMessage.isEmpty else {
            self.errorMessage = validationErrorMessage
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
    
    
}
