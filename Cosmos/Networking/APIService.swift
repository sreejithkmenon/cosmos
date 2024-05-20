//
//  APIService.swift
//  Cosmos
//
//  Created by Sreejith K Menon on 19/05/24.
//

import Foundation

/// A service for performing network operations conforming to `APIServiceProtocol`.
struct APIService: APIServiceProtocol {
    
    /// Fetches data from the specified URL and decodes it to the requested type.
    /// - Parameters:
    ///   - type: The type of the data to decode to. Must conform to `Decodable`.
    ///   - url: The URL to fetch data from. If `nil`, the completion handler is called with `APIError.badURL`.
    ///   - completion: A closure to be executed once the operation is completed.
    /// - Note: This method uses the `URLSession` shared instance to perform an HTTP request.
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        
        task.resume()
    }
    
    /// Fetches an array of `Photo` objects from a specified URL.
    /// - Parameters:
    ///   - url: The URL to fetch photos from. If `nil`, the completion handler is called with `APIError.badURL`.
    ///   - completion: A closure to be executed once the operation is completed.
    /// - Note: This method uses `URLSession` shared instance to perform an HTTP request and decodes the JSON response into an array of `Photo`.
    func fetchPhotos(url: URL?, completion: @escaping(Result<[Photo], APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let photos = try decoder.decode([Photo].self, from: data)
                    completion(Result.success(photos))
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        
        task.resume()
    }
}
