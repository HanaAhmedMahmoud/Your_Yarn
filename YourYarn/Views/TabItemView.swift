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
                .foregroundColor(isSelected ? .white : Color(UIColor(red: 0.749, green: 0.702, blue: 0.7961, alpha: 1)))
            Text(title)
                .foregroundColor(isSelected ? .white : Color(UIColor(red: 0.749, green: 0.702, blue: 0.7961, alpha: 1)))
        }
    }
}
