//
//  APIMockService.swift
//  Cosmos
//
//  Created by Sreejith K Menon on 19/05/24.
//

import Foundation

/// A mock service for simulating network responses for photo retrieval in a development or testing environment.
/// This service conforms to the `APIServiceProtocol`, allowing it to be used interchangeably with other API services
/// within the application that adhere to the same protocol.
struct APIMockService: APIServiceProtocol {

    /// A pre-defined result of an API call that fetches photos.
    /// This can be initialized with either a success (containing an array of `Photo` objects) or an error (`APIError`).
    /// Assumption: The result is set during initialization and remains unchanged during the lifecycle of this instance.
    var resultPhotos: Result<[Photo], APIError>
    
    /// Simulates the fetching of photos from a network service.
    /// - Parameters:
    ///   - url: The URL from which photos would typically be fetched. In this mock implementation, the URL is ignored
    ///     because the result is predetermined. This parameter is included to conform to the `APIServiceProtocol`.
    ///   - completion: A completion handler that is called with the `resultPhotos`. The completion handler mimics
    ///     asynchronous behavior typical of network requests.
    /// - Assumption: The URL provided is valid and would normally be used in a real API call, but is not used here
    ///   due to the nature of the mock.
    func fetchPhotos(url: URL?, completion: @escaping (Result<[Photo], APIError>) -> Void) {
        completion(resultPhotos)
    }
}
