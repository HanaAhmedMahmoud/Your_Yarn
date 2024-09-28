//
//  YarnViewViewModel.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 21/07/2024.
//

import Foundation

class YarnViewViewModel: ObservableObject
{
    @Published var showingNewYarnView = false
    @Published var yarnName = ""
    @Published var yarnType = ""
    @Published var yarnWeight = ""
    @Published var yarnDesc = ""
    @Published var yarnPhoto = ""

    init() {}
    
    func editYarns() {
        
    }
    
    func deleteYarn() {
        
    }
}
