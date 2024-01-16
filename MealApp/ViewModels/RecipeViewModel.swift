//
//  RecipeViewModel.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipe: Recipe?
    var mealId: String?
    private let dataService: DataService

    init(mealID: String, dataService: DataService = APIService.shared) {
        self.mealId = mealID
        self.dataService = dataService
    }
    
    func fetchRecipeDetails() async {
        if let mealID = mealId {
            do {
                let recipe: Recipe = try await dataService.fetchData(from: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)")
                self.recipe = recipe
                print(self.recipe!.ingredients)
            } catch {
                print("Error fetching recipe details: \(error)")
            }
        }
    }

}
