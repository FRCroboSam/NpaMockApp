//
//  ShopScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/12/24.
//

import SwiftUI
import NukeUI
struct CareerScrollView: View {
    @EnvironmentObject var podcastVM: PodcastVM
    @State private var currentIndex = 0
    @State private var maxPodcastViewHeight: CGFloat = 380
    @State var isFullScreen = false
    let filters = [
        "Sport",
        "League",
        "Location",
        "Ages",
        "Private-Only",
        "Group"
    ]
    @State private var urls = [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT10pPLCVdspYObXePS_bCG9AYYrpsj29xdOg&s",
        "https://online.jwu.edu/wp-content/uploads/2023/06/sports20agent.jpg",
        "https://thehill.com/wp-content/uploads/sites/2/2023/10/williamsjada_111822ap_high-school-athletes-nil.jpg?strip=1",
        "https://d3on3ztz3vi4v9.cloudfront.net/uploads/2013/06/25155356/Concentration-629x419-1.jpg",
    ]

    @State private var titles = [
        "Sports Industry",
        "NPA+ Careers",
        "Start Your Business",
        "Guide to Careers "
    ]
    @State private var amounts = [
        "34.3K",
        "1.2K",
        "234K",
        "567",
        "4.2K"
    ]
    
    let athleteFilters = [
        "All",
        "Private Lessons",
        "Group Lessons",
        "Clubs"
    ]
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 15){
                HStack{
                    Text("Alternative Routes with NPA+" )
                        .font(.title2)
                        .shadow(color: .black, radius: 3)
                        .foregroundStyle(.white)
                        .bold()
                    Spacer()
                    
                }
//                .padding(.leading, 20)
                HStack{
                    NavigationLink{
                        CareerContentView()
                    }label: {
                        HStack{
                            Text("Explore Jobs ")
                                .foregroundStyle(.gray)
                                .bold()

                            Image(systemName: "arrow.right")
                                .foregroundStyle(.gray)
                                .bold()

                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background{
                            Color.white
                                .roundedCorner(10, corners: .allCorners)
                        }
                    }
                    
                }
//                .padding(.leading, 20)
            }
            .padding(.leading, isFullScreen ? 0 : 15)

            //.padding(.leading, 15)
            .frame(width: isFullScreen ? deviceWidth : 12/13 * deviceWidth, height: 145)
            .background{
//                LinearGradient(gradient:Gradient(colors:[
//                    Color.black,
////                    Color.gray.opacity(0.7),
//                    Color.gray.opacity(0.1)
////                    Color(hex: "0A66C2").opacity(1.0),
////                    Color(hex: "0A66C2").opacity(0.2),
//                ]),
//               startPoint:.leading,endPoint:.trailing)
                Image("background_hor")
                    .resizable()
                    .opacity(0.8)
                    .scaledToFill()
//                    .frame(width: 13/14 * deviceWidth, height: 130)
                    .frame(width: isFullScreen ? deviceWidth : 12/13 * deviceWidth, height: 140)
                    .clipped()
                    .cornerRadius(isFullScreen ? 0 : 10)


            }
            //.padding(.leading, 20)
//            VStack{
//                ForEach(urls.indices, id: \.self) { index in
//                    NavigationLink{
//                        CareerContentView()
//                    }label: {
//                        CareerCategoryView(text: titles[index], imageURL: urls[index])
//                    }
//                }
//            }
            
//            .padding(.bottom, 10)
//
            
            //        ScrollView(.horizontal, showsIndicators: false){
            //            HStack(spacing: 10){
            //                Spacer()
            //                    .frame(width: 10)
            //                EventCardVertical(event_url: "https://www.footballcamps.com/media/fbcamps360webcmscom/photos/1458/1458_3.jpg")
            //
            //                EventCardVertical(event_url:
            //                            "https://www.ussportscamps.com/media/images/soccer/nike/camps/soxdal_gallerypic3_950x516.jpg"
            //                )
            //
            //                EventCardVertical(event_url:
            //                            "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg"
            //                )
            //                EventCardVertical(event_url:
            //                            "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg"
            //                )
            //
            ////                .scaleEffect(0.8)
            //
            //
            ////                .scaleEffect(0.8)
            //
            //            }
            //        }.scrollIndicators(.hidden)
        }
        .padding(.leading, isFullScreen ? 0 : 20)

    }
}

#Preview {
    CareerScrollView()
        .environmentObject(PodcastVM())
}
