//
//  MainMarketplaceUI.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/9/24.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var athleteVM: AthleteVM
    let sports = ["Tennis", "Baseball", "Football", "Lacrosse", "Badminton", "Soccer", "Rugby",
                  "Basketball", "Pickleball", "Cross Country", "Track and Field"]
    let levels = ["HS", "Collegiate", "Pro"]
    @State var query: String = ""
    @State var selectedSport: String = ""
    @State var level: String = ""
    @EnvironmentObject var podcastVM: PodcastVM
    @State private var currentIndex = 0
    @State private var maxPodcastViewHeight: CGFloat = 380
    @State private var tabSelection: TabBarItem = .athletes
    @State var tabs: [TabBarItem] = [.athletes, .events, .shop, .tickets, .train]

    @State var current = "Athletes"
    
    @Namespace var animation
    @Namespace var namespace

    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center, spacing: 0){
                Spacer()
                    .frame(height: 5)
                
                HStack{
                    Spacer()
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
                    Spacer()
                }
                
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
                
                Spacer()
                    .frame(height: 10)
                CustomTabBarView(tabs: tabs, selection: $tabSelection, localSelection: tabSelection)
                
                Spacer()
                    .frame(height: 20)
                Divider()
                
                VStack(spacing: 0){
                    
                    HStack(spacing: 0){
                        Image(systemName: "cellularbars")
                            .font(.title)
                            .padding(10)
                        Text("Tennis")
                            .font(.title)
                            .bold()
                        Image(systemName: "chevron.down")
                            .font(.headline)
                            .padding(.trailing, 30)
                        Spacer()
                    }
                    AthleteScrollView(athletes: athleteVM.athletes)
                    
                    
                    
                }

                //.ignoresSafeArea(.all, edges: .top)
            }
            
            //.padding(.leading, 10)
        }
    }
    
}

#Preview {
    ExploreView()
        .environmentObject(PodcastVM())
        .environmentObject(AthleteVM())
}
