//
//  StoryCard.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

struct StoryCard: View {
    let post: Post
    var body: some View {
        let components = post.profile_name.split(separator: " ")
        let firstName = components.first
        let lastName = components.last
        VStack {
            Image(post.profile_img) // Display the image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 140) // Set the size of the image
                .clipShape(RoundedRectangle(cornerRadius: 20)) // Clip the image into a circle shape
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.orange, Color.red, Color.yellow, Color.purple]), startPoint: .bottom, endPoint: .top), lineWidth: 3)
                )
                .overlay{
                    Image("play")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .foregroundStyle(Color(UIColor.white))
                }
        }

                .overlay(alignment: .bottomLeading){
                    HStack{
                        VStack(alignment: .leading){
                            Text((firstName?.uppercased())!)
                                .font(.subheadline)
                                .foregroundStyle(.white)
                                .bold()
                            
                            Text((lastName?.uppercased())!)
                                .font(.subheadline)
                                .foregroundStyle(.white)
                                .bold()
                        }
                        .padding(.leading, 5)
                        Spacer()
                    }
                    .frame(width: 100)
                    
                    .offset(x: 8, y: -5)
                    .background{
                        Color.blue.opacity(0.6)
                            .blur(radius: 10)
                            .offset(x: 5, y: -5)
                    }
                    .padding(.bottom, 5)
                    

//            Text(post.profile_name)
//                .font(.footnote)
//                .lineLimit(1)
//                .frame(width: 100)
//                .padding(.horizontal, -2)

                // Add an overlay circle stroke with a gradient color
        }

    }
}

struct StoryCardWithAthlete: View{
    let athlete: Athlete
    var body: some View {
        let firstName = athlete.first_name
        let lastName = athlete.last_name
        VStack {
            Image(athlete.profile_img) // Display the image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 140) // Set the size of the image
                .clipShape(RoundedRectangle(cornerRadius: 20)) // Clip the image into a circle shape
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.orange, Color.red, Color.yellow, Color.purple]), startPoint: .bottom, endPoint: .top), lineWidth: 3)
                )
                .overlay{
                    Image("play")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .foregroundStyle(Color(UIColor.white))
                }
        }

                .overlay(alignment: .bottomLeading){
                    HStack{
                        VStack(alignment: .leading){
                            Text(firstName.uppercased())
                                .font(.subheadline)
                                .foregroundStyle(.white)
                                .bold()
                            
                            Text(lastName.uppercased())
                                .font(.subheadline)
                                .foregroundStyle(.white)
                                .bold()
                        }
                        .padding(.leading, 5)
                        Spacer()
                    }
                    .frame(width: 100)
                    
                    .offset(x: 8, y: -5)
                    .background{
                        Color.blue.opacity(0.6)
                            .blur(radius: 10)
                            .offset(x: 5, y: -5)
                    }
                    .padding(.bottom, 5)
                    

//            Text(post.profile_name)
//                .font(.footnote)
//                .lineLimit(1)
//                .frame(width: 100)
//                .padding(.horizontal, -2)

                // Add an overlay circle stroke with a gradient color
        }

    }
}

