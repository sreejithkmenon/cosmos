//
//  APIServiceProtocol.swift
//  Cosmos
//
//  Created by Sreejith K Menon on 19/05/24.
//

import Foundation

/// A protocol defining the requirements for an API service that fetches photo data.
/// This protocol allows for the abstraction of the API implementation,
/// enabling the use of different API services without changing the consuming code.
///
/// - Note: Any class that conforms to this protocol should provide
///   a concrete implementation of the `fetchPhotos(url:completion:)` method,
///   which will be used to fetch photo data from a specified URL.

protocol APIServiceProtocol {
    /// Fetches a collection of photos from a given URL.
    ///
    /// - Parameters:
    ///   - url: The URL from which to fetch the photos. This can be `nil`, in which case
    ///          the implementation should handle the nil case appropriately, possibly treating it as an error.
    ///   - completion: A closure that gets called once the fetch is complete. This closure is passed a `Result` object
    ///                 which contains either an array of `Photo` objects on success, or an `APIError` on failure.
    ///
    /// - Important: The function should handle all network-related errors and should ensure that the completion
    ///              handler is called on the main thread if it affects the UI.
    ///
    /// - Assumptions:
    ///   - The URL provided is valid and reachable.
    ///   - The server responds with a proper JSON format expected by the Photo parsing logic.
    ///
    /// - Throws: This function does not throw but returns errors through the `Result` type in the completion handler.
    func fetchPhotos(url: URL?, completion: @escaping(Result<[Photo], APIError>) -> Void)
}
