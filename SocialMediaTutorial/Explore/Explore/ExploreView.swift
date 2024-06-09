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
    @State var current = "Athletes"

    let levels = ["HS", "Collegiate", "Pro"]
    @State var query: String = ""
    @State var selectedSport: String = ""
    @State var level: String = ""
    @EnvironmentObject var podcastVM: PodcastVM
    @State private var currentIndex = 0
    @State private var maxPodcastViewHeight: CGFloat = 380
    @State private var tabSelection: TabBarItem = .shop
    @State var tabs: [TabBarItem] = [.athletes, .train2, .events, .shop, .tickets, .train, .athlete2s]//, .event2s, .shop2, .ticket2s, .train2]

    
    @Namespace var animation
    @Namespace var namespace

     
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 0){

                    VStack(alignment: .leading, spacing: 0){
                        Spacer()
                            .frame(height: 45)
                        HStack(spacing: 0){
                            
                            Image(systemName: "tennisball.fill")
                            //                        .bold()
                                .font(.title)
                                .foregroundStyle(Color(hex: "0077B6").opacity(1.0))
                                .background{
                                    Color(UIColor.systemBlue).opacity(0.2)
                                        .clipped()
                                        .clipShape(.circle)
                                        .frame(width: 40, height: 40)
                                }
                                .padding(.leading, 20)
                            
                            DropdownPicker(value: $selectedSport, text: "Select a sport: ", color: .white.opacity(0.2), textColor: Color(hex: "0077B6"), items: sports)
                            //                                .zIndex(500)
                            Spacer()
                            
                            Image(systemName: "cart")
                            //                        .bold()
                                .font(.title3)
                                .foregroundStyle(Color(hex: "0077B6").opacity(1.0))
                                .background{
                                    Color(UIColor.systemBlue).opacity(0.2)
                                        .clipped()
                                        .clipShape(.circle)
                                        .frame(width: 42, height: 42)
                                }
                                .padding(.leading, 20)
                            
                            NavigationLink {
                                SearchView()
                            } label: {
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.black)

                                }.modifier(customViewModifier(roundedCornes: 30, startColor: Color(UIColor.systemGray5), endColor: Color(UIColor.systemGray5), textColor: Color(UIColor.systemBlue), ratio: 0.2))
                                    .scaleEffect(0.8)
                            }
                        }
                        Spacer()
                            .frame(height: 10)
                        
                        CustomTabBarView(tabs: tabs, selection: $tabSelection, localSelection: tabSelection)
                            .zIndex(10)
                        Divider()
                            .zIndex(10)

                        
                    }

                    .ignoresSafeArea(.all, edges: .top)

                    
                }
                if(tabSelection == .athletes){
                    ExploreHomeView()
                        .offset(y: -10)
                        .transition(.opacity)
                }
                else if(tabSelection == .events){
                    EventTabContentView()
                        .transition(.opacity)

                }
                else if(tabSelection ==
                    .train2){
                    NetworkContentView()
                        .transition(.opacity)

                }
                else if(tabSelection == .shop){
                    ShopContentView()
                        .transition(.opacity)

                }
                else if(tabSelection == .tickets){
                    TicketContentView()
                        .transition(.opacity)

                }
                else if(tabSelection ==
                    .athlete2s){
                    ShowcasesContentView()
                        .transition(.opacity)

                }
                else{
                    TrainingContentView()
                        .transition(.opacity)

                }
            }
            .scrollIndicators(.hidden)
            .ignoresSafeArea(.all, edges: .top)

        }

    }
    
}

#Preview {
    ExploreView()
        .environmentObject(PodcastVM())
        .environmentObject(AthleteVM())
        .environmentObject(FeedVM())
}
