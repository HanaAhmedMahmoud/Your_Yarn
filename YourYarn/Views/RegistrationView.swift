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
                            GenericTitleAndSubtitleView(title: "Create an account:", subtitle: "Enter your details to sign up for the app")
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
                            
                            GenericButtonView(buttonText: "Sign up with email",
                                              buttonColour: Color.white,
                                              textColour: Color.black,
                                              buttonOutline: Color.gray,
                                              action: viewModel.register)
                            .padding(.horizontal, geometry.size.width * 0.1)
                        }
                        
    
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage).foregroundStyle(Color.red).padding(.horizontal, geometry.size.width * 0.1)
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
