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
            Divider()
            HStack {
                HStack{
                    Image(profile_img)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Text(profile_name).bold()
                                .foregroundStyle(.black)
                            Text("• 10m")
                                .font(.caption)
                                .foregroundStyle(.black).opacity(0.7)
                        }
                        .foregroundStyle(.white)
                        Text("1.5K Followers")
                            .font(.footnote)
                            .foregroundStyle(.black).opacity(0.8)

                    }
                }
//                .background{
//                    RoundedRectangle(cornerRadius: 10){
//                        Color.blue
//                    }
//                }
                Spacer()
                Image(systemName: "ellipsis")
                    .padding(.horizontal, 15)
                    //.foregroundStyle(.white)
                
                
            }
            .padding(.leading, 15)
            Spacer()
                .frame(height: 20)
        }

    }
}
