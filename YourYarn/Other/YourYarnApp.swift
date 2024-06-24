//
//  YourYarnApp.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//
import FirebaseCore
import SwiftUI

@main
struct YourYarnApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
