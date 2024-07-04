//
//  TabItemView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 28/06/2024.
//

import SwiftUI

struct TabItemView: View {
    
    let title: String
    let imageName: String
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(imageName)
                .renderingMode(.template)
                .foregroundColor(isSelected ? .white : Color(BackgroundView().unselectedColour))
            Text(title)
                .foregroundColor(isSelected ? .white : Color(BackgroundView().unselectedColour))
        }
    }
}
