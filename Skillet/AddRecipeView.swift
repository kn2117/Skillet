//
//  AddRecipeView.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/13/25.
//

import SwiftUI

struct AddRecipeView: View {
    @State private var recipeNameInput = ""
    @State private var ingredientInput = ""
    @State private var directionInput = ""
    var recipeToAdd: Recipe
    var body: some View {
        NavigationStack {
            List {
                Section("Name") {
                    TextField("Enter name", text: $recipeNameInput)
                }
                Section("Ingredients") {
                    TextEditor(text: $ingredientInput)
                        .padding([.bottom, .leading, .trailing], -5)
                }
                Section("Directions") {
                    TextEditor(text: $directionInput)
                        .padding([.bottom, .leading, .trailing], -5)
                }
            }
            .navigationTitle("Add Recipe")
            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
            .toolbar {
                Text("Save")
            }
        }
    }
}

#Preview {
    AddRecipeView(recipeToAdd: Recipe(name: "Test"))
}
