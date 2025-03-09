import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var breakfastRecipes: [Recipe] = []
    @Published var lunchRecipes: [Recipe] = []
    @Published var dinnerRecipes: [Recipe] = []
    @Published var favoriteRecipes: [Recipe] = []
    
    init() {
        loadRecipes()
    }
    
    func loadRecipes() {
        // In a real app, this would fetch from an API or database
        breakfastRecipes = Recipe.sampleBreakfastRecipes
        lunchRecipes = Recipe.sampleLunchRecipes
        dinnerRecipes = Recipe.sampleDinnerRecipes
    }
    
    func getRecipes(for mealType: MealType) -> [Recipe] {
        switch mealType {
        case .breakfast:
            return breakfastRecipes
        case .lunch:
            return lunchRecipes
        case .dinner:
            return dinnerRecipes
        }
    }
    
    func getRandomRecipe(for mealType: MealType) -> Recipe {
        let recipes = getRecipes(for: mealType)
        return recipes.randomElement() ?? recipes[0]
    }
    
    func toggleFavorite(recipe: Recipe) {
        if favoriteRecipes.contains(where: { $0.id == recipe.id }) {
            favoriteRecipes.removeAll { $0.id == recipe.id }
        } else {
            favoriteRecipes.append(recipe)
        }
    }
    
    func isFavorite(recipe: Recipe) -> Bool {
        return favoriteRecipes.contains(where: { $0.id == recipe.id })
    }
} 