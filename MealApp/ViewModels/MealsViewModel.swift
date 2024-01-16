//
//  MealsViewModel.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//

import Foundation

class MealsViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var filteredMeals: [Meal] = []
    @Published var mealsResponse: MealResponse?
    @Published var isShowingErrorAlert = false
    @Published var errorAlertMessage = ""
    @Published var searchText = ""

    private let apiService: DataService

    init(apiService: DataService = APIService.shared) {
        self.apiService = apiService
        fetchMeals()
        populateMeals()
    }

    func fetchMeals() {
        Task {
            do {
                let response: MealResponse = try await apiService.fetchData(from: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
                print("Fetched \(response.meals.count) meals")
                DispatchQueue.main.async {
                    self.mealsResponse = response
                    self.populateMeals()
                }
            } catch let appError as AppError {
                handleAppError(appError)
            } catch {
                handleUnknownError()
            }
        }
    }

    func filterMeals() {
        if searchText.isEmpty {
            filteredMeals = mealsResponse?.meals ?? []
        } else {
            filteredMeals = mealsResponse?.meals.filter { meal in
                return meal.name.lowercased().contains(searchText.lowercased())
            } ?? []
        }
    }

    private func populateMeals() {
        meals = mealsResponse?.meals ?? []
    }

    private func handleAppError(_ appError: AppError) {
        DispatchQueue.main.async {
            self.isShowingErrorAlert = true
            self.errorAlertMessage = appError.localizedDescription
            print("Failed to fetch meals: \(appError)")
        }
    }

    private func handleUnknownError() {
        DispatchQueue.main.async {
            self.isShowingErrorAlert = true
            self.errorAlertMessage = "Unexpected Error"
            print("Unexpected Error")
        }
    }
}
