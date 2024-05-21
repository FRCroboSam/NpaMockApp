//
//  AthleteDiscoverView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/20/24.
//

import SwiftUI

struct AthleteDiscoverView: View {
    @EnvironmentObject var athleteVM: AthleteVM
    @Binding var showTeams: Bool
    var body: some View {
        ScrollView{
            Spacer()
                .frame(height: 20)
            HStack(spacing: 0){
                
                Text("Athletes")
                    .bold()
                    .font(.title)
                    .padding(.leading, 20)
                Spacer()
                Button{
                    showTeams = true
                }label: {
                    Text("Explore Teams")
                        .foregroundStyle(.blue)
                        .padding(10)
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(Color.blue)
                            
                        }
                        .padding(.trailing, 15)
                }
                
            }
            Spacer()
                .frame(height: 10)
            FeaturedAthletes()
            Spacer()
                .frame(height: 20)
            Divider()
            VStack(spacing: 0){
                ForEach(athleteVM.athletes){ athlete in
                    
                    NavigationLink{
                        AthleteProfileView(athlete: athlete)
                    }label: {
                        AthleteBannerView(athlete: athlete)
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        Divider()
                        
                        
                    }
                }
                Spacer()
                    .frame(height: 50)
            }
            

        }
    }
}

//#Preview {
//    AthleteDiscoverView(showTeams: Binding(projectedValue: false))
//        .environmentObject(AthleteVM())
//}
