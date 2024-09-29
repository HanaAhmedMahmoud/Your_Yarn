//
//  EditYarnView.swift
//  YourYarn
//
//  Created by Hana Mahmoud on 28/09/2024.
//

import SwiftUI

struct EditYarnView: View {
    
    @StateObject var viewModel = YarnViewViewModel()
    @Binding var isActive: Bool
    
    let item: YarnItem
    
    var body: some View {
        
        ZStack{
            Color.black.opacity(0.5)
                .ignoresSafeArea()
                .onTapGesture {
                    close()
                }
            
            VStack{
                
                // Title
                GenericTitle(title: "Edit below")
                    .frame(maxWidth: .infinity, alignment: .center)
                
                // TextFields
                VStack(spacing: 10) {
                    GenericSmallTextField(textDesc: "Enter new yarn name", action: $viewModel.yarnName)
                    
                    GenericSmallTextField(textDesc: "Enter new yarn weight", action: $viewModel.yarnWeight)
                    
                    GenericLargeTextField(textDesc: "Enter new yarn description", action: $viewModel.yarnDesc)
                }
                .frame(width: 250)
                .font(.system(size: 15))
                
                // Buttons
                HStack(spacing: 20) {
                    GenericButtonView(
                        buttonText: "Done",
                        buttonColour: BackgroundView().backgroundColour,
                        textColour: BackgroundView().titleColour,
                        buttonOutline: BackgroundView().titleColour,
                        action: editPressed
                    )
                    
                    GenericButtonView(
                        buttonText: "Delete",
                        buttonColour: BackgroundView().deletionColour,
                        textColour: Color.white,
                        buttonOutline: Color.black,
                        action: deletePressed
                    )
                }
                .padding(.top)
            }
            .padding()
            .frame(width: 300, height: 350)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            close()
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .fontWeight(.medium)
                        }
                        .tint(BackgroundView().buttonColour)
                    }
                    Spacer()
                }
                .padding()
            )
        }
        .ignoresSafeArea()
    }
    
    // MARK: - Functions
    
    func close() {
        isActive = false
    }
    
    func editPressed() {
        // Example of edit logic - might involve updating your viewModel
        viewModel.editYarns(yarnID: item.id)
        close()
    }
    
    func deletePressed() {
        // Placeholder for delete action
        viewModel.deleteYarn()
        close()
    }
}

struct EditYarnViewPreview: PreviewProvider {
    
    static func deleteAccountAction() {
        print("Deleting account...")
    }
    
    static var previews: some View {
        EditYarnView(
            isActive: .constant(true),
            item: YarnItem(id: "123", yarnName: "Pink", yarnType: "DK", yarnWeight: "300g", yarnDesc: "Slayed", yarnImage: "url...", isUsed: false)
        )
    }
}

