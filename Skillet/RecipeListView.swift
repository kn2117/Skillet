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
    
    var body: some View {
        NavigationStack {
            List {
                Text("Recipe 1")
                Text("Recipe 2")
            }
            .navigationTitle("All Recipes")
            .toolbar {
                Text("Edit")
                Image(systemName: "plus")
            }
        }
    }
}

#Preview {
    RecipeListView()
}
