import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: RecipeViewModel
    
    var body: some View {
        TabView {
            RecipeListView(mealType: .breakfast)
                .tabItem {
                    Label("Breakfast", systemImage: "sunrise")
                }
            
            RecipeListView(mealType: .lunch)
                .tabItem {
                    Label("Lunch", systemImage: "sun.max")
                }
            
            RecipeListView(mealType: .dinner)
                .tabItem {
                    Label("Dinner", systemImage: "moon.stars")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
        .accentColor(.orange)
    }
}

struct FavoritesView: View {
    @EnvironmentObject var viewModel: RecipeViewModel
    
    var body: some View {
        NavigationView {
            List {
                if viewModel.favoriteRecipes.isEmpty {
                    Text("No favorite recipes yet")
                        .foregroundColor(.secondary)
                        .padding()
                } else {
                    ForEach(viewModel.favoriteRecipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe, viewModel: viewModel)) {
                            RecipeRow(recipe: recipe, isFavorite: true)
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeViewModel())
    }
} 