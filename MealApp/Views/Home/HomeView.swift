//
//  HomeView.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = MealsViewModel()
    @State var selectedMealID: String?

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchText.isEmpty ? viewModel.meals : viewModel.filteredMeals) { meal in
                        NavigationLink(
                            destination: RecipeDetailView(recipeId: meal.id),
                            tag: meal.id,
                            selection: $selectedMealID
                        ) {
                            CardView(meal: meal)
                        }
                        .onTapGesture {
                            selectedMealID = meal.id
                        }
                    }
                }
            }
            .padding()
            .refreshable {
                Task {
                    viewModel.fetchMeals()
                }
            }
            .navigationTitle("Recipes")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
            //.background(Color.gray.opacity(0.8))
        }
        .alert(isPresented: $viewModel.isShowingErrorAlert) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorAlertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
        .onChange(of: viewModel.searchText) {
            viewModel.filterMeals()
        }
    }
}
