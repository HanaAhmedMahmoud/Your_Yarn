//
//  AddWishListView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct AddWishListView: View {
    @StateObject var viewModel = WishlistViewModel()
    var body: some View {
        GeometryReader { geometry in
            NavigationView{
                ZStack{
                    BackgroundView().backgroundColour.ignoresSafeArea()
                    VStack{
                        
                        Spacer().frame(height: geometry.size.height * 0.05)
                        
                        GenericTitle(title: "Add to wishlist")
                        
                        TextField("Enter item name:", text: $viewModel.itemName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, geometry.size.width * 0.1)
                        
                        TextField("Extra information:", text: $viewModel.itemDesc, axis: .vertical)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .lineLimit(5, reservesSpace: true)
                            .padding(.horizontal, geometry.size.width * 0.1)
                        
                        GenericButtonView(buttonText: "Add To Wishlist",
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
    AddWishListView()
}
