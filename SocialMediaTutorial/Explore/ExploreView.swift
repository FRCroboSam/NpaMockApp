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
                                    //                            TextField("Shop, discover, plan, and more! ", text: $query)
                                    //                                .foregroundColor(.black)
                                    //                                .textContentType(.newPassword)
                                    //                                .keyboardType(.asciiCapable)
                                    //                                .autocorrectionDisabled()
                                    //                                .listRowSeparator(.hidden)
                                }.modifier(customViewModifier(roundedCornes: 30, startColor: Color(UIColor.systemGray5), endColor: Color(UIColor.systemGray5), textColor: Color(UIColor.systemBlue), ratio: 0.2))
                                //                                    .padding(.leading, 10)
                                    .scaleEffect(0.8)
                            }
                            
                            
                            
                        }
                        Spacer()
                            .frame(height: 10)
                        CustomTabBarView(tabs: tabs, selection: $tabSelection, localSelection: tabSelection)
                        VStack(){
                            Divider()
                                .offset(y: -15)
                            
                            
                            //                        Spacer()
                            //                            .frame(height: 8)
                            //
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
                            //                        Spacer()
                            //                            .frame(height: 10)
                            //
                            Spacer()
                                .frame(height: 5)
                            
                            //                HStack{
                            //                    Spacer()
                            
                            //                    Spacer()
                            //                }

                            HStack{
                                
                                VStack{
//                                    Spacer()
//                                        .frame(height: 10)
                                    Text("Welcome Bobby!")
                                        .bold()
//                                        .padding(.leading, 20)
                                        .offset(x: -5)
                                        .font(.title)
                                    Spacer()
                                        .frame(height: 10)
                                    Text("Explore teams, coaches, events, shop for items, and more.")
                                        .padding(.leading, 20)
                                        .zIndex(10)
                                    Spacer()
                                    
                                    
                                    
                                }
                                .zIndex(200)
                                
                                Spacer()
                                Image("athlete4")
                                    .resizable()
                                    .scaledToFit()
                                //.rotationEffect(.init(degrees: 20))
                                    .frame(width: 140, height: 180)
                                //put background stuff here if necessary
                                    .zIndex(0)
                                    .frame(width: 100, height: 120)
                                    .padding(.trailing, 20)
                                    .offset(y: -10)
                                
                                
                                
                            }
                            
                        }

                    }
                    .background{
                        LinearGradient(gradient:Gradient(colors:[
                            Color.white,
                            Color.white,
                            Color.blue.opacity(0.3),
//                            Color(hex: "0A66C2").opacity(0.2)

        
        
        
                        ]),
                           startPoint:.top,endPoint:.bottom)
                        .frame(height: 450)
                    }

                        




                    .ignoresSafeArea(.all, edges: .top)
                    
                    
                    VStack(alignment:  .leading, spacing: 0){
                    
                        //                HStack{
                        //                    Spacer()
    
                        //                    Spacer()
                        //                }
//                        Spacer()
//                            .frame(height: 5)
//                        Divider()
//                        Spacer()
//                            .frame(height: 10)
//                        
//                        Spacer()
//                            .frame(height: 20)
                        HighlightScrollView()
                            .padding(.top, -10)
                        
                        Spacer()
                            .frame(height: 10)
                        HStack(spacing: 0){
                    
                            Text("Discover" )
                            
                                .bold()
                                .font(.title2)
                                .padding(.leading, 20)
                            Spacer()
                            
                            
                        }
                        CategoryScrollView()
                        Spacer()
                            .frame(height: 15)
                        HStack(spacing: 0){
                    
                            Text("Events For You" )
                            
                                .bold()
                                .font(.title2)
                                .padding(.leading, 20)
                            Spacer()
                            
                            
                        }
                        Spacer()
                            .frame(height: 10)
                        EventTypeScrollView()
                        
                        
                        Spacer()
                            .frame(height: 20)
                        HStack(spacing: 0){
                    
                            Text("Shop Categories" )
                            
                                .bold()
                                .font(.title2)
                                .padding(.leading, 20)
                            Spacer()
                            
                            
                        }
                        Spacer()
                            .frame(height: 10)
                        ShopCategoriesScrollView()
                        Spacer()
                            .frame(height: 20)
                        HStack{
                            Text("Popular")
                                .font(.title2)
                                .bold()
                                .padding(.leading, 20)

                        }

                        ShopScrollView()
                        Spacer()
                            .frame(height: 10)
                        HStack{
                            Text("Featured Athletes")
                                .font(.title2)
                                .bold()
                                .padding(.leading, 20)

                        }
                            //.offset(x: 15)
                        FeaturedAthletes()

                        
                        Spacer()
                            .frame(height: 10)
                        
                        Spacer()
                            .frame(height: 50)
                        
                        
                        
                    }
                    
                    .ignoresSafeArea(.all, edges: .top)
                }
                .ignoresSafeArea(.all, edges: .top)

                
                //.padding(.leading, 10)
            }
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
