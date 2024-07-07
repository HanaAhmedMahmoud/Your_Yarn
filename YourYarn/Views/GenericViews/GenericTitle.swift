//
//  GenericTitle.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 07/07/2024.
//

import SwiftUI

struct GenericTitle: View {
    let title: String
    
    var body: some View {
        Text(title)
            .bold()
            .font(.title)
            .foregroundStyle(BackgroundView().titleColour)
            .padding()
    }
}

#Preview {
    GenericTitle(title: "Test")
}
