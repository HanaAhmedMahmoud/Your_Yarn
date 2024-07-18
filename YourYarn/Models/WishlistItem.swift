//
//  WishlistItem.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import Foundation

struct WishlistItem: Codable, Identifiable{
    let id: String
    let itemName: String
    let itemDesc: String
    var isBought: Bool
    
    mutating func setBought(_ state: Bool){
        isBought = state
    }
}
