# MealApp

MealApp is a SwiftUI-based iOS app that provides users with a collection of recipes for various meals. Users can browse different recipes, view details, and get cooking instructions.

## MVVM Architecture:

- **Model:** Represents the data structure of the app. In this case, `RecipeModel.swift` defines the properties of a recipe.

- **View:** SwiftUI views (e.g., `HomeView.swift`, `RecipeDetailView.swift`) responsible for displaying the user interface.

- **ViewModel:** Handles the presentation logic and interacts with the model. `MealsViewModel.swift` and `RecipeViewModel.swift` manage data flow between the model and the view.

## Features:

1. **Recipes Listing (HomeView):** Displays a list of recipes. Users can scroll through various recipes. Also, offers search functionality.

2. **Recipe Details (RecipeDetailView):** Shows detailed information about a selected recipe, including ingredients, instructions, and an image.

3. **Ingredient View (IngredientView):** Displays the ingredients and measurements for a recipe. Handles optional values and avoids displaying empty strings.

4. **MVVM Architecture:** Adopts the Model-View-ViewModel architecture for organized and scalable code.

5. **Testing:** Includes unit tests (`MealsViewModelTests.swift`, `RecipeViewModelTests.swift`) to ensure the functionality of view models.

6. **API Service:** Utilizes `APIService.swift` to fetch data from a live API (`https://themealdb.com/api/json/v1/1/lookup.php?i=`) and `MockDataService.swift` for testing.

7. **Async/Await:** Leverages Swift's async/await to handle asynchronous tasks, such as fetching data.

8. **Dependency Injection:** Injects dependencies into view models, promoting testability.

9. **Responsive UI:** Uses SwiftUI for building responsive and adaptive user interfaces.
