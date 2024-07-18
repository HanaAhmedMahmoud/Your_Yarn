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
            NavigationView {
                ZStack {
                    BackgroundView().backgroundColour.ignoresSafeArea()
                    VStack {
                        GenericTitle(title: "Add to Yarn Collection")
                            .padding(.top, 10)
                        
                        // Camera icon or selected image
                        GenericCameraView(selectedImage: $viewModel.selectedImage)
                                                    .frame(height: geometry.size.height * 0.3)
                        
                        VStack {
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
                                              action: viewModel.addToYarns)
                                .padding(.horizontal, geometry.size.width * 0.1)
                                .padding(.top, 5)
                        }
                        
                        VStack {
                            if !viewModel.errorMessage.isEmpty {
                                Text(viewModel.errorMessage)
                                    .foregroundColor(.red)
                                    .padding(.horizontal, geometry.size.width * 0.1)
                            }
                            if !viewModel.successMessage.isEmpty {
                                Text(viewModel.successMessage)
                                    .foregroundColor(.green)
                                    .padding(.horizontal, geometry.size.width * 0.1)
                            }
                        }
                        .padding(.bottom, 10)
                    }
                    .padding(.horizontal, geometry.size.width * 0.05)
                }
            }
        }
    }
}

#Preview {
    AddYarnView()
}

