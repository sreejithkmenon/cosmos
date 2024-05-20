//
//  User.swift
//  Cosmos
//  Created by Sreejith K Menon on 18/05/24.
//

import Foundation

/// `User` defines a model for representing user profile information in the Cosmos app.
/// It conforms to `Codable` to support easy encoding and decoding from/to JSON, facilitating API communications.
struct User: Codable {
    /// Optional name of the user. It can be `nil` if the name is not provided or available.
    let name: String?
    /// Optional username of the user. It can be `nil` if the username is not set up or available.
    let username: String?
    /// Optional biography of the user. It can be `nil` if the biography is not provided.
    let bio: String?
    /// Profile image of the user. Assumes it is mandatory and always provided in the user data.
    let profile_image: ProfileImage
    
    /// Initializes a new user from a decoder.
    /// - Parameter decoder: The decoder to extract data from.
    /// - Throws: `DecodingError` if any required fields are missing or if there is a data type mismatch.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        bio = try values.decodeIfPresent(String.self, forKey: .bio)
        profile_image = try values.decode(ProfileImage.self, forKey: .profile_image)
    }
    
    /// Initializes a new user with specified profile information.
    /// - Parameters:
    ///   - name: Name of the user.
    ///   - username: Username of the user.
    ///   - bio: Biography of the user.
    ///   - profile_image: Profile image of the user.
    init(name: String, username: String, bio: String, profile_image: ProfileImage) {
        self.name = name
        self.username = username
        self.bio = bio
        self.profile_image = profile_image
    }
    
    /// Coding keys to map the JSON keys with the model properties.
    /// They are used to encode and decode the model from and to JSON.
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case username = "username"
        case bio = "bio"
        case profile_image = "profile_image"
    }
}
