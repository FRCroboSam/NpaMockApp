//
//  AddStoryCard.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

struct AddStoryCard: View {
    var body: some View {
        VStack {
            Image(systemName: "plus.circle")
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(Color.blue)
                .clipShape(Circle())
            Text("Your Story")
                .font(.footnote)
                .tint(.gray)
        }
    }
}

struct AddStoryCard_Previews: PreviewProvider {
    static var previews: some View {
        AddStoryCard()
    }
}
