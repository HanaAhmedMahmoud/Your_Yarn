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
        guard validate() else {
            return
        }

        // Try to login
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error as NSError? {
                self?.errorMessage = "Invalid username or password."
            } else {
                // Clear any previous error message on successful login
                self?.errorMessage = ""
            }
        }
    }

    private func validate() -> Bool {
        errorMessage = ""

        // Empty space validation
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }

        // Email validation
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }

        return true
    }

   
    
}
