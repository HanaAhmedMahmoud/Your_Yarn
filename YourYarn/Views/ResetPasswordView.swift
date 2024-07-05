//
//  ResetPasswordView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @StateObject var viewModel = ResetPasswordViewViewModel()
    @State private var buttonDisabled = false
    
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
                            TextField("Enter email", text: $viewModel.email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, geometry.size.width * 0.1)
                            
                            GenericButtonView(buttonText: buttonDisabled ? "Wait to click again" : "Login",
                                              buttonColour: Color.white,
                                              textColour: Color.black,
                                              buttonOutline: Color.gray,
                                              action: {
                                                    guard viewModel.isValidEmail() else {
                                                    return
                                                    }
                                                       viewModel.resetPassword()
                                                       buttonDisabled = true
                                                       DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                                           buttonDisabled = false}
                                
                                                      })
                            .disabled(buttonDisabled)
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
                            .padding(.top) 
                        
                        
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
