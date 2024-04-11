//
//  MainMarketplaceUI.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/9/24.
//

import SwiftUI

struct MainMarketplaceUI: View {
    let sports = ["Tennis", "Baseball", "Football", "Lacrosse", "Badminton", "Soccer", "Rugby",
                  "Basketball", "Pickleball", "Cross Country", "Track and Field"]
    let levels = ["HS", "Collegiate", "Pro"]
    @State var query: String = ""
    @State var selectedSport: String = ""
    @State var level: String = ""
    @EnvironmentObject var podcastVM: PodcastVM
    @State private var currentIndex = 0
    @State private var maxPodcastViewHeight: CGFloat = 380
    
    @State var current = "Athletes"

    @Namespace var animation

    
    var body: some View {

        VStack(alignment: .leading, spacing: 0){
                

//                .padding(.leading, 10)

//            Text("Sport")
//                .font(.title3)
//                .foregroundStyle(.gray.opacity(0.8))
//                .padding(.leading, 15)
//
//            Text("Tennis")
//                .bold()
//                .font(.title)
//                .padding(.leading, 15)
            Spacer()
                .frame(height: 10)
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                TextField("Shop, discover, plan, and more! ", text: $query)
                    .foregroundColor(.black)
                    .textContentType(.newPassword)
                    .keyboardType(.asciiCapable)
                    .autocorrectionDisabled()
                    .listRowSeparator(.hidden)
            }.modifier(customViewModifier(roundedCornes: 30, startColor: Color(UIColor.systemGray5), endColor: Color(UIColor.systemGray5), textColor: .black, ratio: 0.92))
                .padding(10)
            Spacer()
                .frame(height: 10)
            HStack(spacing: 0){
                Spacer()
                CustomTabBarButton(current: $current, text: "Athletes", imageName: "figure.run", animation: animation)
                Spacer()
                CustomTabBarButton(current: $current, text: "Shop", imageName: "cart", animation: animation)
                Spacer()

                CustomTabBarButton(current: $current, text: "Events", imageName: "calendar", animation: animation)
                Spacer()

                CustomTabBarButton(current: $current, text: "Train", imageName: "dumbbell.fill", animation: animation)
                Spacer()
                CustomTabBarButton(current: $current, text: "Tickets", imageName: "ticket.fill", animation: animation)
                Spacer()


            }
//            HStack{
//                Spacer()
//                VStack{
//                    Image(systemName: "figure.run")
//                        .font(.system(size: 15))
//                        .foregroundStyle(.white)
//                    Text("Athletes")
//                        .foregroundStyle(.white)
//                        .font(.system(size: 15))
//                        .bold()
//
//                }
//                .background{
//                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
//                        .foregroundColor(Color(UIColor.systemBlue))
//                        .padding(-10)
//                        .opacity(0.3)
//                }
//                .scaleEffect(0.9)
//                Spacer()
//                VStack{
//                    Image(systemName: "calendar")
//                        .font(.system(size: 15))
//                        .foregroundStyle(.white)
//                    Text("Events")
//                        .foregroundStyle(.white)
//                        .font(.system(size: 15))
//                        .bold()
//
//                }
//                .background{
//                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
//                        .foregroundColor(Color(UIColor.systemBlue))
//                        .padding(-10)
//                }
//                .scaleEffect(0.9)
//                Spacer()
//                VStack{
//                    Image(systemName: "cart.fill")
//                        .font(.system(size: 15))
//                        .foregroundStyle(.white)
//                    Text("Shop")
//                        .foregroundStyle(.white)
//                        .font(.system(size: 15))
//                        .bold()
//
//                }
//                .background{
//                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
//                        .foregroundColor(Color(UIColor.systemBlue))
//                        .padding(-10)
//                }
//                .scaleEffect(0.9)
//                Spacer()
//                VStack{
//                    Image(systemName: "dumbbell.fill")
//                        .font(.system(size: 15))
//                        .foregroundStyle(.white)
//                    Text("Train")
//                        .foregroundStyle(.white)
//                        .font(.system(size: 15))
//                        .bold()
//
//                }
//                .background{
//                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
//                        .foregroundColor(Color(UIColor.systemBlue))
//                        .padding(-10)
//                }
//                .scaleEffect(0.9)
//
//                
//                Spacer()
//            }
            Spacer()
                .frame(height: 20)
            Divider()

            HStack(spacing: 0){
                Image(systemName: "cellularbars")
                    .font(.title)
                    .padding(10)
                Text("Trending")
                    .font(.title)
                    .bold()
                Spacer()
                
                
            }
            TabView(selection: $currentIndex.animation()) {
                ForEach(podcastVM.podcasts.indices, id: \.self) { index in
                    let podcast = podcastVM.podcasts[index]
                    PodcastView(podcast: podcast)
                        .background(
                            GeometryReader { innerGeometry in
                                Color.clear.onAppear {
                                    maxPodcastViewHeight = 280
                                    
                                }
                            }
                        )
                }
            }
            .frame(height: maxPodcastViewHeight)
            .tabViewStyle(.page(indexDisplayMode: .never))
            Spacer()
                .frame(height: 5)
            HStack{
                Spacer()
                Fancy3DotsIndexView(numberOfPages: podcastVM.podcasts.count, currentIndex: currentIndex)
                Spacer()
            }

            
            
            Spacer()
            
        }//.ignoresSafeArea(.all, edges: .top)
        }

        //.padding(.leading, 10)

}


#Preview {
    MainMarketplaceUI()
        .environmentObject(PodcastVM())
}
