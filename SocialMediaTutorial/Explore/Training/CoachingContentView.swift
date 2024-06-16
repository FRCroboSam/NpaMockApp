//
//  NetworkContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/31/24.
//

import SwiftUI
import YouTubePlayerKit

struct CoachingContentView: View {
    @EnvironmentObject var feedVM: FeedVM
    let sports = [
        "All",
        "Bios",
        "Clips",
        "Suggested",
    ]
    let coachNames = [
        "Byron Jones",
        "Marcus Lindfors",
        "George Plum",
        "Ryan Chalmers",
        "Daniel Jones",
        "Allen Grayson"
    ]
    
    let coachLocations = [
        "Los Angeles, CA", "San Francisco, CA", "San Diego, CA", "Sacramento, CA", "San Jose, CA", "Fresno, CA",
    ]
    @State var coachImages = [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1nfUzHtWiCLSyu45i7t7YydHqiWN_mDBiIQ&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaKeS_9uk0mXcMe34FwwbF6rUXxbZs3j8enqw3vyfVFb-OAFVcBA12fMMW1RiOJw-K4To&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLT2d-jb5CCrF70xzBoP1xMPxIfmIJJ0sWvLbyPOcWik1ytZddQI5yPWHm17DTPZm8jb8&usqp=CAU",
        "https://i0.wp.com/djcoilrugby.com/wp-content/uploads/2017/08/img_4881-1-e1506903679769.jpg?fit=150%2C250&ssl=1",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVMWox7iiKY0mTWkSJGiIr-nRT8QigPJl1La69MWffy0xyfNdDFhD3x2Fouh1LpuxdjSY&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStuWlwlCfNcnkLeg05PACcC7S18Wb2Lul-cvFCH4R5yk4yUi5_5YsVk81b3ONRXzT3VYg&usqp=CAU"
        
    ]
    @State private var urls = [
        "https://www.footballcamps.com/media/fbcamps360webcmscom/photos/1458/1458_3.jpg",
        "https://www.ussportscamps.com/media/images/soccer/nike/camps/soxdal_gallerypic3_950x516.jpg",
        "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg",
        "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg"
    ]
    @State private var facility_names = [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCnSd6wyVnTPyXMJOTqfxYm_vZYS_dPXEqtg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKfeINZNIMZjqSIxCfOS4bndlINOj7mqRFqg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXXAyL1hFqul1n5iO_MXyHa4pm9e1OASUEMQ&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCOD6mDciYB8HhbdeEBwT6Szs7UbQgYWzBmQ&s"
    ]
    
    @State var selected = "All"
    let coachType = [
        "All",
        "Private Lessons",
        "Group Lessons",
        "Clubs"
    ]
    @State var selectedSport = "All"
    var body: some View {
        ScrollView(.vertical)
        {

            let filters = [
                "Sport",
                "League",
                "Location",
                "Ages",
                "Private-Only",
                "Group"
            ]
            let text = [
                "Top Coaches in Your Area",
                "How a Good Agent Represents You",
                "Standing out to Recruiters",
                ""
            ]
            let event_names = [
                "Alderwood Group Lessons",
                "Little Kickers Soccer Camp",
                "Young Fishies Group Lessons",
                "Young Fishies Group Lessons",

            ]
            let club_names = [
                "Alderwood Community Center",
                "Bellevue Soccer Club",
                "Redmond City Sports Center",
                "CollinWall Football Club",

            ]
            let videoURLS = [
                "https://www.youtube.com/watch?v=scoeJXP8dw0",
                "https://www.youtube.com/watch?v=hqXl8zr__tM",
                "https://www.youtube.com/watch?v=_fMmaD8ViL4",
                "https://www.youtube.com/watch?v=WCBP9272z68",
                "https://www.youtube.com/watch?v=8-f9eR9VJ9g"
            ]
            CustomNavBar(title: "Coaching")
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
            CategoryTabView(selection: $selected, categories: coachType)

            
            VStack{
                Divider()
                    .padding(.bottom, 10)
                highlightview(url: "https://online.maryville.edu/wp-content/uploads/sites/97/2023/09/coach.jpg", text: "Finding The Right Coach",
                              width: 9/10 * deviceWidth, height: 180
                )
                .padding(.top, 10)
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
            
            EventFilterScrollView(filters: filters)
                .padding(.bottom, 10)
                .padding(.top, 10)
            
            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 20)
                HStack{
                    Text("Private Coaches nearby")
                        .bold()
                        .padding(.leading, 20)
                        .font(.title2)
                        .padding(.bottom, -5)
                    Spacer()
                    Button{
                        
                    }label:{
                        Text("View More")
                            .foregroundStyle(.blue)
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
//                Text("Find the right coach to hone your skills")
//                    .padding(.trailing, 15)
//                    .padding(.top, 5)
//                    .padding(.leading, 22)
//                    .foregroundStyle(.gray.opacity(0.9))
//                    .padding(.bottom, -5)
                BioScrollView(names: coachNames, images: coachImages, locations: coachLocations, imageURLS: coachImages)
                    .padding(.leading, 0)
                Spacer()
                    .frame(height: 5)
                HStack{
                    Text("Group Coaching")
                        .bold()
                        .padding(.leading, 20)
                        .font(.title2)
                        .padding(.bottom, -5)
                    Spacer()
                    Button{
                        
                    }label:{
                        Text("View More")
                            .foregroundStyle(.blue)
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
                
//                Text("Explore group lessons at nearby Clubs")
//                    .padding(.trailing, 15)
//                    .padding(.bottom, -5)
//                    .padding(.leading, 23)
//                    .foregroundStyle(.gray.opacity(0.9))
                ScrollView(.horizontal){
                    HStack {
                        Spacer()
                            .frame(width: 15)
                        ForEach(urls.indices, id: \.self) { index in
                            EventCardVertical(event_url: urls[index],
                                              event_name: event_names[index], showDates: false)
                            .padding(10)
                        }
                    }
                }.scrollIndicators(.hidden)
                HStack{
                    Text("Facilities Near You")
                        .bold()
                        .padding(.leading, 20)
                        .font(.title2)
                        .padding(.bottom, -5)
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
//                Text("Find a community to develop your skills")
//                    .padding(.trailing, 5)
//                    .padding(.leading, 23)
//                    .foregroundStyle(.gray.opacity(0.9))
//                    .padding(.bottom, -25)
                ScrollView(.horizontal){
                    HStack {
                        Spacer()
                            .frame(width: 15)
                        ForEach(urls.indices, id: \.self) { index in
                            EventCardVertical(event_url: facility_names[index],
                                              showAges: false, event_name: club_names[index], showDates: false
                            )
                            .padding(10)
                        }
                    }
                }.scrollIndicators(.hidden)
                .frame(height: 320)
            }
                


        }
        
    }
}

#Preview {
    NetworkContentView()
        .environmentObject(AthleteVM())
        .environmentObject(PodcastVM())

}
