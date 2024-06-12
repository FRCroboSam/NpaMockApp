//
//  NetworkContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/31/24.
//

import SwiftUI

struct RecruitmentContentView: View {
    var body: some View {
        ScrollView(.vertical)
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
            let videoURLS = [
                "https://www.youtube.com/watch?v=scoeJXP8dw0",
                "https://www.youtube.com/watch?v=hqXl8zr__tM",
                "https://www.youtube.com/watch?v=_fMmaD8ViL4",
                "https://www.youtube.com/watch?v=WCBP9272z68",
                "https://www.youtube.com/watch?v=8-f9eR9VJ9g"
            ]
            VStack{
                HStack{
                    Text("Recruiting With ")
                        .bold()
                        .font(.title)
                        .padding(.leading, 25)
                    Text("NPA+")
                        .foregroundStyle(Color(hex: "0A66C2"))
                        .bold()
                        .font(.title)
                        .padding(.leading, 0)
                }
                
            }
            .frame(width: deviceWidth)
            .background{
                LinearGradient(gradient:Gradient(colors:[
                    Color.white,
                    Color.white,
                    Color.blue.opacity(0.15),
                    Color.blue.opacity(0.25),
                ]),
                               startPoint:.top,endPoint:.bottom)
                .frame(width: deviceWidth, height: 220)
            }
            highlightview(url: "https://www.ncsasports.org/wp-content/uploads/2022/07/what-does-recruiting-mean.jpg", text: "Get Recruited Today",
                          height: 180
            )
            RecruitmentProcessView()
            
            
            


        }
        
    }
}

#Preview {
    NetworkContentView()
        .environmentObject(AthleteVM())
        .environmentObject(PodcastVM())

}
