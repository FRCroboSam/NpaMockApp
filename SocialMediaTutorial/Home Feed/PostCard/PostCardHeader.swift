//
//  PostCardHeader.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

struct PostCardHeader: View {
    
    let profile_img: String
    let profile_name: String
    let profile_id: String
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 10)
            HStack {
                Image(profile_img)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading) {
                    Text(profile_name).bold()
                        .foregroundStyle(.white)
                    Text(profile_id)
                        .font(.footnote)
                        .foregroundStyle(.white)
                }
                Spacer()
                Image(systemName: "ellipsis")
                    .padding(.horizontal, 15)
                    .foregroundStyle(.white)
                
                
            }
            .padding(.leading, 15)
            Spacer()
                .frame(height: 20)
        }

    }
}
