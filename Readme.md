# Cosmos Photo Gallery App

This project is an iOS photo gallery app, developed as a code sharing exercise for a Senior iOS Engineer role at Cosmos. The app utilizes the Unsplash API to fetch images and displays them in a grid format. Users can tap on any image to view it in detail along with additional information such as the image's description and the photographer's details.

## Features

- **Launch Screen:** Displays while API calls are being made at initialization.
- **Photo Grid View:** Images are displayed in a grid format in `PhotoGridView.swift`.
- **Photo Detail View:** Full screen view of the image with more details in `PhotoDetailView.swift`.
- **Error Handling:** Shows appropriate messages when there is no internet connection or if the API returns no data.
- **MVVM Architecture:** Utilizes Model View ViewModel architecture for structured and scalable code.
- **Documentation:** Comprehensive documentation provided for ease of understanding and maintenance.

## Project Structure

```
Cosmos
├── ViewModels
│   └── PhotoViewModel.swift
├── Networking
│   ├── APIError.swift
│   ├── APIService.swift
│   ├── APIServiceProtocol.swift
│   └── APIMockService.swift
├── Assets.xcassets
│   └── AppIcon.appiconset
│       ├── Icons
│       └── Contents.json
├── Models
│   ├── User.swift
│   ├── Photo.swift
│   ├── ProfileImage.swift
│   └── URLs.swift
├── Views
│   ├── PhotoGridView.swift
│   ├── PhotoDetailView.swift
│   └── ErrorView.swift
└── Helpers
    └── Utils.swift
```

## Installation

1. Clone the repository to your local machine.
2. Open the `Cosmos.xcodeproj` file in Xcode.
3. Build and run the application on your simulator or a connected iOS device.

## Screenshots
Screenshots of the app in action are included below to provide a visual reference of the implemented features.

![](https://i.ibb.co/QfF5hQ8/Simulator-Screen-Shot-i-Phone-14-2024-05-20-at-03-08-17.png) | ![](https://i.ibb.co/xFXnkFm/Simulator-Screen-Shot-i-Phone-14-2024-05-20-at-03-08-34.png)

## Limitations

Due to the lack of access to a physical iOS device during development:
- Image caching and advanced UI animations were not implemented.
- These could be potential areas for future enhancement to improve user experience and app performance.

## Why This Code?

I chose this project to align with Cosmos's focus on visual content, showcasing my ability to develop applications that handle media efficiently. The implementation of MVVM architecture demonstrates my capacity to structure code for scalability and maintainability, which is crucial for team environments and complex applications.

## Areas for Improvement

- **Image Caching:** Implement caching to reduce data usage and improve load times.
- **Advanced UI:** Integrate more sophisticated UI animations to enhance the user experience.
- **Testing:** Increase unit and integration tests to ensure reliability and stability.

By sharing this code, I affirm that I have the right to distribute it publicly, and it's intended solely for evaluation purposes by Cosmos.
