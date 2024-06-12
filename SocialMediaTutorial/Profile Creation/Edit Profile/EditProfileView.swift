//
//  AthleteListView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/21/24.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var feedVM: FeedVM
    var athlete: Athlete
    @State var athleteHeadline: String = ""
    @State var athlete_text: String = ""
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    @State var fill: CGFloat = 0.0
    
    @State var current = "Posts"
    @Namespace var animation
    
    @State var preferences = [
        "Favorited Athletes", "Saved Posts", "Saved Events"
    ]
    
    @State var preferenceImages = [
        "figure.run", "video", "calendar"
    ]
    
    @State var documents = [
        "Grade Reports", "Drug Screening", "Medical Waivers"
    ]
    
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    Spacer()
                        .frame(height: 10)
                    VStack(spacing: 5){
                        
                        Group{
                            Spacer()
                                .frame(height: 40)
                            Text(athlete.first_name + " "  + athlete.last_name)
                                .bold()
                                .font(.title)
                                .padding(10)
                            ZStack{
                                Circle()
                                    .stroke(Color(UIColor.systemGray5),
                                            style: StrokeStyle(lineWidth: 10,
                                                               lineCap: .round)
                                    )
                                    .frame(width: 115, height: 115)
                                Circle()
                                    .trim(from: 0, to: self.fill)
                                    .stroke(Color(hex: "0A66C2"),
                                            style: StrokeStyle(lineWidth: 10,
                                                               lineCap: .round)
                                    )
                                    .rotationEffect(.init(degrees: -90))
                                    .frame(width: 115, height: 115)
                                Image(athlete.profile_img)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .clipShape(.circle)
                                
                            }
                            .onAppear{
                                self.fill = 0.0
                                withAnimation(.easeInOut.speed(0.5)){
                                    self.fill = 0.5
                                }
                            }
                            Text("50%")
                                .bold()
                                .font(.system(size: 15))
                                .foregroundStyle(.white)
                                .padding(5)
                                .background{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.white)
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color(hex: "0A66C2"))
                                            .padding(2)
                                        
                                    }
                                    
                                }
                                .padding(.top, -25)
                        }
                        .zIndex(20)
                        
                        VStack(spacing: 5){
                            Group{
                                Spacer()
                                    .frame(height: 50)
                                
                                Text("Complete Your Profile")
                                    .foregroundStyle(.blue)
                                    .padding(10)
                                    .background{
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.blue.opacity(0.2))
                                    }
                                    .overlay(alignment: .topTrailing){
                                        Circle()
                                            .fill(.red)
                                            .frame(width: 15, height: 15)
                                            .offset(x: 5, y: -5)
                                        
                                    }
                                Spacer()
                                    .frame(height: 10)
                            }
                            StatsView()
                            Spacer()
                                .frame(height: 10)
                        }
                        .frame(width: 7/8 * deviceWidth)
                        
                        .background{
                            Color.white
                                .cornerRadius(20)
                                .shadow(radius: 1)
                            
                        }
                        
                        
                        .offset(y: -50)
                        .padding(.bottom, -50)
                        
                        Spacer()
                            .frame(height: 0)
                        NavigationLink{
                            VerificationView()
                        }label: {VerificationNotification()
                                .padding(10)
                        }
                        
                        HStack{
                            Image(systemName: "person")
                                .font(.title2)
                                .foregroundStyle(Color(.gray))
                                .padding(10)
                                .background{
                                    Color(UIColor.systemGray5).opacity(0.8)
                                        .clipped()
                                        .clipShape(.circle)
                                }
                            Text("Athlete Info")
                                .foregroundStyle(.black)
                            Spacer()
                            Text("32% Complete")
                                .foregroundStyle(Color(UIColor.red).opacity(2.0))
                                .padding(2)
                                .background{
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.red.opacity(0.2))
                                }
                            Image(systemName: "chevron.down")
                                .font(.title2)
                                .foregroundStyle(.gray)
                                .rotationEffect(.init(degrees: -90))
                            //
                        }
                        .padding(10)
                        .frame(width: 7/8 * deviceWidth)
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .shadow(radius: 1)
                        }
                        
                        Spacer()
                            .frame(height: 5 )
                        
                        HStack{
                            Image(systemName: "info")
                            //                        .bold()
                                .font(.title)
                                .foregroundStyle(Color(.gray))
                                .padding(10)
                                .background{
                                    Color(UIColor.systemGray5).opacity(0.8)
                                        .clipped()
                                        .clipShape(.circle)
                                }
                            Text("Personal Info")
                                .foregroundStyle(.black)
                            Spacer()
                            
                            Image(systemName: "chevron.down")
                                .font(.title2)
                                .foregroundStyle(.gray)
                                .rotationEffect(.init(degrees: -90))
                            //
                        }
                        .padding(10)
                        .frame(width: 7/8 * deviceWidth)
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .shadow(radius: 1)
                        }
                        Spacer()
                            .frame(height: 5)
                        
                        AthleteDocs()
                        Spacer()
                            .frame(height: 5 )
                        Preferences()
                            .zIndex(10)
                        Spacer()
                            .frame(height: 5 )
                        
                        
                        
                        HStack{
                            Image(systemName: "pencil")
                            //                        .bold()
                                .font(.title)
                                .foregroundStyle(Color(.gray))
                                .padding(10)
                                .background{
                                    Color(UIColor.systemGray5).opacity(0.8)
                                        .clipped()
                                        .clipShape(.circle)
                                }
                            Text("Your Posts")
                                .foregroundStyle(.black)
                            Spacer()
                            
                            Image(systemName: "chevron.down")
                                .font(.title2)
                                .foregroundStyle(.gray)
                                .rotationEffect(.init(degrees: -90))
                            //
                        }
                        .padding(10)
                        .frame(width: 7/8 * deviceWidth)
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .shadow(radius: 1)
                        }
                        Spacer()
                            .frame(height: 10)
                        
                        
                        HStack{
                            Image(systemName: "gearshape")
                                .font(.title2)
                                .foregroundStyle(Color(.gray))
                                .padding(10)
                                .background{
                                    Color(UIColor.systemGray5).opacity(0.8)
                                        .clipped()
                                        .clipShape(.circle)
                                }
                            Text("Account Settings")
                                .foregroundStyle(.black)
                            Spacer()
                            
                            Image(systemName: "chevron.down")
                                .font(.title2)
                                .foregroundStyle(.gray)
                                .rotationEffect(.init(degrees: -90))
                            //
                        }
                        .padding(10)
                        .frame(width: 7/8 * deviceWidth)
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .shadow(radius: 1)
                        }
                        
                        Spacer()
                            .frame(height: 80)
                        
                        
                        
                        
                    }
                    
                }
                .scrollIndicators(.hidden)
                .frame(width: deviceWidth, height: deviceHeight - 20)
                
                .background{
                    Color(UIColor.systemGray6).opacity(0.5)
                    // .ignoresSafeArea(.all, edges: .bottom)
                    
                }
            }
        }
    }
}

#Preview {
    
    return EditProfileView(athlete: Athlete.defaultAthlete())
        .environmentObject(FeedVM())
}
