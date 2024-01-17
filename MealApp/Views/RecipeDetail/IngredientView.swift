//
//  IngredientView.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//

import SwiftUI

struct IngredientView: View {
    var recipe: Recipe?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(0..<max(recipe?.ingredients?.count ?? 0, recipe?.measurements?.count ?? 0), id: \.self) { index in
                let ingredient = recipe?.ingredients?[safe: index] ?? ""
                let measurement = recipe?.measurements?[safe: index] ?? ""

                if !ingredient.isEmpty && !measurement.isEmpty {
                    Text("\(ingredient) - \(measurement)")
                        .foregroundColor(.white)
                }
            }
        }
        .ignoresSafeArea()
        .padding()
    }
}

