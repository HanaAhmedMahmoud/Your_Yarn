//
//  YarnItemView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 18/07/2024.
//

import SwiftUI

struct YarnItemView: View {
    
    @StateObject var viewModel = YarnViewViewModel()
    @State var isActive: Bool = false
    
    let item: YarnItem
    let image: UIImage
    
    var body: some View {
        Button{
            isActive = true
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 1))
                    .frame(width: 150, height: 200)

                VStack{
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 125, height: 125)
                        .clipShape(RoundedRectangle(cornerRadius:10))
                        .padding(.top, 10)
                        .padding(.bottom, 5)
                    
                    Text(item.yarnName)
                        .font(.body)
                        .foregroundStyle(BackgroundView().titleColour)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .frame(width: 130, height: 10, alignment: .leading)
                    
                    Text(item.yarnDesc)
                        .font(.footnote)
                        .foregroundStyle(Color(.secondaryLabel))
                        .lineLimit(2)
                        .truncationMode(.tail)
                        .frame(width: 130, height: 35, alignment: .topLeading)

                }.padding(.horizontal)
                
                if isActive {
                    ZoomedYarnView(isActive: $isActive, item: item, image: image, action: {
                        print("make a delete yarn thing")
                    })
                }
            }
        }
    }
}

#Preview{
    YarnItemView(item: YarnItem(id: "123", yarnName: "Pink", yarnType: "DK", yarnWeight: "500g", yarnDesc: "For taylor swift cardigan", yarnImage: "url..", isUsed: false), image: UIImage(named: "GirlKnitting")!)
}
