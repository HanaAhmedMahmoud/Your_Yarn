//
//  Validate.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 05/07/2024.
//

import Foundation

class Validate{
    static func emptySpaceValidation(string: String) ->Bool{
        return !string.trimmingCharacters(in: .whitespaces).isEmpty
    }

    //email validation
    static func emailSyntaxValidation(email: String) -> Bool{
        return email.contains("@") && email.contains(".")
    }

    static func emailValidation(email: String) -> String{
        guard emptySpaceValidation(string: email) else{
            return "Please fill in all fields."
        }
        
        guard emailSyntaxValidation(email: email) else{
            return "Please enter a valid email."
        }
        
        return ""
    }


    // password validation
    static func passwordMatchValidation(password: String, confirmPassword:String) -> Bool{
        return password == confirmPassword
    }

    static func passwordLength(password: String) ->Bool{
        return password.count >= 6
    }

    static func passwordHasNumber(password:String) ->Bool{
        return true;
    }

    static func passwordHasSpecialChar(password:String) ->Bool{
        return true
    }

    static func validatePassword(password: String, confirmPassword: String) -> String{
        
        guard passwordMatchValidation(password: password, confirmPassword: confirmPassword) else{
            return  "Passwords do not match."
        }
        
        guard passwordLength(password:password),
              passwordHasNumber(password: password),
              passwordHasSpecialChar(password: password) else{
            return "Password is too weak, Password should be contain a number, a special character and be greater than 6 characters long."
        }
        
        return ""
    }
    
    static func validateCreateAccount(email: String, username: String, password: String, confirmPassword: String) -> String{
        
        let passwordMessage = validatePassword(password: password, confirmPassword: confirmPassword)
        
        guard emptySpaceValidation(string: email),
              emptySpaceValidation(string: password),
              emptySpaceValidation(string: confirmPassword),
              emptySpaceValidation(string: username) else{
            return "Please fill in all fields."
        }
        
        guard emailSyntaxValidation(email: email) else{
            return "Please enter a valid email."
        }
        
        return passwordMessage
    }

}
