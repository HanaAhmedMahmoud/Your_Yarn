//
//  HomeView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//
import FirebaseFirestoreSwift
import SwiftUI

struct TotalWishlistView: View {
    @StateObject var viewModel: TotalWishlistViewViewModel
    @FirestoreQuery var items: [WishlistItem]
    
    init(userID: String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userID)/wishlistItems")
        self._viewModel = StateObject(
            wrappedValue: TotalWishlistViewViewModel(userId: userID))
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            //wishlist
            VStack{
                HomePageSubtitles(title: "Wishlist", subtitle: "See your current wishlist:", titleColour: BackgroundView().titleColour)
                VStack{
                    List(items) {item in
                        WishlistItemView(item: item)
                            .swipeActions{
                                Button("Delete") {
                                    viewModel.delete(id: item.id)
                                }.tint(BackgroundView().deletionColour)
                                
                            }
                    }.listStyle(PlainListStyle())
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(height: geometry.size.height * 0.3) //make fill 0.3 of screen 
                    
                }
            }.padding()
        }
        
    }
    
}

#Preview {
    TotalWishlistView(userID: "5STjZ0KXl2PT33yDjifv21u3NaE3")
}
