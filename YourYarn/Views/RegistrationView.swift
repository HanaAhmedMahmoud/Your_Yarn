//
//  RegistrationView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                GeometryReader { geometry in
                    VStack {
                        Spacer().frame(height: geometry.size.height * 0.3)
                        
                        VStack(spacing: 10) {
                            Text("Create an account:")
                                .bold()
                                .font(.headline)
                            Text("Enter your details to sign up for the app")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom, 20)
                        
                        // Form
                        VStack(spacing: 15) {
                            TextField("email", text: $viewModel.email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, geometry.size.width * 0.1)
                            
                            TextField("username", text: $viewModel.username)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, geometry.size.width * 0.1)
                            
                            SecureField("password", text: $viewModel.password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, geometry.size.width * 0.1)
                            
                            SecureField("confirm password", text: $viewModel.confirmPassword)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, geometry.size.width * 0.1)
                            
                            Button(action: {
                                viewModel.register()
                            }) {
                                Text("Sign up with email")
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
                        
                        Spacer().frame(height: geometry.size.height * 0.05)

                    }
                }
            }
        }
    }
}

#Preview {
    RegistrationView()
}
