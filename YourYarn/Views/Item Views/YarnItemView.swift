//
//  YarnItemView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 18/07/2024.
//

import SwiftUI

struct YarnItemView: View {
    let item: YarnItem
    let image: UIImage
    
    var body: some View {
        Button{
            //all of yarn info is shown! pop up view needs to be created 
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 1))
                    .frame(width: 150, height: 200)

                VStack(alignment: .leading){
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 130, height: 130)
                        .clipShape(RoundedRectangle(cornerRadius:10))
                    
                    Text(item.yarnName)
                        .font(.body)
                        .foregroundStyle(BackgroundView().titleColour)
                    
                    Text(item.yarnDesc)
                        .font(.footnote)
                        .foregroundStyle(Color(.secondaryLabel))

                }.padding()
            }
        }
    }
}

#Preview{
    YarnItemView(item: YarnItem(id: "123", yarnName: "Pink", yarnType: "DK", yarnWeight: "500g", yarnDesc: "For taylor swift cardigan", yarnImage: "url..", isUsed: false), image: UIImage(named: "GirlKnitting")!)
}
