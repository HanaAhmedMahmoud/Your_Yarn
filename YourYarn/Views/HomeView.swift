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
    let userID: String
    
    init(userID: String){
        self.userID = userID
        self._viewModel = StateObject(
            wrappedValue: HomeViewViewModel(userId: userID))
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                BackgroundView().backgroundColour.ignoresSafeArea()
                VStack{
                    Spacer()
                    GenericTitle(title: "Welcome @")
                    Spacer()
                    TotalYarnView(userID: userID)
                    Spacer()
                    TotalWishlistView(userID: userID)
                    Spacer()
                }
                
            }
            
        }
    }
}

#Preview {
    HomeView(userID: "5STjZ0KXl2PT33yDjifv21u3NaE3")
}
