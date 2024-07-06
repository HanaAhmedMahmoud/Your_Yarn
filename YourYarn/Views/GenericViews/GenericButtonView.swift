//
//  GenericButtonView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 04/07/2024.
//

import SwiftUI

struct GenericButtonView: View {
    let buttonText: String
    let buttonColour: Color
    let textColour: Color
    let buttonOutline: Color
    let action: () -> ()
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(buttonText)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(buttonColour)
                .foregroundColor(textColour)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(buttonOutline, lineWidth: 1)
                )
        }
    }
}

struct Generic_Button_Preview: PreviewProvider {
    
    static func deleteAccountAction() {
        // Define what happens when the delete account action is triggered
        print("Deleting account...")
        // You can add actual deletion logic here
    }
    
    static var previews: some View {
        GenericButtonView(buttonText: "hello", buttonColour: Color.red, textColour: Color.red, buttonOutline: Color.red,  action: deleteAccountAction)
    }
}
