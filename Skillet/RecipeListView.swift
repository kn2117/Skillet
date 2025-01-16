//
//  RecipeListView.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/13/25.
//

import SwiftData
import SwiftUI

struct RecipeListView: View {
    @Query var listOfRecipes: [Recipe]
    @Environment(\.modelContext) var modelContext
    @State private var showingAddRecipe = false
    @State private var recipe = Recipe()
    
    var body: some View {
        NavigationStack {
            List {
                Text("Recipe 1")
                Text("Recipe 2")
            }
            .navigationTitle("All Recipes")
            .toolbar {
                Button {
                    print("Test")
                } label: {
                    Text("Edit")
                }
                Button {
                    showingAddRecipe = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddRecipe) {
                AddRecipeView(recipeToAdd: recipe)
            }
        }
    }
}

#Preview {
    RecipeListView()
}
