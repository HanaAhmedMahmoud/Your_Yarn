//
//  ContentView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    @State private var selectedTab = 0
    
    init() {
        UITabBar.appearance().backgroundColor = BackgroundView().tabBarColour
        UITabBar.appearance().unselectedItemTintColor = BackgroundView().unselectedColour
    }
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
            // Signed in, so go to home page
            TabView(selection: $selectedTab) {
                HomeView(userID: viewModel.currentUserID)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(0)
                AddYarnView()
                    .tabItem {
                        TabItemView(title: "Add Yarn", imageName: "Wool", isSelected: selectedTab == 1)
                    }
                    .tag(1)
                AddToolView()
                    .tabItem {
                        TabItemView(title: "Add Tools", imageName: "Tool", isSelected: selectedTab == 2)
                    }
                    .tag(2)
                AddWishListView()
                    .tabItem {
                        Label("Add To Wishlist", systemImage: "wand.and.stars")
                    }
                    .tag(3)
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
                    .tag(4)
            }
            .tint(.white)
        } else {
            OpeningView()
            //so when you open the app it always open on the home page
                .onAppear(){
                    selectedTab = 0
                }
        }
    }
}

#Preview {
    MainView()
}
