//
//  ImageLoader.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//

import Foundation
import UIKit


@MainActor
class ImageLoader: ObservableObject{
    @Published var uiImage: UIImage?
    static let cache = NSCache<NSString, UIImage>()
    private var task: Task<Void, Error>?
    
    // Function to fetch an image from a given URL asynchronously
    func fetchImage(_ url: URL?) async throws{
        
        guard let url = url else{
            throw NetworkError.badUrl
        }
        
        // Cancel any ongoing task to avoid multiple requests for the same URL
        task?.cancel()
        
        let request = URLRequest(url: url)
        
        // Check if image is already cached
        if let cachedImage = Self.cache.object(forKey: url.absoluteString as NSString){
            uiImage = cachedImage
        }else{
            task = Task{
                do{
                    let (data, response) = try await URLSession.shared.data(for: request)
                    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                        throw NetworkError.badRequest
                    }
                    
                    guard let image = UIImage(data: data) else{
                        throw NetworkError.badImage
                    }
                    
                    uiImage = image
                    
                    // Cache the image if it has not been cached yet
                    Self.cache.setObject(image, forKey: url.absoluteString as NSString)
                }catch{
                    print(error)
                }
            }
        }
    }
}

enum NetworkError: Error{
    case badUrl
    case badRequest
    case badImage
}
