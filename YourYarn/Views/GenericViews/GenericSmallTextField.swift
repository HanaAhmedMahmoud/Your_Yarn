//
//  GenericSmallTextField.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/07/2024.
//

import SwiftUI

struct GenericSmallTextField: View {
    let textDesc: String
    @Binding var action: String
    
    var body: some View {
            TextField(textDesc, text: $action)
                .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct GenericSmallTextField_Previews: PreviewProvider {
    @State static var yarnName = "Sample Yarn"

    static var previews: some View {
        GenericSmallTextField(textDesc: "Name", action: $yarnName)
    }
}
