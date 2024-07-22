//
//  HomeViewViewModel.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class HomeViewViewModel: ObservableObject{
    
    private let userID: String
    
    init(userId: String) {
        self.userID = userId
    }
    
    func getUsername() -> String {
        
        //get user ID
        guard let uID = Auth.auth().currentUser?.uid else { return ""}
        
        // Get the data from the database
        let db = Firestore.firestore()
        
        return "will return username" 
    }

}
