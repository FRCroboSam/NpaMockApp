//
//  NetworkContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/31/24.
//

import SwiftUI

struct NetworkContentView: View {
    var body: some View {
        VStack(spacing: 15)
        {
            let filters = [
                "Leagues",
                "Location",
                "Ages"
            ]
            let text = [
                "Top Coaches in Your Area",
                "How a Good Agent Represents You",
                "Standing out to Recruiters",
                ""
            ]
            let images = [
                "https://image.maxpreps.io/editorial/article/0/6/2/0625759a-2a7a-482d-9048-1f0ecff76065/8d436565-9b24-42a5-a704-aed2cadac774_original.jpg",
                "https://ca-times.brightspotcdn.com/dims4/default/89b9625/2147483647/strip/true/crop/1242x828+0+78/resize/2000x1333!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F04%2F4d%2Fe5d584e2443b9c755d77c1cba39e%2Fmulugheta-photo-3.jpg",
                "https://res.cloudinary.com/dzcx399ln/image/upload/f_auto,c_fill,w_1600,h_534/ncsa/wp-content/uploads/2022/07/when-can-college-coaches-contact-high-school-athletes.jpg",
                ""
            ]
            HighlightScrollView(imageURLS: images, text: text)
            
            HStack{
                Text("Instructors Near You")
                    .font(.title)
                    .bold()
                    .padding(.leading, 20)
                Spacer()

                
            }
            EventFilterScrollView(filters: [
                "Sports", "Leagues", "Gender"
            ])
            .offset(x: 5)
            FeaturedAthletes()
            
            
            HStack{
                Text("Agents")
                    .font(.title)
                    .bold()
                    .padding(.leading, 20)
                Spacer()
                
            }
            EventFilterScrollView(filters: [
                "Sports", "Leagues", "Gender"
            ])

            //.offset(x: 15)
            FeaturedAthletes()

            HStack{
            Text("Featured Athletes")
                .font(.title)
                .bold()
                .padding(.leading, 20)
                Spacer()
            
            }
            EventFilterScrollView(filters: [
                "Sports", "Leagues", "Gender"
            ])
            //.offset(x: 15)
            FeaturedAthletes()
        }
        
    }
}

#Preview {
    NetworkContentView()
        .environmentObject(AthleteVM())
        .environmentObject(PodcastVM())

}
