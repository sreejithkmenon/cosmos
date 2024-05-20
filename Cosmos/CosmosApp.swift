//
//  CosmosApp.swift
//  Cosmos
//
//  Created by Sreejith K Menon on 14/05/24.
//
//  This file contains the main structure for the Cosmos application using SwiftUI.
//  It defines the entry point of the app and the initial user interface structure.

import SwiftUI  // Importing the SwiftUI framework to use its features for UI development.

/// `CosmosApp` is the main application structure for Cosmos. It conforms to the `App` protocol,
/// which is required for every SwiftUI application.
@main  // Marks `CosmosApp` as the entry point of the application.
struct CosmosApp: App {
    /// The body property is required by the `App` protocol and returns one or more scenes.
    /// Here, we define a `WindowGroup` which will automatically manage a collection of windows
    /// for the app's scenes.
    var body: some Scene {
        WindowGroup {
            // The root view of the app is `ContentView`, wrapped in a `NavigationStack` to
            // enable hierarchical navigation within the app.
            NavigationStack {
                ContentView()  // ContentView is assumed to be the initial view controller displayed.
            }
            .navigationViewStyle(.stack)  // Setting the navigation view style to stack for traditional push navigation.
        }
    }
}
