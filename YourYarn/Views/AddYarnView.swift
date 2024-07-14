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
                        
                        Spacer().frame(height: geometry.size.height * 0.05)
                        
                        GenericTitle(title: "Add to Yarn Collection")
                        
                        TextField("Enter yarn name:", text: $viewModel.yarnName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, geometry.size.width * 0.1)
                        
                        TextField("Enter yarn type:", text: $viewModel.yarnType)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, geometry.size.width * 0.1)
                        
                        TextField("Enter yarn weight:", text: $viewModel.yarnWeight)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, geometry.size.width * 0.1)
                        
                        
                        TextField("Extra information:", text: $viewModel.yarnDesc)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, geometry.size.width * 0.1)
                        
                        
                        
                        GenericButtonView(buttonText: "Add To Collection",
                                          buttonColour: BackgroundView().buttonColour,
                                          textColour: Color.white,
                                          buttonOutline: Color.white,
                                          action: viewModel.addToWishlist)
                        .padding()
                        
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage).foregroundStyle(Color.red).padding(.horizontal, geometry.size.width * 0.1)
                        }
                        
                        if !viewModel.successMessage.isEmpty{
                            Text(viewModel.successMessage).foregroundStyle(Color.green)
                        }
                        
                        Spacer()
                        
                    }
                }
            }
        }
    }
}

#Preview {
    AddYarnView()
}
