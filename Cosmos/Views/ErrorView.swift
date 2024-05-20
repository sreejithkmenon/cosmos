//
//  ErrorView.swift
//  Cosmos
//
//  Created by Sreejith K Menon on 19/05/24.
//
//  This file defines the ErrorView struct which is used to display error messages
//  and allows users to retry the operation that failed. This view is part of the
//  Cosmos application's user interface and interacts with the PhotoViewModel.

import SwiftUI

/// A view that displays an error message and provides a button to retry the failed operation.
///
/// The `ErrorView` uses the `PhotoViewModel` to handle the logic for fetching photos and managing error states.
/// The view updates automatically in response to changes in the observed `PhotoViewModel` object.
struct ErrorView: View {
    /// The ViewModel associated with managing the photo data and error handling.
    /// It's observed here so that the view re-renders when changes occur in the ViewModel.
    @ObservedObject var photoViewModel = PhotoViewModel()
    
    var body: some View {
        VStack {
            // Title of the app, always displayed at the top of the error view.
            Text("Cosmos")
                .font(.largeTitle)
                .bold()
                .padding()
            // Conditional display of the error message if one exists in the ViewModel.
            if let errorMessage = photoViewModel.errorMessage {
                Text(errorMessage)
                    .padding()
            }
            // Button to retry fetching photos. This triggers the fetchPhotos method on the ViewModel.
            Button {
                photoViewModel.fetchPhotos()
            } label: {
                Text("Try again")
            }
            .padding()
        }
    }
}

/// A preview provider that creates a preview of the ErrorView for use within the SwiftUI design canvas.
///
/// This is particularly useful during development and design phases to get a real-time preview of changes.
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
