//
//  GenericLargeTextField.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/07/2024.
//

import SwiftUI

struct GenericLargeTextField: View {
    let textDesc: String
    @Binding var action: String
    
    var body: some View {
            TextField(textDesc, text: $action, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .lineLimit(5, reservesSpace: true)
        
    }
}

struct GenericLargeTextField_Previews: PreviewProvider {
    @State static var yarnName = "Sample Yarn"

    static var previews: some View {
        GenericLargeTextField(textDesc: "Name", action: $yarnName)
    }
}
