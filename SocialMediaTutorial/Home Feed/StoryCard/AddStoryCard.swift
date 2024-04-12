//
//  AddStoryCard.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

struct AddStoryCard: View {
    let imageName: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(Color.white)
                .clipShape(Circle())
                .overlay(alignment: .bottomTrailing){
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                        .frame(width: 40, height: 40)
                        .background(Color.white)
                        .clipShape(Circle())
                        .offset(x: 12, y: 8)
                }
                
            Text("Your Story")
                .padding(.horizontal, 10)
                .font(.footnote)
                .tint(.gray)
                
        }
    }
}

struct AddStoryCard_Previews: PreviewProvider {
    static var previews: some View {
        AddStoryCard(imageName: "male_athlete1")
    }
}

