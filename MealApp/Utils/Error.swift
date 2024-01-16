//
//  Error.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//

import Foundation

enum AppError: Error {
    case invalidUrl
    case requestFailed
    case invalidResponse
    case invalidData
    case decodingError
}
