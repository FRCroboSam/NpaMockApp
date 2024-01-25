import SwiftUI

struct LikeButton: View {
    // Use a `@State` variable to track whether the button is liked or not
    @State private var isLiked = false

    var body: some View {
        Button(action: {
            // Toggle the value of the `isLiked` variable when the button is tapped
            self.isLiked.toggle()
        }) {
            // Use an image or label to indicate that the button is a "like" button
            Image(systemName: isLiked ? "heart.fill" : "heart")
        }
    }
}
