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
        HStack{
            VStack(alignment: .leading){
                
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text(item.yarnName)
                    .font(.body)
                
                Text(item.yarnType)
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }.padding()
            
        }
    }
}

