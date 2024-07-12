//
//  HomeView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//
import FirebaseFirestoreSwift
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewViewModel
    @FirestoreQuery var items: [WishlistItem]
    
    init(userID: String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userID)/wishlistItems")
        self._viewModel = StateObject(
            wrappedValue: HomeViewViewModel(userId: userID))
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                BackgroundView().backgroundColour.ignoresSafeArea()
                
                //wishlist
                VStack{
                    GenericTitleAndSubtitleView(title: "Wishlist", subtitle: "See your current wishlist:", titleColour: BackgroundView().titleColour)
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
                            
                    }
                }.padding()
                
            }
            
        }
    }
}

#Preview {
    HomeView(userID: "5STjZ0KXl2PT33yDjifv21u3NaE3")
}
