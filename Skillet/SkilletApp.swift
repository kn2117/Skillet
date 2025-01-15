//
//  SkilletApp.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/12/25.
//

import SwiftData
import SwiftUI

@main
struct SkilletApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Recipe.self)
    }
}
