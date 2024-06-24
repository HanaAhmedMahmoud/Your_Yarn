//
//  User.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import Foundation

struct User: Codable{
    let id: String
    let username: String
    let email: String
    let joined: TimeInterval
}
