//
//  ContentView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 15/06/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
            //signed in so go to home page
            HomeView(); 
        }
        else{
            OpeningView()
        }
    }
}

#Preview {
    MainView()
}
