//
//  AddYarnView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct AddYarnView: View {
    @StateObject var viewModel = AddYarnViewViewModel()
    var body: some View {
        GeometryReader { geometry in
            NavigationView{
                ZStack{
                    BackgroundView().backgroundColour.ignoresSafeArea()
                    VStack{
                        
                        GenericTitle(title: "Add to Yarn Collection")
                        
                        //camera icon 
                        ZStack{
                            Rectangle()
                                .fill(Color.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                                .padding(.bottom)
                                .padding(.horizontal, geometry.size.width * 0.1)
                                
                            VStack{
                                Image(systemName: "camera")
                                    .foregroundStyle(Color.white)
                                    .font(.system(size: 72))
                            }
                            
                        }.frame(height: geometry.size.height * 0.4)
                        
                        
                        VStack{
                            GenericSmallTextField(textDesc: "Enter yarn name", action: $viewModel.yarnName)
                                .padding(.horizontal, geometry.size.width * 0.1)
                            
                            GenericSmallTextField(textDesc: "Enter yarn type", action: $viewModel.yarnType)
                                .padding(.horizontal, geometry.size.width * 0.1)
                            
                            GenericSmallTextField(textDesc: "Enter yarn weight", action: $viewModel.yarnWeight)
                                .padding(.horizontal, geometry.size.width * 0.1)

                            GenericLargeTextField(textDesc: "Extra information", action: $viewModel.yarnDesc)
                                .padding(.horizontal, geometry.size.width * 0.1)
                            
                            GenericButtonView(buttonText: "Add To Collection",
                                              buttonColour: BackgroundView().buttonColour,
                                              textColour: Color.white,
                                              buttonOutline: Color.white,
                                              action: viewModel.addToWishlist)
                            .padding(.horizontal)
                            .padding(.top, 5)
                        }.frame(height: geometry.size.height * 0.4)
                        
                        
                        VStack{
                            if !viewModel.errorMessage.isEmpty{
                                Text(viewModel.errorMessage).foregroundStyle(Color.red).padding(.horizontal, geometry.size.width * 0.1)
                            }
                            if !viewModel.successMessage.isEmpty{
                                Text(viewModel.successMessage).foregroundStyle(Color.green)
                            }
                        }.frame(height: geometry.size.height * 0.1)
                            .padding(.bottom, 10)
    
                            
                        

                        
                    }
                }
            }
        }
    }
}

#Preview {
    AddYarnView()
}
