//
//  NetworkContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/31/24.
//

import SwiftUI

struct AthleteStoryContentView: View {
    var body: some View {
        ScrollView(.vertical)
        {
            let filters = [
                "Leagues",
                "Location",
                "Ages"
            ]
            let text = [
                "Top Coaches in Your Area",
                "How a Good Agent Represents You",
                "Standing out to Recruiters",
                ""
            ]
            let videoURLS = [
                "https://www.youtube.com/watch?v=scoeJXP8dw0",
                "https://www.youtube.com/watch?v=hqXl8zr__tM",
                "https://www.youtube.com/watch?v=_fMmaD8ViL4",
                "https://www.youtube.com/watch?v=WCBP9272z68",
                "https://www.youtube.com/watch?v=8-f9eR9VJ9g"
            ]
            VStack{
                HStack{
                    Text("Athlete Stories")
                        .bold()
                        .font(.title)
                        .padding(.leading, 25)
                    Spacer()
                }
                
            }
            .background{
                LinearGradient(gradient:Gradient(colors:[
                    Color.white,
                    Color.white,
                    Color.blue.opacity(0.15),
                    Color.blue.opacity(0.25),
                ]),
                               startPoint:.top,endPoint:.bottom)
                .frame(width: deviceWidth, height: 220)
            }
            highlightview(url: "https://resources.finalsite.net/images/f_auto,q_auto/v1574257985/gdsorg/jwixqhshrrkgbllcuwfw/20190419_HighSchoolAthleticHighlights_1.jpg", text: "Explore Athlete Bios",
                          height: 180
            )
            
            FilterScrollView()
            

            BioScrollView()
            HStack{
                Text("Watch Your Favorite Athlete Clips")
                    .font(.title2)
                    .bold()
                    .padding(.leading, 20)
                Spacer()
                
            }
            .padding(.bottom, -5)
            ScrollView(.horizontal){
                HStack{
                    ForEach(videoURLS.indices, id: \.self) {index in
                        VideoPlayer2(url: videoURLS[index], width: 3/4 * deviceWidth, height: 220)
                            .padding(10)
                    }
                }
                .padding(20)
            }
            
            HStack{
                Text("Discover Similar Athletes Near You")
                    .font(.title2)
                    .bold()
                    .padding(.leading, 20)
                Spacer()

                
            }
            FeaturedAthletes()
            Spacer()
                .frame(height: 40)


        }
        
    }
}

#Preview {
    NetworkContentView()
        .environmentObject(AthleteVM())
        .environmentObject(PodcastVM())

}
