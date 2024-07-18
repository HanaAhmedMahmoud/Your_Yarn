//
//  DeleteAccountPopUpView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 04/07/2024.
//

import SwiftUI

struct PopUpView: View {
    
    @Binding var isActive: Bool
    
    let title: String
    let message: String
    let buttonTitle: String
    let buttonColour: Color
    let action: () -> ()
    @State private var offset: CGFloat = 1000
    
    
    var body: some View {
        ZStack{
            // this is so if the user presses outside the alert it closes
            Color(.white)
                .ignoresSafeArea()
                .opacity(0.5)
                .onTapGesture {
                    close()
                }
            VStack{
                
                Text(title)
                    .font(.title2)
                    .bold()
                    .padding()
                
                Text(message)
                    .font(.body)
                    .padding(.bottom)
                
                Button (action:{
                    action()
                    close()
                }) {
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.white)
                        
                        Text(buttonTitle)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(buttonColour)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                    }
                    
                }
            }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay{
                    //this is the x in the corner
                    VStack{
                        HStack{
                            Spacer()
                            Button{
                                close()
                            } label:{
                                Image(systemName: "xmark")
                                    .font(.title2)
                                    .fontWeight(.medium)
                            }.tint(buttonColour)
                            
                        }
                        
                        Spacer()
                        
                    }.padding()
                    
                }
                .shadow(radius:20)
                .padding(30)
                .offset(x: 0, y: offset)
                .onAppear{
                    withAnimation(.spring()){
                        offset = 0
                    }
                }
        }
    }
    
    func close() {
        withAnimation(.spring()){
            offset = 1000
            isActive = false
        }
    }
}


    
    struct PopUpView_Previews: PreviewProvider {
        
        static func deleteAccountAction() {
            // Define what happens when the delete account action is triggered
            print("Deleting account...")
            // You can add actual deletion logic here
        }
        
        static var previews: some View {
            PopUpView(
                isActive:.constant(true),
                title: "Delete Account?",
                message: "Are you sure you want to delete your account?",
                buttonTitle: "Yes I'm sure",
                buttonColour: Color(red: 0.7137, green: 0.051, blue: 0.0471),
                action: deleteAccountAction
            )
        }
    }

