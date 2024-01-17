//
//  DataServiceTest.swift
//  MealAppTests
//
//  Created by Shreya Singh on 1/15/24.
//

import Foundation
import XCTest
@testable import MealApp

class MockDataService: DataService {
    func fetchData<T: Decodable>(from endpoint: String) async throws -> T {
        
        let mockJSON = """
        {
          "meals": [
            {
              "idMeal": "123",
              "strMeal": "Mock Meal 1",
              "strCategory": "Mock Category",
              "strInstructions": "Mock Instructions",
              "strMealThumb": "https://example.com/mock-image.jpg"
            },
            {
              "idMeal": "456",
              "strMeal": "Mock Meal 2",
              "strCategory": "Mock Category",
              "strInstructions": "Mock Instructions",
              "strMealThumb": "https://example.com/mock-image.jpg"
            }
          ]
        }
        """

        let data = mockJSON.data(using: .utf8)!
        let decoder = JSONDecoder()

        do {
            let mockResponse: T = try decoder.decode(T.self, from: data)
            return mockResponse
        } catch {
            throw error
        }
    }
}


