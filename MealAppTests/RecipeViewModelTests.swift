//
//  RecipeViewModelTests.swift
//  MealAppTests
//
//  Created by Shreya Singh on 1/16/24.
//

import Foundation
import XCTest
@testable import MealApp

class RecipeViewModelTests: XCTestCase {
    var mockDataService: MockDataService!
    var recipeViewModel: RecipeViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockDataService = MockDataService()
        recipeViewModel = RecipeViewModel(mealID: "123", dataService: mockDataService)
    }

    override func tearDownWithError() throws {
        mockDataService = nil
        recipeViewModel = nil
        try super.tearDownWithError()
    }
}
