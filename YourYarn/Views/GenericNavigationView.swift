//
//  GenericNavigationView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 04/07/2024.
//

import SwiftUI

struct GenericNavigationView<Destination: View>: View {
    let navTitle: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(navTitle)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color.white)
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
    }
}

struct Generic_View_Preview: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            GenericNavigationView(navTitle: "Login", destination: TempView())
        }
    }
}

struct TempView: View {
    var body: some View {
        Text("Temp Screen")
    }
}
