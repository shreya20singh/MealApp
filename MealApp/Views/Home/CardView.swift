//
//  CardView.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//

import SwiftUI

import SwiftUI

// Resuable view to display each dessert
struct CardView: View {
    var meal: Meal?
    var body: some View {
        ZStack{
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .cornerRadius(10)
                .foregroundStyle(Color.white.opacity(0.9))
                //.background(Color.white.opacity(0.5))
                .shadow(radius: 2)
                .padding(.horizontal, 10)
            HStack{
                // Image view that supports cache mechanism
                
                ImageCache(url: URL(string: meal?.thumbnail ?? ""))
                Text(meal?.name ?? "Dessert Name")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                    .lineLimit(2)
                    .dynamicTypeSize(...DynamicTypeSize.accessibility1)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 30)
        }
    }
}


#Preview {
    CardView()
}

