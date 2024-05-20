//
//  ContentView.swift
//  Cosmos
//
//  Created by Sreejith K Menon on 19/05/24.
//
//  This file defines the ContentView struct which is responsible for the user interface
//  of the main content view within the Cosmos app. It uses SwiftUI for layout and state management.

import SwiftUI

/// `ContentView` serves as the main view for the Cosmos app, which manages the display
/// of a list of photos fetched from an external source. It uses `PhotoViewModel` to handle data fetching,
/// state management, and error handling.
struct ContentView: View {
    // `photoViewModel` is a reference to the PhotoViewModel class responsible for fetching
    // and storing photo data. It is observed here to react to changes in data state.
    @StateObject private var photoViewModel = PhotoViewModel()
    
    var body: some View {
        // The primary view container
        VStack {
            // Display a loading view when the data is being fetched asynchronously.
            if photoViewModel.isLoading {
                LoadingView()
            }
            // Display an error view if there was an error during data fetching.
            else if photoViewModel.errorMessage != nil  {
                ErrorView(photoViewModel: photoViewModel)
            }
            // Once the data is fetched and there are no errors, display the photos in a grid view.
            else {
                PhotoGridView(photos: photoViewModel.photos)
            }
        }
    }
}

/// `ContentView_Previews` provides a preview of `ContentView` which is useful during
/// development to visualize changes without running the app on a physical device or simulator.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
