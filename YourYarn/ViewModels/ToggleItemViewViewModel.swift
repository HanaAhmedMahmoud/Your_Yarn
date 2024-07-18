//
//  ToggleItemViewViewModel.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 12/07/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToggleItemViewViewModel: ObservableObject{
    init() {}
    
    func toggleIsDone(item: WishlistItem){
        var itemCopy = item
        itemCopy.setBought(!item.isBought)
        
        //update record in database
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("wishlistItems")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
