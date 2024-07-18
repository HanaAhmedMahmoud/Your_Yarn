//
//  OpeningView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct OpeningView: View {
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                GeometryReader { geometry in
                    VStack {
                        Spacer().frame(height: geometry.size.height * 0.1)
                        
                        // Title and header
                        VStack(spacing: 10) {
                            Text("Your Yarn")
                                .font(.title)
                                .foregroundColor(BackgroundView().titleColour)
                                .bold()
                            Text("your personal virtual wool collection")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom, 10)
                        
                        // Image
                        Image("GirlKnitting")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geometry.size.width * 0.7)
                        
                        Spacer().frame(height: geometry.size.height * 0.05)
                        
                        // Create new account
                        VStack(spacing: 15) {
                            GenericNavigationView(navTitle: "Login", destination: LoginView())
                                .padding(.horizontal, geometry.size.width * 0.1)
                            
                            GenericFootnote(message: "A new member?")
                            
                            GenericNavigationView(navTitle: "Create Account", destination: RegistrationView())
                                .padding(.horizontal, geometry.size.width * 0.1)

                        }
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    OpeningView()
}

