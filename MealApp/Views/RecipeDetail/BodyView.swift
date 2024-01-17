//
//  BodyView.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//

import SwiftUI

struct BodyView: View {
    @Binding var showInstruction: Bool
    var body: some View {
        HStack{
            Button{
                showInstruction.toggle()
            }label: {
                Text("Instruction")
                    .font(.title3)
                    .bold()
                    .foregroundColor(showInstruction ? .white : .gray)
                    .padding(.horizontal, 30)
            }
            .scaleEffect(showInstruction ? 1.1 : 0.9)
            Button{
                showInstruction.toggle()
            }label: {
                Text("Ingredients")
                    .font(.title3)
                    .bold()
                    .foregroundColor(showInstruction ? .gray : .white)
                    .padding(.horizontal, 30)
            }
            .scaleEffect(showInstruction ? 0.9 : 1.1)
        }
        .dynamicTypeSize(...DynamicTypeSize.xxLarge)
    }
}
