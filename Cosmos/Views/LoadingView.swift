//
//  LoadingView.swift
//  Cosmos
//
//  Created by Sreejith K Menon on 19/05/24.
//

import SwiftUI

/// `LoadingView` provides a simple visual representation of a loading state within the application.
/// This view displays an indeterminate progress indicator which represents ongoing processing or fetching operations.
///
/// Usage:
/// ```
/// var body: some View {
///     LoadingView()
/// }
/// ```
///
/// - Note: This view can be further customized to include additional visual elements or feedback mechanisms
///   depending on the application's design requirements.
struct LoadingView: View {
    /// The body property for `LoadingView` which defines the content of the view.
    /// Here, it contains a vertical stack (`VStack`) that aligns its children along the vertical axis.
    var body: some View {
        VStack {
            ProgressView() // Displays a circular activity indicator.
        }
        // Assumption: The `VStack` is used here for possible future additions of more elements to this view.
        // Currently, it only contains a `ProgressView`.
    }
}

/// `LoadingView_Previews` provides a preview of the `LoadingView` within the Xcode Canvas or the SwiftUI Previews.
/// Previews help developers and designers see a visual representation of their work in different states and on multiple devices.
///
/// - Note: Previews are not included in the production build of the application and are only used during development.
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView() // Provides a preview of the LoadingView
    }
}
