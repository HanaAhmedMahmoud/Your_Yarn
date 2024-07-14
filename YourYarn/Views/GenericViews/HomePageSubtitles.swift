//
//  HomePageSubtitles.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 14/07/2024.
//

import SwiftUI

struct HomePageSubtitles: View {
    let title: String
    let subtitle: String
    let titleColour: Color
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .bold()
                    .font(.title2)
                    .foregroundStyle(titleColour)
                Spacer()
            }
            HStack{
                Text(subtitle)
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
            }
        }.padding(.horizontal)
        
    }
}

#Preview {
    HomePageSubtitles(title: "Your yarn", subtitle: "Your personal virtual wool organiser", titleColour: Color.purple)
}

