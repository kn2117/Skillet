//
//  RecipeListView.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/13/25.
//

import SwiftUI

struct RecipeListView: View {
    var listOfRecipes: [Recipe] = []
    
    var body: some View {
        NavigationStack {
            List {
                Text("Recipe 1")
                Text("Recipe 2")
            }
            .navigationTitle("All Recipes")
        }
    }
}

#Preview {
    RecipeListView()
}
