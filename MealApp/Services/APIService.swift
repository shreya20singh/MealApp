//
//  APIService.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//

import Foundation

protocol DataService {
    func fetchData<T: Decodable>(from endpoint: String) async throws -> T
}

class APIService: DataService {
    static let shared = APIService()
    
    private init() { }
    
    func fetchData<T: Decodable>(from endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw AppError.invalidUrl
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw AppError.invalidResponse
            }
            
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw AppError.invalidData
        }
    }
}

