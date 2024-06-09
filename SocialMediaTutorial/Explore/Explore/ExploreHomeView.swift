//
//  ExploreHomeView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/29/24.
//

import SwiftUI

struct ExploreHomeView: View {
    var body: some View {
        ScrollView{
            VStack{
                
                HStack(alignment: .center){
                    VStack(alignment: .leading){
                        Spacer()
                            .frame(height: 20)
                        Text("Welcome Bobby!")
                            .lineLimit(1)
                            .bold()
                            .font(.title)
                            .padding(.leading, 15)
                        
                        Spacer()
                            .frame(height: 10)
                        Text("Explore teams, coaches, events, shop for items, and more.")
                            .font(.system(size: 16))
                            .zIndex(10)
                            .lineLimit(2)
                            .padding(.leading, 20)
                        Spacer()
                            .frame(height: 20)
                    }
                    .zIndex(200)
                    Image("logo_blue")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .offset(x: -5, y: 0)
                        .padding(.trailing, 25)
                        .padding(.bottom, 10)
                }
//                Spacer()
//                    .frame(height: 10)
            }
            .background{
                LinearGradient(gradient:Gradient(colors:[
                    Color.white,
                    Color.blue.opacity(0.05),
                    Color.blue.opacity(0.1),
                    Color.blue.opacity(0.3),
                ]),
                               startPoint:.top,endPoint:.bottom)
                .frame(width: deviceWidth, height: 200)
            }
            .zIndex(0)
            VStack(alignment:  .leading, spacing: 0){
                HighlightScrollView()
//
                Spacer()
                    .frame(height: 10)
                HStack(spacing: 0){
                    
                    Text("Explore" )
                    
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
//                
                CategoryScrollView()
                Spacer()
                    .frame(height: 15)
                HStack(spacing: 0){
                    
                    Text("Events For You" )
                    
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
                EventTypeScrollView()
                    .offset(x: -5)
                
                
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
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    ExploreHomeView()
        .environmentObject(PodcastVM())
        .environmentObject(AthleteVM())
        .environmentObject(FeedVM())
}
