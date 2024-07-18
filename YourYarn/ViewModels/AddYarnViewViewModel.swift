//
//  AddYarnViewViewModel.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore
import Foundation
import UIKit

class AddYarnViewViewModel: ObservableObject {

    @Published var yarnName = ""
    @Published var yarnType = ""
    @Published var yarnWeight = ""
    @Published var yarnDesc = ""
    @Published var selectedImage: UIImage? = nil
    @Published var errorMessage = ""
    @Published var successMessage = ""


    init() {}

    
    func addToYarns() {
        // Validate input fields
        guard validateFields() else { return }

        // Get current user ID
        guard let uID = Auth.auth().currentUser?.uid else { return }

        // Create a new yarn item
        let newID = UUID().uuidString
        let path = "yarnImages/\(newID).jpg"
        let newItem = YarnItem(id: newID,
                               yarnName: yarnName,
                               yarnType: yarnType,
                               yarnWeight: yarnWeight,
                               yarnDesc: yarnDesc.isEmpty ? "N/A" : yarnDesc,
                               yarnImage: path,
                               isUsed: false)

        // Save the item to Firestore
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("yarnItems")
            .document(newID)
            .setData(newItem.asDictionary()) { error in
                if error != nil {
                    self.errorMessage = "Failed to add yarn:"
                    self.successMessage = ""
                } else {
                    self.uploadPhoto(to: path)
                    self.successMessage = "Added to yarns successfully"
                    self.resetFields()
                }
            }
    }

    private func validateFields() -> Bool {
        if selectedImage == nil {
            errorMessage = "Please submit a photo"
            self.successMessage = ""
            return false
        }
        if !Validate.emptySpaceValidation(string: yarnName) {
            errorMessage = "Please fill in the item name field"
            self.successMessage = ""
            return false
        }
        if !Validate.emptySpaceValidation(string: yarnType) {
            errorMessage = "Please fill in the yarn type field"
            self.successMessage = ""
            return false
        }
        if !Validate.emptySpaceValidation(string: yarnWeight) {
            errorMessage = "Please fill in the yarn weight field"
            self.successMessage = ""
            return false
        }
        return true
    }

    private func uploadPhoto(to path: String) {
        guard let selectedImage = selectedImage,
              let imageData = selectedImage.jpegData(compressionQuality: 0.8) else { return }

        let storageRef = Storage.storage().reference()
        let fileRef = storageRef.child(path)

        fileRef.putData(imageData, metadata: nil) { _, error in
            if error != nil {
                self.errorMessage = "Failed to upload image"
                self.successMessage = ""
            } else {
                // Handle successful upload if needed
            }
        }
    }
    

    private func resetFields() {
        yarnName = ""
        yarnType = ""
        yarnWeight = ""
        yarnDesc = ""
        errorMessage = ""
        selectedImage = nil
    }
}
