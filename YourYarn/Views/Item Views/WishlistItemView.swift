//
//  WishlistItemView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct WishlistItemView: View {
    @StateObject var viewModel = ToggleItemViewViewModel()
    let item: WishlistItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.itemName)
                    .font(.body)
                
                Text(item.itemDesc)
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            }label: {
                Image(systemName: item.isBought ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(BackgroundView().buttonColour)
            }
        }
    }
}

#Preview {
    WishlistItemView(item: .init(id: "12", itemName: "pink yarn", itemDesc: "for cardigan", isBought: true))
}
