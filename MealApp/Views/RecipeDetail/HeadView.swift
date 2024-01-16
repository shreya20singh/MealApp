//
//  HeadView.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//

import SwiftUI

struct HeadView: View {
    var recipe: Recipe?
    var body: some View {
        VStack {
            Text(recipe?.mealName ?? "Recipe")
                .frame(maxWidth: 390, alignment: .center)
                .font(.title)
                .bold()
        }
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
        .padding(.bottom)
    }
}

#Preview {
    HeadView()
}
