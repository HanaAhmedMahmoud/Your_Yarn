//
//  TotalWishlistViewViewModel.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 14/07/2024.
//

import FirebaseFirestore
import Foundation

class TotalWishlistViewViewModel: ObservableObject{
    
    private let userID: String
    
    init(userId: String) {
        self.userID = userId
    }
    
    /// Delete wish list item
    /// - Parameter id: item id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .collection("wishlistItems")
            .document(id)
            .delete()
    }
}
