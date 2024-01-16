//
//  RecipeDetailView.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//
import SwiftUI

struct RecipeDetailView: View {
    @StateObject var recipeViewModel: RecipeViewModel
    @State private var showInstruction: Bool = true
    var recipeId: String?

    // Use initializer to pass the meal ID to RecipeViewModel
    init(recipeId: String) {
        self._recipeViewModel = StateObject(wrappedValue: RecipeViewModel(mealID: recipeId))
        self.recipeId = recipeId
    }

    var body: some View {
        GeometryReader { geo in
            VStack {
                ImageView(recipe: recipeViewModel.recipe)
                    .frame(width: geo.size.width, height: geo.size.height * 0.38)

//                HeadView(recipe: $recipeViewModel.recipes.first)
//
//                BodyView(showInstruction: $showInstruction)

                if showInstruction {
//                    InstructionView(recipe: recipeViewModel.recipes.first)
                } else {
//                    IngredientView(ingredients: recipeViewModel.ingredients)
                }
            }
            .ignoresSafeArea()
            .task {
                await recipeViewModel.fetchRecipeDetails()
            }
        }
    }
}


