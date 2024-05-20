//
//  PhotoDetailView.swift
//  Cosmos
//
//  Created by Sreejith K Menon on 17/05/24.
//

import SwiftUI

/// A SwiftUI view that displays detailed information about a photo.
/// It includes the photo itself, the photographer's profile image, name, username,
/// a brief description of the photo, and the photographer's bio if available.
struct PhotoDetailView: View {
    /// Represents the photo object to be displayed.
    let item: Photo
    
    /// Environment property to handle the presentation mode of this view.
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack(alignment: .topLeading) {
                VStack {
                    // Displays the main photo using AsyncImage which loads an image from a URL.
                    if let image = item.urls.regular {
                        AsyncImage(url: URL(string: image)) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                            case .failure:
                                Image(systemName: "questionmark.diamond")
                                    .imageScale(.large)
                            default:
                                ProgressView()
                            }
                        }
                    }
                    
                    // Displays the photographer's profile image, name, and username.
                    VStack {
                        HStack {
                            if let profile_image = item.user.profile_image.large {
                                AsyncImage(url: URL(string: profile_image)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                                .frame(width: 44, height: 44)
                                .clipShape(Circle())
                            }
                            VStack(alignment: .leading) {
                                if let name = item.user.name {
                                    Text(name.capitalized)
                                        .bold()
                                }
                                
                                if let username = item.user.username {
                                    Text(username)
                                        .font(.caption)
                                }
                            }
                            Spacer()
                        }
                        
                        // Displays the photo's alternate description if available.
                        if let alt_description = item.alt_description {
                            Text(alt_description.firstUppercased)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .bold()
                                .padding(.top)
                        }
                        
                        // Displays the photographer's bio if available.
                        if let bio = item.user.bio {
                            Text(bio.firstUppercased)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.footnote)
                                .padding(.top, 1)
                        }
                    }
                    .padding()
                    Spacer()
                }
                
                // Button to dismiss the view.
                Button(action: { presentation.wrappedValue.dismiss() }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .imageScale(.large)
                    }
                }
                .padding(.leading)
                .padding(.top)
            }
            .navigationTitle(Text(""))
            .navigationBarHidden(true)
        }
    }
}

/// Provides a preview of PhotoDetailView with a sample photo.
struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(item: Photo.example1())
    }
}
