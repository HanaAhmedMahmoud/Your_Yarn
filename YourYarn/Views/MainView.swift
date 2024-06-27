//
//  ContentView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 0.5255, green: 0.4157, blue: 0.6157, alpha:1)
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.749, green: 0.702, blue: 0.7961, alpha: 1)
      }
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
            //signed in so go to home page
            TabView{
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                AddYarnView()
                    .tabItem {
                        Label("Add Yarn", systemImage: "house")
                    }
                AddToolView()
                    .tabItem {
                        Label("Add Tools", systemImage: "house")
                    }
                AddWishListView()
                    .tabItem {
                        Label("Add To Wishlist", systemImage: "wand.and.stars")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
            }.tint(.white)

            
        }
        else{
            OpeningView()
        }
    }
}

#Preview {
    MainView()
}
