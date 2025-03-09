import SwiftUI

@main
struct RecipeGeneratorApp: App {
    @StateObject private var recipeViewModel = RecipeViewModel()
    
    var body: some Scene {
        WindowGroup {
            LaunchScreen()
        }
    }
} 