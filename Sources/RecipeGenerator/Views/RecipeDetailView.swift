import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @ObservedObject var viewModel: RecipeViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Header with image placeholder
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 200)
                        .overlay(
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.gray)
                        )
                    
                    VStack(alignment: .leading) {
                        Text(recipe.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(recipe.cuisine)
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding()
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black.opacity(0.7), Color.clear]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                // Recipe info
                VStack(alignment: .leading, spacing: 16) {
                    // Description
                    Text(recipe.description)
                        .italic()
                        .padding(.horizontal)
                    
                    // Time and servings info
                    HStack(spacing: 20) {
                        InfoItem(icon: "clock", title: "Prep", value: "\(recipe.prepTime) min")
                        InfoItem(icon: "flame", title: "Cook", value: "\(recipe.cookTime) min")
                        InfoItem(icon: "person.2", title: "Serves", value: "\(recipe.servings)")
                    }
                    .padding(.horizontal)
                    
                    // Ingredients
                    SectionTitle(title: "Ingredients")
                    
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        HStack(alignment: .top) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 6))
                                .padding(.top, 6)
                            Text(ingredient)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Instructions
                    SectionTitle(title: "Instructions")
                    
                    ForEach(Array(recipe.instructions.enumerated()), id: \.element) { index, instruction in
                        HStack(alignment: .top) {
                            Text("\(index + 1).")
                                .font(.headline)
                                .foregroundColor(.orange)
                            Text(instruction)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                    }
                }
                .padding(.bottom, 30)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    viewModel.toggleFavorite(recipe: recipe)
                }) {
                    Image(systemName: viewModel.isFavorite(recipe: recipe) ? "heart.fill" : "heart")
                        .foregroundColor(viewModel.isFavorite(recipe: recipe) ? .red : .gray)
                }
            }
            
            if presentationMode.wrappedValue.isPresented {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct InfoItem: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.orange)
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

struct SectionTitle: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .padding(.horizontal)
            .padding(.top, 8)
    }
} 