//
//  BackgroundView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct BackgroundView: View {
    
    //App colour codes
    let backgroundColour = Color(red: 0.9686, green: 0.9176, blue: 0.9922)
    let buttonColour = Color(red: 0.5255, green: 0.4157, blue: 0.6157)
    let deletionColour = Color(red: 0.7137, green: 0.051, blue: 0.0471)
    let titleColour = Color(red: 0.3569, green: 0.0039, blue: 0.4824)
    let tabBarColour = UIColor(red: 0.5255, green: 0.4157, blue: 0.6157, alpha: 1)
    let unselectedColour = UIColor(red: 0.749, green: 0.702, blue: 0.7961, alpha: 1)
    
    var body: some View {
        Image("Background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundView()
}
