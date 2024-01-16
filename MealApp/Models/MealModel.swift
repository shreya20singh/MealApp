//
//  MealModel.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//

import Foundation

struct MealResponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Identifiable {
    let name: String
    let thumbnail: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case id = "idMeal"
    }
}

