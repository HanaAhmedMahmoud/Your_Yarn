//
//  GenericTitleAndSubtitleView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 06/07/2024.
//

import SwiftUI

struct GenericTitleAndSubtitleView: View {
    let title: String
    let subtitle: String
    var body: some View {
        Text(title)
            .bold()
            .font(.headline)
        Text(subtitle)
            .font(.footnote)
            .foregroundColor(.gray)
    }
}

#Preview {
    GenericTitleAndSubtitleView(title: "Your yarn", subtitle: "Your personal virtual wool organiser")
}
