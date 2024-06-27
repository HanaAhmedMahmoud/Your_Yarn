//
//  ProfileView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingViewViewModel()
    var body: some View {
        GeometryReader { geometry in
            
            NavigationView{
                ZStack{
                    
                    //background colour
                    Color(red: 0.9686, green: 0.9176, blue: 0.9922)
                        .ignoresSafeArea()
                    
                    VStack{
                        
                        
                        Text("Settings")
                            .bold()
                            .font(.title)
                            .foregroundStyle(Color(red: 0.3569, green: 0.0039, blue: 0.4824))
                            .padding(.all)
                        
                        
                        
                        // Info: Name, email, edit account
                        VStack(alignment: .leading){
                            Grid(alignment: .leadingFirstTextBaseline,
                                 horizontalSpacing: 100,
                                 verticalSpacing: 10){
                                GridRow{
                                    Text("Username: ")
                                        .bold()
                                    Text("Hana ")
                                }
                                
                                GridRow{
                                    Text("Email: ")
                                        .bold()
                                    Text("Hana ")
                                }
                                
                                GridRow{
                                    Text("Member Since: ")
                                        .bold()
                                    Text("Hana ")
                                }
                                
                            }
                        }.padding(.all)
                        
                        
                        
                        VStack
                        {
                            // sign out
                            Button(action: {
                                viewModel.logout()
                            }) {
                                Text("Log out")
                                    .frame(maxWidth: .infinity, minHeight: 50)
                                    .background(Color(red: 0.5255, green: 0.4157, blue: 0.6157))
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.white, lineWidth: 1)
                                    )
                                
                            }
                            
                            // delete account
                            Button(action: {
                                // code to delete account
                            }) {
                                Text("Delete account")
                                    .frame(maxWidth: .infinity, minHeight: 50)
                                    .background(Color(red: 0.7137, green: 0.051, blue: 0.0471))
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                        }.padding(.horizontal, geometry.size.width * 0.1)
                        
                        
                        Spacer()
                    }
                }
                
            }
        }
    }
}

#Preview {
    SettingsView()
}
