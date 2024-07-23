//
//  ProfileView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = UserDBFunctions()
    @State var isActive: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView{
                ZStack{
                    //background colour
                    BackgroundView().backgroundColour.ignoresSafeArea()
                    
                    VStack{
                        
                        GenericTitle(title: "Settings")
                        
                        // Info: Name, email, edit account
                        VStack(alignment: .leading){
                            Grid(alignment: .leadingFirstTextBaseline,
                                 horizontalSpacing: 10,
                                 verticalSpacing: 15){
                                GridRow{
                                    Text("Username: ")
                                        .bold()
                                    Text("@" + viewModel.getUsername())
                                }
                                
                                GridRow{
                                    Text("Email: ")
                                        .bold()
                                    Text(viewModel.getEmail())
                                }
                                
                                GridRow{
                                    Text("Member Since: ")
                                        .bold()
                                    Text(viewModel.getMemberSince())
                                }
                                
                            }
                        }.padding()
                        
                        
                        
                        VStack
                        {
                            // sign out
                            GenericButtonView(buttonText: "Log Out",
                                              buttonColour: BackgroundView().buttonColour,
                                              textColour: Color.white,
                                              buttonOutline: Color.white,
                                              action: viewModel.logout)
                            .padding(.top)
                            
                            // delete account
                            GenericButtonView(buttonText: "Delete account",
                                              buttonColour: BackgroundView().deletionColour,
                                              textColour: Color.white,
                                              buttonOutline: Color.gray,
                                              action: { isActive = true } )
                            
                        }.padding(.horizontal, geometry.size.width * 0.1)
                        
                        
                        
                        Spacer()
                        
                    }
                    
                }
                
                if isActive{
                    PopUpView(isActive: $isActive,
                              title: "Delete Account?",
                              message: "Are you sure you want to delete your account?",
                              buttonTitle: "Yes I'm sure",
                              buttonColour: BackgroundView().deletionColour,
                              action: viewModel.deleteAccount)
                }
                
            }.onAppear{
                viewModel.fetchUser()
                
                
            }
            
        }
    }
}


#Preview {
    SettingsView()
}
