//
//  ImageView.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//

import SwiftUI

struct ImageView: View {
    var recipe: Recipe?
    
    var body: some View {
        if let imageURLString = recipe?.imageURL?.absoluteString, let imageURL = URL(string: imageURLString) {
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
        } else {
            Image(systemName: "photo") // Placeholder image when imageURL is nil or invalid
                .resizable()
        }
    }
}

