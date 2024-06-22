/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The profile image that reflects the selected item state.
*/

import SwiftUI
import PhotosUI
import NukeUI
struct CircleProfileImage: View {
    let size: CGFloat
    let name: String
    var body: some View {
        if(name.isEmpty){
            Image(systemName: "person.fill")
                .font(.system(size: size))
                .foregroundColor(.white)
        }
        else{
            Image(name)
                .resizable()
                .font(.system(size: size))
                .foregroundColor(.white)

        }

        
    }
}

struct CircularProfileImage: View {
    let size: CGFloat?
    let name: String
    var body: some View {
        CircleProfileImage(size: size ?? 30, name: name)
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: size ?? 10, height: size ?? 10)
            .background {
                Circle().fill(
                    LinearGradient(
                        colors: [.yellow, .orange],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
    }
}

struct CircularWebProfile: View {
    let url: String
    var body: some View {
        LazyImage(url: URL(string:url)) { phase in
            if let image = phase.image {
                image // Displays the loaded image.
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 30, height: 30)
                    .background {
                        Circle().fill(
                            LinearGradient(
                                colors: [.yellow, .orange],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    }
                
            } else {
                CircularProfileImage(size: 30, name: "")
            }
            
        }
        .onChange(of: url){_ in
            print("URL IS CHANGING")
            
        }
    }
}


    struct ProfileImage: View{
        let image: Image
        let size: CGFloat
        var body: some View {
            image.resizable()
                .font(.system(size: 40))
                .foregroundColor(.white)
                .scaledToFill()
                .frame(width: size, height: size)
                .background {
                    Circle().fill(
                        LinearGradient(
                            colors: [.yellow, .orange],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                }
        }
    }


