//
//  ContentView.swift
//  Cosmos
//
//  Created by Sreejith K Menon on 14/05/24.
//
//  This file contains the SwiftUI view for displaying a grid of photos.

import SwiftUI

/// `PhotoGridView` is a SwiftUI View that displays a grid of photos.
///
/// Properties:
///   - `photos`: An array of `Photo` objects that the grid will display.
///   - `gridColumns`: Defines the layout and spacing of the grid columns.
///     This is an array of `GridItem`, configured to be flexible with a set spacing.
///     Default is three columns with a spacing of 2 points.
struct PhotoGridView: View {
    let photos: [Photo]
    var gridColumns = Array(repeating: GridItem(.flexible(), spacing: 2), count: 3)
    
    /// The body of the `PhotoGridView`. It constructs the user interface.
    var body: some View {
        VStack {
            // A scrollable view that wraps the grid. Indicators are hidden.
            ScrollView(showsIndicators: false) {
                // A lazy grid that only creates items as needed, improving performance.
                LazyVGrid(columns: gridColumns, spacing: 2) {
                    // Iterates over `photos` to create each photo grid item.
                    ForEach(photos) { item in
                        // `GeometryReader` is used to read the size of each grid item.
                        GeometryReader { geo in
                            // `NavigationLink` provides a way to navigate to `PhotoDetailView`.
                            NavigationLink(destination: PhotoDetailView(item: item)) {
                                // Renders the photo grid item with the specified size.
                                PhotoGridItemView(size: geo.size.width, item: item)
                            }
                        }
                        .clipped()  // Clips the view to its bounds.
                        .aspectRatio(1, contentMode: .fit)  // Maintains a 1:1 aspect ratio.
                    }
                }
            }
        }
        .navigationBarTitle("Nova")  // Sets the navigation bar title.
        .navigationBarTitleDisplayMode(.inline)  // The title display mode is set to inline.
    }
}

/// Preview provider for `PhotoGridView`.
///
/// This preview provider generates previews of `PhotoGridView` to be displayed
/// in Xcode's canvas or during SwiftUI Previews.
struct PhotoGridView_Previews: PreviewProvider {
    static var previews: some View {
        // Provides a static preview of the `PhotoGridView` with a sample list of photos.
        PhotoGridView(photos: PhotoViewModel.successState().photos)
    }
}
