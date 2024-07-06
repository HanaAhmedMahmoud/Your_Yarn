//
//  ResetPasswordView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @StateObject var viewModel = ResetPasswordViewViewModel()
    
    //reset button disable and timer
    @State private var buttonDisabled = false
    @State private var number = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                GeometryReader { geometry in
                    VStack {
                        Spacer().frame(height: geometry.size.height * 0.35)
                        
                        VStack(spacing: 10) {
                            GenericTitleAndSubtitleView(title: "Reset Password:", subtitle: "Confirm your details, then check your emails to reset your password").multilineTextAlignment(.center)
                                
                        }
                        .padding(.bottom, 20)
                        
                        // Form
                        VStack(spacing: 15) {
                            TextField("Enter email", text: $viewModel.email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, geometry.size.width * 0.1)
                            
                            GenericButtonView(buttonText: buttonDisabled ? "Wait \(number) seconds to click again" : "Login",
                                              buttonColour: Color.white,
                                              textColour: Color.black,
                                              buttonOutline: Color.gray,
                                              action: {
                                                    guard viewModel.isValidEmail() else {
                                                    return
                                                    }
                                                       viewModel.resetPassword()
                                                       buttonDisabled = true
                                                       startCountdown()
                                                      })
                            .disabled(buttonDisabled)
                            .padding(.horizontal, geometry.size.width * 0.1)
                            .onReceive(timer) { _ in
                                if buttonDisabled && number > 0 {
                                    number -= 1
                                } else if number == 0 {
                                    buttonDisabled = false
                                    number = 60
                                }
                            }
                            
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
    
    private func startCountdown() {
        number = 60
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if number > 0 {
                number -= 1
            } else {
                buttonDisabled = false
                timer.invalidate()
            }
        }
    }
}

#Preview {
    ResetPasswordView()
}

