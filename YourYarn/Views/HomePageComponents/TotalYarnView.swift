//
//  TotalYarnView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 14/07/2024.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TotalYarnView: View {
    @StateObject var viewModel: TotalYarnViewViewModel
    @FirestoreQuery var items: [YarnItem]
    
    init(userID: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userID)/yarnItems")
        self._viewModel = StateObject(
            wrappedValue: TotalYarnViewViewModel(userId: userID))
    }
    
    var body: some View {
        VStack {
            GenericHomePageSubtitles(
                title: "Yarns and Wools",
                subtitle: "Browse yarns and wools in your collection",
                titleColour: BackgroundView().titleColour)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    if viewModel.retrievedImages.isEmpty {
                        VStack{
                                Text("Loading images...")
                                    .foregroundStyle(Color.gray)
                                Spacer()
                        }.frame(width: 150, height: 150)

                    } else {
                        ForEach(Array(zip(items, viewModel.retrievedImages)), id: \.0.id) { (item, image) in
                            YarnItemView(item: item, image: image)
                        }
                    }
                }
                .onAppear {
                    viewModel.retrieveYarnPhotos()
                }
            }
        }.padding()
    }
}

#Preview {
    TotalYarnView(userID: "5STjZ0KXl2PT33yDjifv21u3NaE3")
}

