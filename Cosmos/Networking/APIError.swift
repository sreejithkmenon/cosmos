//
//  APIError.swift
//  Cosmos
//
//  Created by Sreejith K Menon on 19/05/24.
//

import Foundation

/// An enumeration to handle API-related errors within the application.
/// The enumeration conforms to the `Error` protocol to integrate seamlessly
/// with Swift's error handling mechanisms and `CustomStringConvertible` for providing
/// human-readable descriptions of the errors.
enum APIError: Error, CustomStringConvertible {
    /// Represents an error due to an invalid URL.
    case badURL
    /// Represents an error with the server's response, includes status code for identification.
    case badResponse(statusCode: Int)
    /// Error related to URL session tasks, potentially holding an `URLError`.
    case url(URLError?)
    /// Error during the parsing process, potentially holding a `DecodingError` to pinpoint issues.
    case parsing(DecodingError?)
    /// A generic error case for unknown or unspecified errors.
    case unknown
    
    /// Provides a user-friendly description of the error, aimed at being understandable for non-technical users.
    var localizedDescription: String {
        switch self {
        case .badURL, .parsing, .unknown:
            return "Sorry, something went wrong."
        case .badResponse(_):
            return "Sorry, the connection to our server failed."
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong."
        }
    }
    
    /// Provides a developer-oriented description of the error. Useful for debugging and logs.
    var description: String {
        switch self {
        case .unknown:
            return "unknown error"
        case .badURL:
            return "invalid URL"
        case .url(let error):
            return error?.localizedDescription ?? "url session error"
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? "")"
        case .badResponse(statusCode: let statusCode):
            return "bad response with status code \(statusCode)"
        }
    }
}
