//
//  PodcastView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/6/24.
//

import SwiftUI
struct PodcastView: View {
    let podcast: Podcast
    @State var height: CGFloat = 350
    var body: some View {
            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 0)
//                    Text(podcast.title)
//                        .font(.system(size: 20))
//                        .lineLimit(1)
//                        .bold()
//                        .frame(width: 7/8 * deviceWidth )

                VideoPlayer(url: podcast.image_or_video, width: 7/8 * deviceWidth, height: 200)
                
                
                
            }
            
            .frame(width: 11/12 * deviceWidth, height: 260)
            .background{
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .strokeBorder(Color(UIColor.systemGray4))
            }
        }
}

#Preview {
    PodcastView(podcast: Podcast.defaultPodcast())
}
