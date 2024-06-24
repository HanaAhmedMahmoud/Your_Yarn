//
//  LoginView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                GeometryReader { geometry in
                    VStack {
                        Spacer().frame(height: geometry.size.height * 0.3)
                        
                        VStack(spacing: 10) {
                            Text("Login to your account:")
                                .bold()
                                .font(.headline)
                            Text("Enter your details to log into the app")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom, 20)
                        
                        
                        // Form
                        VStack(spacing: 15) {
                            
                            TextField("Email", text: $viewModel.email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, geometry.size.width * 0.1)
                            
                            SecureField("Password", text: $viewModel.password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, geometry.size.width * 0.1)
                            
                            Button(action: {
                                viewModel.login()
                            }) {
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
                            
                            //Form valildation
                            if !viewModel.errorMessage.isEmpty{
                                Text(viewModel.errorMessage).foregroundStyle(Color.red)
                            }
                        }
                        
                        Spacer().frame(height: geometry.size.height * 0.05)
                        
                        VStack(spacing: 10) {
                            Text("Forgot your password?")
                                .foregroundColor(.gray)
                                .font(.footnote)
                            
                            NavigationLink(destination: ResetPasswordView().navigationBarBackButtonHidden(true)) {
                                Text("Reset password")
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
    LoginView()
}

