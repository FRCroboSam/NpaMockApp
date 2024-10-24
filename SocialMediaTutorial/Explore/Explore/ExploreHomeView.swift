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
                Divider()

                HStack(alignment: .center){
                    VStack(alignment: .leading){
                        Spacer()
                            .frame(height: 15)
                        HStack{
                            Text("Welcome, ")
                                .lineLimit(1)
                                .bold()
                                .font(.title)
                                .padding(.leading, 15)
                            Text("Bobby")
                                .foregroundStyle(Color(hex: "0A66C2"))
                                .lineLimit(1)
                                .bold()
                                .font(.title)
                        }
                        
                        Spacer()
                            .frame(height: 10)
                        Text("Explore teams, coaches, events, shop for items, and more.")
                            .font(.system(size: 16))
                            .zIndex(10)
                            .lineLimit(2)
                            .padding(.leading, 17)
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
                    Color.white,
                    Color.blue.opacity(0.15),
                    Color.blue.opacity(0.25),
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
                    HStack{
                        Text("NPA+" )
                            .foregroundStyle(Color(hex: "0A66C2"))
                            .bold()
                            .font(.title2)
                            .padding(.leading, 20)
                        Text("Services")
                            .bold()
                            .font(.title2)
                            .padding(.leading, 0)
                    }
                    Spacer()
                    Button{
                        
                    }label:{
                        Text("View More")
                            .foregroundStyle(Color(hex: "0A66C2"))
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
                            .foregroundStyle(Color(hex: "0A66C2"))
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
                    .offset(x: 20)

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
                            .foregroundStyle(Color(hex: "0A66C2"))
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
                CareerScrollView()
                Spacer()
                    .frame(height: 15)
                HStack{
                    Text("Popular")
                        .font(.title2)
                        .bold()
                        .padding(.leading, 20)
                        .padding(.bottom, 10)
                    Spacer()
                    Button{
                        
                    }label:{
                        Text("View More")
                            .foregroundStyle(Color(hex: "0A66C2"))
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
                .padding(.bottom, 15)
                
                ShopScrollView()
                    .padding(.leading, 5)
                Spacer()
                    .frame(height: 15)
                Text("Your Favorite Athletes")
                    .font(.title2)
                    .bold()
                    .padding(.leading, 20)
                    .padding(.bottom, 2)
                    .padding(.top, 10)
                BioScrollView()
                    .padding(.leading, 2)
                
                
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
