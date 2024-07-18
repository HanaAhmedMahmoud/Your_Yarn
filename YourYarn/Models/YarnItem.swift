//
//  YarnItem.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import Foundation

struct YarnItem: Codable, Identifiable{
    let id: String
    let yarnName: String
    let yarnType: String
    let yarnWeight: String
    let yarnDesc: String
    let yarnImage: String
    var isUsed: Bool
    
    mutating func setUsed(_ state: Bool){
        isUsed = state
    }
}
