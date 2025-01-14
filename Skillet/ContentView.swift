//
//  ContentView.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Text("All Recipes")
                Text("Favorite Recipes")
            }
            .navigationTitle("Skillet")
        }
    }
}

#Preview {
    ContentView()
}
