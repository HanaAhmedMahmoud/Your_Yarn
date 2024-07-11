//
//  HomeView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//
import FirebaseFirestoreSwift
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewViewModel()
    @FirestoreQuery var items: [WishlistItem]
    
    
    init(userID: String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userID)/wishlistItems")
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                BackgroundView().backgroundColour.ignoresSafeArea()
                VStack{
                    GenericTitle(title: "Wishlist:")
                    VStack{
                        List(items) {item in
                            Text(item.itemName)
                        }
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    HomeView(userID: "5STjZ0KXl2PT33yDjifv21u3NaE3")
}
