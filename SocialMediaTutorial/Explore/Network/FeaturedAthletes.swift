//
//  StoryListView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

struct FeaturedAthletes: View {
    @EnvironmentObject var postData: FeedVM // Observed object for reading JSON data
    @EnvironmentObject var athleteData: AthleteVM // Observed object for reading JSON data

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) { // Horizontal scroll view for displaying story cards
            HStack(spacing: 0) {
                Spacer().frame(width: 5)
                ForEach(Array(athleteData.athletes.enumerated()), id: \.1.id) { index, athlete in
                    Spacer().frame(width: 0)
                    AthleteCardView(athlete: athlete, fireValue: 1)
                                                .padding(5)
                                                .padding(.vertical, 10)
                    
//                    if(index < 3){
//                        AthleteCardView(athlete: athlete, fireValue: index + 1)
//                            .padding(10)
//                            .padding(.top, 10)
//                    }
//                    else{
//                        AthleteCardView(athlete: athlete)
//                            .padding(10)
//                            .padding(.top, 10)
//                    }


                }
                //.frame(height: 250)


            }
        }
        
        //.offset(x: 15) // Offset the scroll view horizontally by 15 points
    }
}

#Preview {
    FeaturedAthletes()
        .environmentObject(PodcastVM())
        .environmentObject(AthleteVM())
        .environmentObject(FeedVM())
}
