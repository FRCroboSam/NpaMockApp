//
//  MainExploreView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/9/24.
//

import SwiftUI

struct MainExploreView: View {
    let sports = ["Tennis", "Baseball", "Football", "Lacrosse", "Badminton", "Soccer", "Rugby",
                  "Basketball", "Pickleball", "Cross Country", "Track and Field"]
    @State var searchText = ""
    @State var selectedSport = "Tennis"
    var body: some View {
        NavigationStack{
            Spacer()
                .frame(height: 10)
            ScrollView{
                VStack{
                    VStack{
                        Spacer()
                            .frame(height: 40)
                        HStack{
                            Text("Welcome, Bobby")
                                .font(.title)
                                .bold()
                                .padding(.leading, 25)
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
                                .padding(.leading, 15)
                                .padding(.trailing, 25)
                            
                        }

                        HStack(spacing: 0){
                            NavigationLink {
                                SearchView()
                            } label: {
                                VStack(alignment: .leading){
                                    HStack{
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.black.opacity(0.6))
                                        
                                        
                                        Text("What's on your mind?")
                                            .font(.headline)
                                            .foregroundStyle(.gray.opacity(0.6))
                                        
                                        Spacer()
                                        
                                    }
                                    Rectangle()
                                        
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(width: 2/3 * deviceWidth, height: 2)
                                }
                                
                                .frame(width: 3/4 * deviceWidth)
                                .padding(.vertical, 15)
                                .padding(.horizontal, 10)
                                .background{
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(Color(UIColor.clear))
                                }
                            }
                            .padding(.leading, 20)
                            
                            Spacer()
                            
                            
                        }
                        .ignoresSafeArea(.all, edges: .top)
                        
                        HighlightScrollView()

                        
                        Spacer()
                            .frame(height: 15)
                        CategoryGroupView()
                        Spacer()
                            .frame(height: 5)
                        HStack(spacing: 10){
                            ExploreCategoryView(
                                imageName: "mental_icon",
                                textName: "Mental"
                            )
                            ExploreCategoryView(
                                imageName: "agent_icon",
                                textName: "Agents"
                            )
                            
                            ExploreCategoryView(imageName: "coaching_icon", textName: "Coaching")
                        }
                       


                        Spacer()
                            .frame(height: 15)
                        BioScrollView()
                            .zIndex(1000)
                        //HighlightScrollView()
                        
                        
//                        .background{
//                            RoundedRectangle(cornerRadius: 20)
//                                .fill(Color(UIColor.systemGray6))
//                        }
                    }
                    .ignoresSafeArea(.all, edges: .top)

                    
                
                    
                    VStack {

                        
//                        VerificationReminder()
//                        Spacer()
//                            .frame(height: 10)
                        HStack(spacing: 0){
                            
                            Text("Events For You" )
                            
                                .bold()
                                .font(.title2)
                                .padding(.top, -20)
                                .padding(.leading, 20)
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

                        Spacer()
                            .frame(height: 10)
                        EventTypeScrollView()
                            .offset(x: -25)
                        
                        
                        Spacer()
                            .frame(height: 20)
                        HStack(spacing: 0){
                            
                            Text("Shop Categories" )
                            
                                .bold()
                                .font(.title2)
                                .padding(.leading, 20)
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
                        Spacer()
                            .frame(height: 10)
                        ShopCategoriesScrollView()
                            .padding(.leading, 5)

                        
                        
                        Spacer()
                            .frame(height: 20)
                        HStack{
                            Text("Popular")
                                .font(.title2)
                                .bold()
                                .padding(.leading, 20)
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



                }

            }

            
            .ignoresSafeArea(.all, edges: .top)



        }
        
    }
}

#Preview {
    MainExploreView()
        .environmentObject(PodcastVM())
        .environmentObject(AthleteVM())
        .environmentObject(FeedVM())
}
