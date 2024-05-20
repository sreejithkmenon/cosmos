# Photo Gallery App for Cosmos Code Share

## Overview
This iOS application is a photo gallery app that utilizes images from the Unsplash API. It showcases a grid of photos, which users can tap to view in detail, including descriptions and photographer information. The app is developed using the Model-View-ViewModel (MVVM) architecture to ensure clean separation of concerns and better manageability.

## Features
- **Launch Screen**: Initial screen where API calls are made.
- **Photo Grid**: Displays images in a grid layout. Tapping an image opens the detail view.
- **Detail View**: Shows the full-screen image along with its description and photographer details.
- **Error Handling**: Provides user feedback for no internet connection or no data scenarios.
- **Architecture**: Utilizes the MVVM architectural pattern for robust and scalable app development.

## Motivation
I chose this project to demonstrate my skills in iOS development, particularly in building a modern, scalable application using MVVM architecture. Given that Cosmos operates in a similar domain, this app aligns well with the company's focus and showcases relevant skills that could be utilized at Cosmos.

## Installation
To run this project, clone the repository and open `Cosmos.xcodeproj` in Xcode. Ensure you have Xcode installed on your machine (preferably Xcode 12 or later). Run the project using the simulator or a physical device.

## Limitations and Improvements
- **Device Testing**: Due to the lack of a physical iOS device, the app was tested only in simulators. Testing on physical devices could potentially reveal issues not visible in the simulator.
- **Image Caching**: Implementing image caching would enhance performance, reducing API calls and loading times.
- **UI Enhancements**: Advanced animations and UI elements could be added to improve user engagement and app aesthetics.

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
│   └── App icons and colors
├── Models
│   ├── User.swift
│   ├── Photo.swift
│   ├── ProfileImage.swift
│   └── URLs.swift
├── Views
│   ├── PhotoGridView.swift
│   ├── PhotoDetailView.swift
│   └── ErrorView.swift
├── Helpers
│   └── Utils.swift
└── CosmosApp.swift
```

## Screenshots
Screenshots of the app in action are included below to provide a visual reference of the implemented features.

![Photo Grid View](https://ibb.co/f2YcZF8)
![Photo Detail View](https://ibb.co/km5L7m3)

## Conclusion
This application serves as a comprehensive example of my abilities to architect and develop iOS applications that are not only functional but also well-designed and user-friendly. I look forward to the opportunity to bring similar innovative solutions to the Cosmos team.
