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
    @State var fill: CGFloat = 0
    
    @State var current = "Posts"
    @Namespace var animation
    var body: some View {
        VStack(spacing: 5){
            Spacer()
                .frame(height: 20)
            VStack{
                Text(athlete.first_name + " "  + athlete.last_name)
                    .bold()
                    .font(.title)
                Image(athlete.profile_img)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                    .clipShape(.circle)
            }
            HStack{
                Text("HELLO") //⋅
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
            }
            Button{
            }label: {
                Text("Button")
            }
            ZStack{
                Circle()
                    .stroke(Color.gray.opacity(0.3),
                            style: StrokeStyle(lineWidth: 10)
                    )
                    .frame(width: 100, height: 100)
                Circle()
                    .trim(from: 0, to: self.fill)
                    .stroke(Color(hex: "0A66C2"),
                            style: StrokeStyle(lineWidth: 10)
                    )
                    .rotationEffect(.init(degrees: -90))
                    .frame(width: 100, height: 100)
                Text("50%")
                    .font(.title)
            }
            .onAppear{
                withAnimation{
                    self.fill = 0.5
                }
            }
            Spacer()


        }
    }
}

#Preview {
    
    return EditProfileView(athlete: Athlete.defaultAthlete())
        .environmentObject(FeedVM())
}
