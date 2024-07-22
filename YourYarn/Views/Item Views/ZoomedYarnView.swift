//
//  ZoomedYarnView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 21/07/2024.
//

import SwiftUI

struct ZoomedYarnView: View {
    
    @Binding var isActive: Bool
    
    let item: YarnItem
    let image: UIImage
    let action: () -> ()
    
    var body: some View {
        
        ZStack{
            Color(.white)
                .ignoresSafeArea()
                .opacity(0.1)
                .onTapGesture {
                    close()
                }
            
            VStack{
                
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 175, height: 175)
                    .clipShape(RoundedRectangle(cornerRadius:10))
                    .padding()
                
                VStack(alignment: .leading){
                    Grid(alignment: .leadingFirstTextBaseline,
                         horizontalSpacing: 10,
                         verticalSpacing: 15){
                        GridRow{
                            Text("Yarn name: ")
                                .bold()
                                .foregroundStyle(BackgroundView().titleColour)
                            Text(item.yarnName)
                                .foregroundStyle(Color.black)
                        }
                        
                        GridRow{
                            Text("Yarn type: ")
                                .bold()
                                .foregroundStyle(BackgroundView().titleColour)
                            Text(item.yarnType)
                                .foregroundStyle(Color.black)
                        }
                        
                        GridRow{
                            Text("Yarn weight: ")
                                .bold()
                                .foregroundStyle(BackgroundView().titleColour)
                            Text(item.yarnWeight)
                                .foregroundStyle(Color.black)
                        }
                        
                        GridRow{
                            Text("Description: ")
                                .bold()
                                .foregroundStyle(BackgroundView().titleColour)
                            Text(item.yarnDesc)
                                .foregroundStyle(Color.black)
                            
                        }
                        
                    }
                     .lineLimit(2)
                     .frame(width: 250, height: 150, alignment: .leading)
                     .font(.system(size: 15))
                }
            }.padding()
            .frame(width: 300, height: 400)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay{
                VStack{
                    HStack{
                        Spacer()
                        Button{
                            close()
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .fontWeight(.medium)
                        }
                        .tint(BackgroundView().buttonColour)
                    }
                    
                    Spacer()
                }.padding()
                
            }
        }.ignoresSafeArea()
    
    }
           
    func close() {
        isActive = false
    }
}

struct ZoomedYarnViewPreview: PreviewProvider {
    
    static func deleteAccountAction() {
        print("Deleting account...")
    }
    
    static var previews: some View {
        ZoomedYarnView(isActive: .constant(true), item: YarnItem(id: "123", yarnName: "Pink", yarnType: "DK", yarnWeight: "300g", yarnDesc: "Slayed", yarnImage: "url...", isUsed: false), image: UIImage(named: "GirlKnitting")!, action: deleteAccountAction)
    }
}

