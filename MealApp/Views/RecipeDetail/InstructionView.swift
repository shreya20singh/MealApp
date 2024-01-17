//
//  InstructionView.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//

import SwiftUI

struct InstructionView: View {
    var recipe: Recipe?
    var body: some View {
        Divider()
        ScrollView(showsIndicators: false){
            Text(recipe?.instructions ?? "Instruction detail")
                .padding(.all, 30)
                .foregroundColor(.white)
        }
        .dynamicTypeSize(...DynamicTypeSize.accessibility3)
    }
}
