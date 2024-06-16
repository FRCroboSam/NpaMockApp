//
//  NetworkContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/31/24.
//

import SwiftUI

struct RecruitmentContentView: View {
    @State var coachNames = [
        "Kevin Marshall",
        "Brian Carrington",
        "Derek Sullivan",
        "Michael Thompson",
        "James Hayes",
        "Alexander Rodriguez"
    ]    
    @State var agentImages = [
        "https://qph.cf2.quoracdn.net/main-qimg-bc3f56b6a5a688c48c878451b2d43ffa-lq",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaKeS_9uk0mXcMe34FwwbF6rUXxbZs3j8enqw3vyfVFb-OAFVcBA12fMMW1RiOJw-K4To&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFfQAqJ4Iq7gtHeGTr6NFjOC5f3kRX1Qtk2kkTx9wZd1DXND9SayWLlI80fKHditqPaR8&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKih0pP2wukmi7p-JBCzqQ3GUYC2Pj7nyM_K6ukeZIsvqlCGnxFe_jn9CduBjlUg7n1hg&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVMWox7iiKY0mTWkSJGiIr-nRT8QigPJl1La69MWffy0xyfNdDFhD3x2Fouh1LpuxdjSY&usqp=CAU",
        "https://aisiiczsuo.cloudimg.io/v7/https://www.sportsmanagementworldwide.com/sites/default/files/Alex%20Timinski.jpg"
        
    ]
    
    
     @State var coachImages = ["coach_1",
                               "coach_2",
                               "coach_3",
                               "coach_4",
                               "coach_5",
                               "coach_6"
                            ]
    @State var coachLocations  = [
        "Los Angeles, CA", "San Francisco, CA", "San Diego, CA", "Sacramento, CA", "San Jose, CA", "Fresno, CA",
    ]
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
                VStack{
                    Text("Recruiting To the Pro's With ")
                        .bold()
                        .font(.title)
                        .lineLimit(2)
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
            VStack(alignment: .leading){
                HStack{
                    Text("Agents Near You")
                        .font(.title)
                        .bold()
                        .padding(.leading, 15)
                    Spacer()
                    HStack{
                        Image(systemName: "paperplane.fill")
                            .foregroundStyle(.gray.opacity(0.7))
                        Text("1.5 mi")
                            .foregroundStyle(.gray.opacity(0.8))
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.gray.opacity(0.7))
                    }
                    .padding(8)
                    .background{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.gray.opacity(0.2))
                    }
                    .padding(.trailing, 15)
                }
                Text("Agents can handle the logistics of recruiting, contacting coaches, and more.")
                    .padding(.trailing, 15)
                    .padding(.leading, 20)
                    .foregroundStyle(.gray.opacity(0.9))
                BioScrollView(names: coachNames, images: coachImages, locations: coachLocations, imageURLS: agentImages)
            }
            
            
            


        }
        
    }
}

#Preview {
    NetworkContentView()
        .environmentObject(AthleteVM())
        .environmentObject(PodcastVM())

}
