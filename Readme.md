# Nova: Photo Gallery App

## Overview

Nova is a photo gallery app developed as part of the application process for a Senior iOS Engineer role at Cosmos. This app utilizes the Unsplash API to fetch a rich collection of images and displays them in a grid format. Upon selecting an image, the app presents a detailed view showcasing more about the image and its photographer.

## Features

- **Launch Screen:** Initial loading screen where API calls are managed.
- **Gallery View:** Images displayed in a grid format.
- **Detail View:** Shows full image with descriptions and photographer details.
- **Error Handling:** Handles no internet or empty data scenarios with appropriate user notifications.

## Architecture

This project implements the Model-View-ViewModel (MVVM) architecture, ensuring a clear separation of concerns and enhancing the maintainability of the code. The usage of SwiftUI along with the Combine framework aids in creating a reactive app that is both responsive and performant.

## Installation

1. **Clone the repository:**
   ```
   git clone https://github.com/sreejithkmenon/cosmos.git
   ```
2. **Open `Cosmos.xcodeproj` in Xcode.**
3. **Run the project on a simulator or a physical device.**

Note: The project was primarily tested on the Xcode simulator due to the unavailability of a physical testing device.

## Key Components

- `PhotoGridView.swift`: Manages the presentation of images in a grid.
- `PhotoDetailView.swift`: Handles the display of detailed information about the selected image.
- Networking Layer: Includes error handling and API service protocols.
- ViewModels: Bind data fetched from the API to the views.

## Limitations & Future Improvements

- **Image Caching:** Currently not implemented due to testing limitations on the simulator. Implementing caching would enhance performance.
- **UI Enhancements:** Advanced animations and UI elements could be explored further.
- **Physical Device Testing:** Testing on physical devices to ensure compatibility and performance.

## Why This Project?

I chose this project because it aligns well with Cosmos’s focus on visual content, showcasing my ability to handle complex UIs and API integrations effectively. I am particularly proud of the clean and scalable architecture I've implemented, which can easily be adapted for similar applications.

## Screenshots

Screenshots of the app in action are included below to provide a visual reference of the implemented features.

Photo Grid View            |  Photo Detail View
:-------------------------:|:-------------------------:
![](https://i.ibb.co/QfF5hQ8/Simulator-Screen-Shot-i-Phone-14-2024-05-20-at-03-08-17.png)  |  ![](https://i.ibb.co/xFXnkFm/Simulator-Screen-Shot-i-Phone-14-2024-05-20-at-03-08-34.png)

## Documentation

The codebase is extensively documented to ensure clarity and ease of navigation. Each class and function is accompanied by comments explaining its purpose and usage.

## App Icon

The app icon reflects the theme of a galaxy, resonating with the aesthetic and the name of the app, "Nova."

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
│   ├── PhotoGridItemView.swift
│   ├── PhotoDetailView.swift
│   ├── Content.swift
│   ├── Loading.swift
│   └── ErrorView.swift
├── Helpers
│   └── Utils.swift
└── CosmosApp.swift

```
