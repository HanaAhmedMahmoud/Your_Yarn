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
                                .foregroundColor(Color(red: 0.3569, green: 0, blue: 0.4824))
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
                            NavigationLink(destination: LoginView()) {
                                Text("Login")
                                    .frame(maxWidth: .infinity, minHeight: 50)
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                            .padding(.horizontal, geometry.size.width * 0.1)
                            
                            Text("A new member?")
                                .foregroundColor(.gray)
                                .font(.footnote)
                            
                            NavigationLink(destination: RegistrationView()) {
                                Text("Create Account")
                                    .frame(maxWidth: .infinity, minHeight: 50)
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
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

