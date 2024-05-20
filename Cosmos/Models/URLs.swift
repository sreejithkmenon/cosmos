//
//  URLs.swift
//  Cosmos
//
//  Created by Sreejith K Menon on 18/05/24.
//

import Foundation

/// `URLs` struct serves as a model for decoding URL data.
/// It conforms to `Codable` to support both encoding and decoding.
struct URLs: Codable {
    // MARK: - Properties
    
    /// Optional string to hold the URL. It can be nil if the URL is not provided in the JSON payload.
    let regular: String?
    
    // MARK: - Initializers
    
    /// Creates a new instance by decoding from the given decoder.
    /// This initializer is required by the `Decodable` protocol.
    ///
    /// - Parameters:
    ///   - decoder: The decoder to read data from.
    /// - Throws: An error if decoding fails.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        // Decode the `regular` property. If not present in the decoded data, it defaults to nil.
        regular = try values.decodeIfPresent(String.self, forKey: .regular)
    }
    
    /// Initializes a new instance of `URLs` with a given URL string.
    ///
    /// - Parameters:
    ///   - regular: The regular URL string to be stored.
    init(regular: String) {
        self.regular = regular
    }
    
    // MARK: - CodingKeys
    
    /// Enum that contains the keys used to encode and decode the data.
    /// In this case, it matches the variable names but is useful for mapping JSON keys to different property names or for adding additional keys in the future.
    enum CodingKeys: String, CodingKey {
        case regular = "regular"
    }
}
