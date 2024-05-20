//
//  PhotoGridItemView.swift
//  Cosmos
//
//  Created by Sreejith K Menon on 17/05/24.
//

import SwiftUI

/// A view that displays a photo in a grid format.
///
/// This struct is a SwiftUI view that uses `AsyncImage` to load and display an image from a URL asynchronously.
/// The image is displayed as a square according to the specified `size`.
///
/// - Parameters:
///   - size: The width and height of the image frame in points. This parameter should be positive.
///   - item: The `Photo` object containing the URL of the image.
struct PhotoGridItemView: View {
    let size: Double
    let item: Photo
    
    var body: some View {
        ZStack() {
            // Check if a valid URL exists for the image
            if let image = item.urls.regular {
                // Load and display the image asynchronously.
                // `AsyncImage` handles the image loading lifecycle with different phases.
                AsyncImage(url:  URL(string: image)) { phase in
                    // If the image successfully loads, it is displayed.
                    if let image = phase.image {
                        image
                            .resizable() // Allow the image to resize.
                            .scaledToFill() // Ensure the image fills the frame while maintaining its aspect ratio.
                    } else if phase.error != nil {
                        // If there's an error loading the image, a placeholder is shown.
                        Image(systemName: "questionmark.diamond")
                            .imageScale(.large)
                    }
                }
                .frame(width: size, height: size) // Set the frame of the image.
            }
        }
    }
}

struct PhotoGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        // Provides a preview with a dummy `Photo` object.
        // The `Photo.example1()` method should return a Photo instance for preview purposes.
        PhotoGridItemView(size: 400, item: Photo.example1())
    }
}
