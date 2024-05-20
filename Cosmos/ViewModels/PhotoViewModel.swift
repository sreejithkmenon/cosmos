///
/// `PhotoViewModel` is a view model class responsible for managing the state and logic needed
/// to fetch and display photos in a UI component. It adheres to the `ObservableObject` protocol
/// to allow SwiftUI views to observe changes in its properties.
///
/// Properties:
/// - `photos`: An array of `Photo` objects that stores the fetched photos.
/// - `isLoading`: A boolean flag indicating whether a network request is currently active.
/// - `errorMessage`: An optional string that stores an error message if the fetch fails.
///
/// The class depends on an `APIServiceProtocol` to abstract the details of network requests,
/// facilitating easier testing and modularity.
///
import Foundation

class PhotoViewModel: ObservableObject {
    @Published var photos = [Photo]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    /// Initializes the `PhotoViewModel` with an optional `APIServiceProtocol` instance,
    /// defaulting to `APIService()` if none is provided. It triggers `fetchPhotos()` upon initialization.
    ///
    /// - Parameter service: An instance of `APIServiceProtocol` to perform network requests.
    ///
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchPhotos()
    }
    
    /// Fetches photos from the Unsplash API using the provided API key and updates the view model's
    /// state based on the outcome of the fetch operation.
    ///
    /// Assumptions:
    /// - The URL and parameters are hardcoded which assumes they remain static. Changes to API parameters
    ///   or domain should be handled through configuration files or environment variables.
    /// - API key is included in the URL; in a production setting, it should be secured and not hard-coded.
    ///
    func fetchPhotos() {
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://api.unsplash.com/photos/?client_id=sfqPadzLZz3pQORqPxfiZqE-GN4G4pBuQ5140Kr_AYc&per_page=30&order_by=latest")
        
        service.fetchPhotos(url: url) { [weak self] result in
            DispatchQueue.main.async {
                if let strongSelf = self {
                    strongSelf.isLoading = false
                }
                switch result {
                case .failure(let error):
                    if let strongSelf = self {
                        strongSelf.isLoading = false
                        strongSelf.errorMessage = error.localizedDescription
                    }
                case .success(let photos):
                    if let strongSelf = self {
                        strongSelf.photos = photos
                        print(photos)
                    }
                }
            }
        }
    }
    
    /// Provides a predefined error state of `PhotoViewModel` for testing or demonstration purposes.
    /// Simulates a scenario where the network connection is unavailable.
    ///
    /// - Returns: An instance of `PhotoViewModel` with a preset error message.
    ///
    static func errorState() -> PhotoViewModel {
        let fetcher = PhotoViewModel()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    /// Provides a predefined success state of `PhotoViewModel` for testing or demonstration purposes.
    /// Simulates a scenario where specific example photos are successfully fetched.
    ///
    /// - Returns: An instance of `PhotoViewModel` populated with example photos.
    ///
    static func successState() -> PhotoViewModel {
        let fetcher = PhotoViewModel()
        fetcher.photos = [Photo.example1(), Photo.example2()]
        return fetcher
    }
}
