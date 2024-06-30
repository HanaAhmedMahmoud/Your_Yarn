//
//  ResetPasswordView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @StateObject var viewModel = ResetPasswordViewViewModel()
    
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                GeometryReader { geometry in
                    VStack {
                        Spacer().frame(height: geometry.size.height * 0.35)
                        
                        VStack(spacing: 10) {
                            Text("Reset Password:")
                                .bold()
                                .font(.headline)
                            Text("Confirm your details, then check your emails to reset your password")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                
                        }
                        .padding(.bottom, 20)
                        
                        // Form
                        VStack(spacing: 15) {
                            TextField("confirm email", text: $viewModel.email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, geometry.size.width * 0.1)
                            
                            
                            Button(action: {
                                viewModel.resetPassword()
                            }) {
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
                        
                        VStack(){
                            if !viewModel.errorMessage.isEmpty{
                                Text(viewModel.errorMessage).foregroundStyle(Color.red)
                            }
                            
                            if !viewModel.successMessage.isEmpty{
                                Text(viewModel.successMessage).foregroundStyle(Color.green)
                            }
                        }.padding(.horizontal, geometry.size.width * 0.1)
                        
                        
                        Spacer().frame(height: geometry.size.height * 0.1)

                    }
                }
            }
        }
    }
}

#Preview {
    ResetPasswordView()
}
