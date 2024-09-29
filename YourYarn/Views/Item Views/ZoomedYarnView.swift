//
//  ZoomedYarnView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 21/07/2024.
//

import SwiftUI

struct ZoomedYarnView: View {
    
    @StateObject var viewModel = YarnViewViewModel()
    @Binding var isActive: Bool
    @State var edit = false
    
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
                
                //if the edit button is not pressed
                if !edit{
                    
                    //Title
                    GenericTitle(title: item.yarnName)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    //Generic title
                    Grid(alignment: .leadingFirstTextBaseline,
                         horizontalSpacing: 10,
                         verticalSpacing: 15){
                        
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
                        }
                        
                        ScrollView {
                            Text(item.yarnDesc)
                                .foregroundStyle(Color.black)
                        }
                        .defaultScrollAnchor(.bottom)
                        
                    }
                     .frame(width: 250, height: 150, alignment: .leading)
                     .font(.system(size: 15))
                }
                
                //if the edit button IS pressed
                else{
                    // Title
                    GenericTitle(title: "Edit below")
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    // TextFields
                    VStack(spacing: 10) {
                        GenericSmallTextField(textDesc: item.yarnName, action: $viewModel.yarnName)
                        
                        GenericSmallTextField(textDesc: item.yarnWeight, action: $viewModel.yarnWeight)
                        
                        GenericLargeTextField(textDesc: item.yarnDesc, action: $viewModel.yarnDesc)
                    }
                    .frame(width: 250)
                    .font(.system(size: 15))
                }
                
                HStack{
                    
                    if !edit{
                        //Show edit button
                        GenericButtonView(buttonText: "Edit", buttonColour: BackgroundView().backgroundColour, textColour: BackgroundView().titleColour, buttonOutline: BackgroundView().titleColour, action: editPressed)
                    }
                    else{
                        //Show done button
                        GenericButtonView(buttonText: "Done", buttonColour: BackgroundView().backgroundColour, textColour: BackgroundView().titleColour, buttonOutline: BackgroundView().titleColour, action: donePressed)
                    }

                    
                    //Delete button
                    GenericButtonView(buttonText: "Delete", buttonColour: BackgroundView().deletionColour, textColour: Color.white, buttonOutline: Color.black, action: deletePressed)
                    
                }
                
            }.padding()
            .frame(width: 300, height: 350)
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
    
    
    func deletePressed() {
        
    }
    
    func editPressed() {
        edit = true
    }
    
    func donePressed() {
        edit = false
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

