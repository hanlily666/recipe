import SwiftUI

struct RecipeListView: View {
    let mealType: MealType
    @EnvironmentObject var viewModel: RecipeViewModel
    @State private var isShowingRandomRecipe = false
    @State private var randomRecipe: Recipe?
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: {
                        randomRecipe = viewModel.getRandomRecipe(for: mealType)
                        isShowingRandomRecipe = true
                    }) {
                        HStack {
                            Image(systemName: "dice")
                                .foregroundColor(.orange)
                            Text("Generate Random Recipe")
                                .foregroundColor(.primary)
                        }
                    }
                }
                
                Section {
                    ForEach(viewModel.getRecipes(for: mealType)) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe, viewModel: viewModel)) {
                            RecipeRow(recipe: recipe, isFavorite: viewModel.isFavorite(recipe: recipe))
                        }
                    }
                }
            }
            .navigationTitle(mealType.rawValue)
            .sheet(isPresented: $isShowingRandomRecipe) {
                if let recipe = randomRecipe {
                    RecipeDetailView(recipe: recipe, viewModel: viewModel)
                }
            }
        }
    }
}

struct RecipeRow: View {
    let recipe: Recipe
    let isFavorite: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                HStack {
                    Image(systemName: "clock")
                    Text("\(recipe.totalTime) min")
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
            
            // Placeholder for image
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 60, height: 60)
                .overlay(
                    Image(systemName: "photo")
                        .foregroundColor(.gray)
                )
        }
        .padding(.vertical, 4)
    }
} 