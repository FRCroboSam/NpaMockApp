//
//  TeamScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/20/24.
//

import SwiftUI

struct TeamScrollView: View {
    @EnvironmentObject var athleteVM: AthleteVM
    
    var logoURLs =  ["https://3.files.edl.io/62dc/22/08/30/191529-d8a627a6-419e-4f96-bf67-0fe6eebb6bb3.jpg", "https://irp.cdn-website.com/06601532/files/uploaded/CM%20Lions%20Logo.png", "https://3.files.edl.io/62dc/22/08/30/191529-d8a627a6-419e-4f96-bf67-0fe6eebb6bb3.jpg", "https://3.files.edl.io/62dc/22/08/30/191529-d8a627a6-419e-4f96-bf67-0fe6eebb6bb3.jpg", "https://3.files.edl.io/62dc/22/08/30/191529-d8a627a6-419e-4f96-bf67-0fe6eebb6bb3.jpg", "https://3.files.edl.io/62dc/22/08/30/191529-d8a627a6-419e-4f96-bf67-0fe6eebb6bb3.jpg", "https://3.files.edl.io/62dc/22/08/30/191529-d8a627a6-419e-4f96-bf67-0fe6eebb6bb3.jpg", "https://3.files.edl.io/62dc/22/08/30/191529-d8a627a6-419e-4f96-bf67-0fe6eebb6bb3.jpg"]
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                Text("Team")
                    .font(.title2)
                    .bold()
                    .padding(.leading, 10)
                Spacer()
                    //.frame(width: 1/3 * deviceWidth)
                Text("Record")
                    .font(.title2)

                Spacer()
                    .frame(width: 40)
            }
            Spacer()
                .frame(height: 5)
            
            Divider()
                .overlay(Color.blue)
                .frame(width: 7/8 * deviceWidth, height: 5)
                .padding(.leading, 10)
            
            Spacer()
                .frame(height: 10)
            ForEach(logoURLs.indices){ index in
                
                TeamHeadline(teamLogo: logoURLs[index])
                Spacer()
                    .frame(height: 10)
            }
            Spacer()
                .frame(height: 50)
        }
    }
}

#Preview {
    TeamScrollView()
        .environmentObject(AthleteVM())
}
