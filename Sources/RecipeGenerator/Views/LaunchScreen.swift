import SwiftUI

struct LaunchScreen: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
                .environmentObject(RecipeViewModel())
        } else {
            VStack {
                VStack(spacing: 20) {
                    Image(systemName: "fork.knife")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.orange)
                    
                    Text("Recipe Generator")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Discover delicious recipes")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
            }
            .onAppear {
                // Simulate a delay for the launch screen
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
} 