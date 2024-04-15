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
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    Spacer()
                        .frame(height: 10)
                    HStack(spacing: 0){
                        HStack{
                            Text("Explore")
                                .font(.title)
                                .bold()
                                .padding(.leading, 15)

                        }
//                        Spacer()
                            

                        Spacer()
                            
                        DropdownPicker(value: $selectedSport, text: "Select a sport: ", color: Color(hex: "ADD8E6"), textColor: Color(UIColor.darkGray), items: sports)
                                .zIndex(500)
                                .offset(x: 10)
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
//                            TextField("Shop, discover, plan, and more! ", text: $query)
//                                .foregroundColor(.black)
//                                .textContentType(.newPassword)
//                                .keyboardType(.asciiCapable)
//                                .autocorrectionDisabled()
//                                .listRowSeparator(.hidden)
                        }.modifier(customViewModifier(roundedCornes: 30, startColor: Color(UIColor.systemGray5), endColor: Color(UIColor.systemGray5), textColor: .black, ratio: 0.2))
                            .padding(.leading, 10)
                            .scaleEffect(0.8)
                        
                    }
                    Spacer()
                        .frame(height: 8)
                    
//                    HStack{
//                        Text("Your NPA Portal " )
//                            .bold()
//                            .font(.title)
//                            .padding(.leading, 10)
//                    }
                    
                    
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
                        .frame(height: 5)
                    CustomTabBarView(tabs: tabs, selection: $tabSelection, localSelection: tabSelection)
                    //                HStack{
                    //                    Spacer()

                    //                    Spacer()
                    //                }
                    Spacer()
                        .frame(height: 20)
                    Divider()
                    
                    VStack(alignment:  .leading, spacing: 0){
                        
                        
                        //AthleteScrollView(athletes: athleteVM.athletes)
                        HStack(spacing: 0){
                            Image(systemName: "cellularbars")
                                .font(.title)
                                .padding(.leading, 10)
                            
                            Text("Trending" )
                                .bold()
                                .font(.title)
                                .padding(.leading, 10)
                            Spacer()
                            
                            
                        }
                        Spacer()
                            .frame(height: 10)
                        FeaturedAthletes()
                        Spacer()
                            .frame(height: 10)
                        HStack(spacing: 0){
                            Image(systemName: "calendar")
                                .font(.title)
                                .padding(.leading, 10)
                            
                            Text("Events" )
                                .bold()
                                .font(.title)
                                .padding(.leading, 10)
                            Spacer()
                            
                            
                        }
                            
                        Spacer()
                            .frame(height: 10)
                        EventScrollView()
                        Spacer()
                            .frame(height: 10)
                        HStack(spacing: 0){
                            Image(systemName: "cart.fill")
                                .font(.title)
                                .padding(.leading, 10)
                            
                            Text("Shop" )
                                .bold()
                                .font(.title)
                                .padding(.leading, 10)
                            Spacer()
                            
                            
                        }
                        ShopScrollView()
                        
                        Spacer()
                            .frame(height: 50)
                        
                        
                        
                    }
                    
                    //.ignoresSafeArea(.all, edges: .top)
                }
                
                //.padding(.leading, 10)
            }
        }
    }
    
}

#Preview {
    ExploreView()
        .environmentObject(PodcastVM())
        .environmentObject(AthleteVM())
        .environmentObject(FeedVM())
}
