import Foundation

enum MealType: String, CaseIterable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
}

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let ingredients: [String]
    let instructions: [String]
    let prepTime: Int // in minutes
    let cookTime: Int // in minutes
    let servings: Int
    let imageURL: URL?
    let mealType: MealType
    let cuisine: String
    
    var totalTime: Int {
        return prepTime + cookTime
    }
}

// Sample recipes for testing
extension Recipe {
    static let sampleBreakfastRecipes: [Recipe] = [
        Recipe(
            name: "Classic Pancakes",
            description: "Fluffy and delicious pancakes perfect for a weekend breakfast.",
            ingredients: [
                "1 cup all-purpose flour",
                "2 tablespoons sugar",
                "2 teaspoons baking powder",
                "1/2 teaspoon salt",
                "1 cup milk",
                "2 tablespoons melted butter",
                "1 large egg"
            ],
            instructions: [
                "In a large bowl, whisk together flour, sugar, baking powder, and salt.",
                "In another bowl, beat the egg, then add milk and melted butter.",
                "Pour the wet ingredients into the dry ingredients and stir until just combined.",
                "Heat a lightly oiled griddle or frying pan over medium-high heat.",
                "Pour the batter onto the griddle, using approximately 1/4 cup for each pancake.",
                "Cook until bubbles form and the edges are dry, then flip and cook until browned on the other side."
            ],
            prepTime: 10,
            cookTime: 15,
            servings: 4,
            imageURL: URL(string: "https://example.com/pancakes.jpg"),
            mealType: .breakfast,
            cuisine: "American"
        ),
        Recipe(
            name: "Avocado Toast",
            description: "Simple and nutritious avocado toast with a variety of toppings.",
            ingredients: [
                "2 slices of whole grain bread",
                "1 ripe avocado",
                "1/2 lemon, juiced",
                "Salt and pepper to taste",
                "Red pepper flakes (optional)",
                "2 eggs (optional)"
            ],
            instructions: [
                "Toast the bread until golden and firm.",
                "In a small bowl, mash the avocado with lemon juice, salt, and pepper.",
                "Spread the mashed avocado on the toast.",
                "If desired, top with a fried or poached egg.",
                "Sprinkle with red pepper flakes if you want some heat."
            ],
            prepTime: 5,
            cookTime: 5,
            servings: 2,
            imageURL: URL(string: "https://example.com/avocado-toast.jpg"),
            mealType: .breakfast,
            cuisine: "Modern"
        )
    ]
    
    static let sampleLunchRecipes: [Recipe] = [
        Recipe(
            name: "Chicken Caesar Salad",
            description: "A classic Caesar salad with grilled chicken, crisp romaine, and homemade dressing.",
            ingredients: [
                "2 boneless, skinless chicken breasts",
                "1 large head of romaine lettuce",
                "1/2 cup Caesar dressing",
                "1/2 cup croutons",
                "1/4 cup grated Parmesan cheese",
                "Salt and pepper to taste"
            ],
            instructions: [
                "Season chicken breasts with salt and pepper, then grill until cooked through.",
                "Let chicken rest for 5 minutes, then slice into strips.",
                "Wash and chop the romaine lettuce, then place in a large bowl.",
                "Add the sliced chicken, croutons, and Parmesan cheese.",
                "Drizzle with Caesar dressing and toss to combine."
            ],
            prepTime: 10,
            cookTime: 15,
            servings: 2,
            imageURL: URL(string: "https://example.com/caesar-salad.jpg"),
            mealType: .lunch,
            cuisine: "Italian-American"
        ),
        Recipe(
            name: "Vegetable Wrap",
            description: "A healthy vegetable wrap with hummus and fresh vegetables.",
            ingredients: [
                "2 large flour tortillas",
                "1/2 cup hummus",
                "1 cucumber, sliced",
                "1 bell pepper, sliced",
                "1 carrot, grated",
                "1/4 red onion, thinly sliced",
                "Handful of spinach leaves"
            ],
            instructions: [
                "Spread hummus evenly over each tortilla.",
                "Layer the vegetables on top of the hummus.",
                "Roll up the tortilla tightly, tucking in the sides as you go.",
                "Cut in half diagonally and serve."
            ],
            prepTime: 10,
            cookTime: 0,
            servings: 2,
            imageURL: URL(string: "https://example.com/vegetable-wrap.jpg"),
            mealType: .lunch,
            cuisine: "Mediterranean"
        )
    ]
    
    static let sampleDinnerRecipes: [Recipe] = [
        Recipe(
            name: "Spaghetti Bolognese",
            description: "Classic Italian pasta dish with a rich meat sauce.",
            ingredients: [
                "1 lb spaghetti",
                "1 lb ground beef",
                "1 onion, diced",
                "2 cloves garlic, minced",
                "1 can (28 oz) crushed tomatoes",
                "2 tablespoons tomato paste",
                "1 teaspoon dried oregano",
                "1 teaspoon dried basil",
                "Salt and pepper to taste",
                "Grated Parmesan cheese for serving"
            ],
            instructions: [
                "Cook spaghetti according to package instructions.",
                "In a large pan, brown the ground beef over medium heat.",
                "Add onion and garlic, cook until softened.",
                "Stir in crushed tomatoes, tomato paste, and herbs.",
                "Simmer for 20 minutes, season with salt and pepper.",
                "Serve sauce over cooked spaghetti, topped with Parmesan cheese."
            ],
            prepTime: 10,
            cookTime: 30,
            servings: 4,
            imageURL: URL(string: "https://example.com/spaghetti.jpg"),
            mealType: .dinner,
            cuisine: "Italian"
        ),
        Recipe(
            name: "Baked Salmon",
            description: "Healthy baked salmon with lemon and herbs.",
            ingredients: [
                "4 salmon fillets",
                "2 tablespoons olive oil",
                "2 cloves garlic, minced",
                "1 lemon, sliced",
                "2 tablespoons fresh dill, chopped",
                "Salt and pepper to taste"
            ],
            instructions: [
                "Preheat oven to 375°F (190°C).",
                "Place salmon fillets on a baking sheet lined with parchment paper.",
                "Drizzle with olive oil and sprinkle with garlic, salt, and pepper.",
                "Top with lemon slices and dill.",
                "Bake for 15-20 minutes, until salmon flakes easily with a fork."
            ],
            prepTime: 5,
            cookTime: 20,
            servings: 4,
            imageURL: URL(string: "https://example.com/salmon.jpg"),
            mealType: .dinner,
            cuisine: "Scandinavian"
        )
    ]
    
    static func getSampleRecipes(for mealType: MealType) -> [Recipe] {
        switch mealType {
        case .breakfast:
            return sampleBreakfastRecipes
        case .lunch:
            return sampleLunchRecipes
        case .dinner:
            return sampleDinnerRecipes
        }
    }
    
    static func getRandomRecipe(for mealType: MealType) -> Recipe {
        let recipes = getSampleRecipes(for: mealType)
        return recipes.randomElement() ?? recipes[0]
    }
} 