//
//  NetworkContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/31/24.
//

import SwiftUI
import YouTubePlayerKit

struct AthleteStoryContentView: View {
    @EnvironmentObject var feedVM: FeedVM
    let sports = [
        "All",
        "Bios",
        "Clips",
        "Suggested",
    ]
    @State var selected = "All"
    
    @State var selectedSport = "All"
    var body: some View {
        CustomNavBar(title: "Athlete Stories")

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
                //            .background{
                //                LinearGradient(gradient:Gradient(colors:[
                //                    Color.white,
                //                    Color.white,
                //                    Color.blue.opacity(0.15),
                //                    Color.blue.opacity(0.25),
                //                ]),
                //                               startPoint:.top,endPoint:.bottom)
                //                .frame(width: deviceWidth, height: 220)
                //            }
                CategoryTabView( selection: $selected, categories: sports)
                    .padding(.top, 10)
            VStack{
                Divider()
                    .padding(.bottom, 10)
                
                
                
                
                highlightview(url: "https://resources.finalsite.net/images/f_auto,q_auto/v1574257985/gdsorg/jwixqhshrrkgbllcuwfw/20190419_HighSchoolAthleticHighlights_1.jpg", text: "Explore Athlete Bios",
                              width: 9/10 * deviceWidth, height: 175
                )
            }
            .background{
                LinearGradient(gradient:Gradient(colors:[
                    Color.white,
                    Color.blue.opacity(0.15),
                    Color.blue.opacity(0.25),

                ]),
                               startPoint:.top,endPoint:.bottom)
                .frame(width: deviceWidth, height: 1/10 * deviceHeight )
            }
//            
//            EventFilterScrollView(filters: filters)
//                .padding(.bottom, 10)

            
            
            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 25)
                HStack{
                    Text("Athlete Bios")
                        .bold()
                        .padding(.leading, 20)
                        .font(.title2)
                        .padding(.bottom, 3)
                    Spacer()
                    Button{
                        
                    }label:{
                        Text("View More")
                            .font(.system(size: 15))
                            .padding(10)
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue).opacity(0.1)
                            }
                            .padding(.bottom, 5)
                        
                    }
                    .padding(.trailing, 10)
                }
                Text("Read about your favorite athletes in a short bio.")
                    .padding(.trailing, 15)
                    .padding(.leading, 22)
                    .foregroundStyle(.gray.opacity(0.9))
                    .padding(.bottom, -15)

                BioScrollView()
                    .padding(.leading, 0)
                    .padding(.bottom, -15)
                Divider()
                    .padding(.bottom, 10)
                HStack{
                    
                    Text("Watch Your Favorite Athlete Clips")
                        .font(.title2)
                        .bold()
                        .padding(.leading, 15)
                        .padding(.top, -10)
                    Spacer()
                    
                }
                .padding(.bottom, -5)
                ScrollView(.horizontal){
                    HStack{
                        ForEach(videoURLS.indices, id: \.self) {index in
                            YouTubePlayerView(
                                feedVM.athlete_clip_players[index],
                                placeholderOverlay: {
                                    LoadingView(width: deviceWidth, height: 200)
                                }
                            )
                            
                            .frame(width: 7/8 * deviceWidth, height: 200)
                            .roundedCorner(10, corners: .allCorners)
                        }
                    }
                    .padding(20)
                }.scrollIndicators(.hidden)
                    .padding(.leading, 10)
                Divider()

                Spacer()
                    .frame(height: 10)
                HStack{
                    Text("Discover Similar Athletes Near You")
                        .font(.title2)
                        .bold()
                        .padding(.leading, 15)
                    Spacer()
                    
                    
                }
                FeaturedAthletes()
                    .padding(.leading, 20)
                    .padding(.top, -10)
                Spacer()
                    .frame(height: 55)
            }


        }
        
    }
}

#Preview {
    NetworkContentView()
        .environmentObject(AthleteVM())
        .environmentObject(PodcastVM())

}
