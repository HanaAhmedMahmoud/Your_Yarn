//
//  AddYarnView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct AddYarnView: View {
    @StateObject var viewModel = AddYarnViewViewModel()
    
    // For camera view
    @State var isPickerShowing = false
    @State var selectedImage: UIImage? = nil
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    BackgroundView().backgroundColour.ignoresSafeArea()
                    VStack {
                        
                        GenericTitle(title: "Add to Yarn Collection")
                            .padding(.top, 10)
                        
                        // Camera icon or selected image
                        VStack {
                            if let selectedImage = selectedImage {
                                Image(uiImage: selectedImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: geometry.size.height * 0.3)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.horizontal, geometry.size.width * 0.1)
                                    .padding(.bottom, 10)
                            } else {
                                Button(action: {
                                    // Show the image picker
                                    isPickerShowing = true
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.gray)
                                            .frame(height: geometry.size.height * 0.3)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.white, lineWidth: 1)
                                            )
                                            .padding(.horizontal, geometry.size.width * 0.1)
                                        
                                        VStack {
                                            Image(systemName: "camera")
                                                .foregroundColor(.white)
                                                .font(.system(size: 72))
                                        }
                                    }
                                }
                                .padding(.bottom, 10)
                            }
                        }
                        .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
                            // Image picker
                            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                        }
                        
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
                                              action: viewModel.addToWishlist)
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

