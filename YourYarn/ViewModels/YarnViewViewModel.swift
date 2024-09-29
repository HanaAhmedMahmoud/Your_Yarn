//
//  YarnViewViewModel.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 21/07/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class YarnViewViewModel: ObservableObject
{
    @Published var showingNewYarnView = false
    @Published var yarnName = ""
    @Published var yarnWeight = ""
    @Published var yarnDesc = ""
    var yarnNameChange = false
    var yarnWeightChange = false
    var yarnDescChange = false
    
    init() {}
    
    func editYarns(yarnID: String) {
        
        //a dictionary to store fields which change
        var updateFields: [String: String] = [:]
        
        //if the yarn name is not empty
        if Validate.emptySpaceValidation(string: yarnName){
            updateFields["yarnName"] = yarnName
        }
        
        //if the yarn weight is not empty
        if Validate.emptySpaceValidation(string: yarnWeight){
            updateFields["yarnWeight"] = yarnWeight
        }
        
        //if the yarn desc is not empty
        if Validate.emptySpaceValidation(string: yarnDesc){
            updateFields["yarnDesc"] = yarnDesc
        }
        
        if !updateFields.isEmpty{
            updateDatabase(yarnID: yarnID, fieldsToUpdate: updateFields)
        }
                
    }
    
    func updateDatabase(yarnID: String, fieldsToUpdate: [String:String]) {
        
        //Get current user id
        guard let uID = Auth.auth().currentUser?.uid else{
            return
        }
        
        //create instance of database
        let db = Firestore.firestore()
        
        print(fieldsToUpdate)
        
        //go to users,user id yarn items, yarn id then update fields
        db.collection("users")
            .document(uID)
            .collection("yarnItems")
            .document(yarnID)
            .updateData(fieldsToUpdate)
    }
    
    
    func deleteYarn() {
        
    }
}
