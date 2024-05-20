//
//  ProfileImage.swift
//  Cosmos
//
//  Created by Sreejith K Menon on 20/05/24.
//

import Foundation

/// `ProfileImage` is a structure to encapsulate the profile image URLs.
/// It conforms to the `Codable` protocol, enabling it to decode and encode
/// itself to and from JSON.
struct ProfileImage: Codable {
    // MARK: - Properties
    
    /// URL string for the large variant of the profile image. It's optional because
    /// not all profiles might have a large image.
    let large: String?
    
    // MARK: - Initializers
    
    /// Creates a new instance by decoding from the given decoder.
    /// This initializer is required by the `Decodable` protocol.
    ///
    /// - Parameter decoder: The decoder to read data from.
    /// - Throws: An error if reading from the decoder fails.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        large = try values.decodeIfPresent(String.self, forKey: .large)
    }
    
    /// Initializes a new instance with the provided URL string for the large image.
    ///
    /// - Parameter large: The URL string for the large profile image.
    init(large: String) {
        self.large = large
    }
    
    // MARK: - Coding Keys
    
    /// `CodingKeys` enum contains the keys used by the encoder and decoder.
    /// Conforming to `CodingKey` to provide custom key mapping for properties.
    enum CodingKeys: String, CodingKey {
        case large = "large"
    }
}
