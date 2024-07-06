//
//  LoginViewViewModel.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init() {}

    func login() {
        let errorMessage = Validate.emailValidation(email: email)
        guard errorMessage.isEmpty else {
            return
        }

        // Try to login
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if (error as NSError?) != nil {
                self?.errorMessage = "Invalid username or password."
            } else {
                // Clear any previous error message on successful login
                self?.errorMessage = ""
            }
        }
    }

   
}
