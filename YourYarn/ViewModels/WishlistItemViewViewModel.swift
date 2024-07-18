//
//  WishlistItemViewViewModel.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class WishlistViewModel : ObservableObject{
    @Published var itemName = ""
    @Published var itemDesc = ""
    @Published var errorMessage = ""
    @Published var successMessage = ""
    
    init(){}
    
    func addToWishlist(){
        
        //validating that the first field is not empty
        guard Validate.emptySpaceValidation(string: itemName) else {
            errorMessage = "Please fill in the item name field"
            return
        }
        
        if !Validate.emptySpaceValidation(string: itemDesc) {
            itemDesc = "N/A"
        }
        
        //Get current user id
        guard let uID = Auth.auth().currentUser?.uid else{
            return
        }
        
        //Create a model
        let newID = UUID().uuidString
        let newItem = WishlistItem(id: newID,
                                   itemName: itemName,
                                   itemDesc: itemDesc,
                                   isBought: false)
        
        //Save model to database
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("wishlistItems")
            .document(newID)
            .setData(newItem.asDictionary())
        
        successMessage = "Added to wishlist successfully"
        errorMessage = ""
        itemName = ""
        itemDesc = ""
    }
}

