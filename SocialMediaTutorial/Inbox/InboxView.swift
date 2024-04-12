//
//  AthleteScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/11/24.
//

import SwiftUI

struct InboxView: View {
    @State var query: String = ""
    @State var athletes: [Athlete]
    var body: some View {
        ScrollView{
            Spacer()
                .frame(height: 10)
            HStack{
                Text("Inbox")
                    .font(.title)
                    .bold()
                    .padding(.leading, 20)
                Spacer()
            }
            StoryListView()
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                TextField("Search messages ", text: $query)
                    .foregroundColor(.black)
                    .textContentType(.newPassword)
                    .keyboardType(.asciiCapable)
                    .autocorrectionDisabled()
                    .listRowSeparator(.hidden)
            }.modifier(customViewModifier(roundedCornes: 30, startColor: Color(UIColor.systemGray5), endColor: Color(UIColor.systemGray5), textColor: .black, ratio: 0.92))
                .padding(.leading, 10)
            VStack(spacing: 0){
                ForEach(athletes){ athlete in
                    
                    NavigationLink{
                        AthleteProfileView(athlete: athlete)
                    }label: {
                        ChatListItemView(athlete: athlete)
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        
                        
                    }
                }
                Spacer()
                    .frame(height: 50)
            }
            Spacer()
            
        }
    }
}

//#Preview {
//    AthleteScrollView()
//}
