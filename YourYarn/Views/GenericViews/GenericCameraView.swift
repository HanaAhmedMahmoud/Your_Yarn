//
//  GenericCameraView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 18/07/2024.
//

import SwiftUI

struct GenericCameraView: View {
    @Binding var selectedImage: UIImage?
    @State var isPickerShowing = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if let selectedImage = selectedImage {
                    Button{
                        isPickerShowing = true
                    } label: {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal, geometry.size.width * 0.1)
                            .padding(.bottom, 10)
                    }
                    
                } else {
                    Button {
                        // Show the image picker
                        isPickerShowing = true
                    }label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
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
        }
        
    }
}
