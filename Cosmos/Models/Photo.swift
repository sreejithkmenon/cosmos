//
//  Photo.swift
//  Cosmos
//  Created by Sreejith K Menon on 16/05/24.
//
import Foundation

/// A `Photo` struct for modeling photo data fetched from a network or local database.
/// It conforms to `Identifiable` for easy identification within a SwiftUI view, and `Codable` for
/// decoding and encoding with JSON data.
struct Photo: Identifiable, Codable {
    // MARK: - Properties
    let id: String                        // Unique identifier for each photo.
    let alt_description: String?          // An optional description of the photo content.
    let urls: URLs                        // URLs associated with the photo, primarily the image URL.
    let user: User                        // User who uploaded or owns the photo.

    // MARK: - Initializers

    /// Creates a `Photo` instance from JSON decoder.
    /// - Parameter decoder: The decoder to extract data from.
    /// - Throws: `DecodingError` if any required fields are missing or if data type does not match.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        alt_description = try values.decodeIfPresent(String.self, forKey: .alt_description)
        urls = try values.decode(URLs.self, forKey: .urls)
        user = try values.decode(User.self, forKey: .user)
    }

    /// Manual initializer to create a new `Photo` instance.
    /// - Parameters:
    ///   - id: Unique identifier for the photo.
    ///   - alt_description: A textual description of the photo.
    ///   - urls: `URLs` struct containing URLs related to the photo.
    ///   - user: `User` who owns the photo.
    init(id: String, alt_description: String?, urls: URLs, user: User) {
        self.id = id
        self.alt_description = alt_description
        self.urls = urls
        self.user = user
    }

    // MARK: - CodingKeys
    /// `CodingKeys` maps the JSON keys to the `Photo` struct's properties.
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case alt_description = "alt_description"
        case urls = "urls"
        case user = "user"
    }

    // MARK: - Examples

    /// Provides a static example of a `Photo` instance for preview purposes.
    /// Useful in SwiftUI previews and for initial testing.
    static func example1() -> Photo {
        return Photo(id: "Jk733Hfu_To", alt_description: "a wooden table topped with a can of beer and sunglasses", urls: URLs(regular: "https://images.unsplash.com/photo-1715604535941-3a38ad63bd79?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2MTMyMDJ8MHwxfGFsbHwxfHx8fHx8Mnx8MTcxNTk3MDEzNHw&ixlib=rb-4.0.3&q=80&w=1080"), user: User(name: "Emilio", username: "piensaenpixel", bio: "Saules mūžu Latvijai", profile_image: ProfileImage(large: "https://images.unsplash.com/profile-1715551684107-f8c957f3b72fimage?ixlib=rb-4.0.3&crop=faces&fit=crop&w=128&h=128")))
    }

    /// Provides another static example of a `Photo` instance for preview purposes.
    static func example2() -> Photo {
        return Photo(id: "bmTcZoBymL8", alt_description: "a camera attached to a tripod in a field", urls: URLs(regular: "https://images.unsplash.com/photo-1715550722304-b6ee97071817?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2MTMyMDJ8MHwxfGFsbHwyfHx8fHx8Mnx8MTcxNTk3MDEzNHw&ixlib=rb-4.0.3&q=80&w=1080"), user: User(name: "Deepthi", username: "nofal624", bio: "Photographer My goal is to create editorial photos with my work! Every donation helps me to continue creating art! \r\nMain emphasis: Portrait and streetphotography", profile_image: ProfileImage(large: "https://images.unsplash.com/profile-1523306443217-4c56454b65ca?ixlib=rb-4.0.3&crop=faces&fit=crop&w=128&h=128")))
    }
}
