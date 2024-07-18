//
//  GenericFootnote.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 06/07/2024.
//

import SwiftUI

struct GenericFootnote: View {
    let message: String
    var body: some View {
        Text(message)
            .foregroundColor(.gray)
            .font(.footnote)
    }
}

#Preview {
    GenericFootnote(message: "Forgot your password?")
}
