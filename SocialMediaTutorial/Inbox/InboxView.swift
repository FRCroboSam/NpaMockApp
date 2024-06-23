//
//  AthleteScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/11/24.
//

import SwiftUI

struct InboxView: View {
    @State var selection = "All"

    @EnvironmentObject var athleteVM: AthleteVM
    @State var query: String = ""
    @State var athletes: [Athlete]
    
    @State var coachNames = [
        "Kevin Marshall",
        "Brian Carrington",
        "Derek Sullivan",
        "Michael Thompson",
        "James Hayes",
        "Alexander Rodriguez"
    ]

    @State var coachMessages = [
        "Do you want to hop on a call?",
        "I like your skills video.",
        "Where do you go to school?",
        "What is your ht/wt?",
        "Seen 10 min ago",
        "Great form!"
    ]
    @State var messages = [
        "Nice clip man!", "Where do you go to school?", "How long have you been training?", "Have we met before?", "Great game last night!", "What position do you play?", "How's your training going?", "Are you playing in the next match?", "Who's your favorite athlete?", "What team do you support?"
    ]
    var body: some View {
        VStack{
            if(athleteVM.isNotifications){
                NotificationsView()
            }
            else{
                ScrollView{
                    Spacer()
                        .frame(height: 10)
                    HStack{
                        Spacer()
                            .frame(width: 10)
                        Button{
                            athleteVM.feedOrCommentSection = 2
                            withAnimation(.easeIn.speed(0.5)){
                                print("ANIMATING DONE")
                                athleteVM.feedOrCommentSection = 1
                            }
                        }label:{
                            Image(systemName: "chevron.down")
                                .font(.title2)
                                .foregroundStyle(.gray)
                                .rotationEffect(.init(degrees: -270))
                        }
                        
                        Text("Inbox")
                            .font(.title)
                            .bold()
                            .padding(.leading, 10)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        VStack{
                            
                            Text("All")
                                .foregroundStyle(selection == "All" ? Color.blue.opacity(0.8) : Color.gray.opacity(0.5))
                                .font(.title3)
                            
                                .onTapGesture {
                                    withAnimation(.easeIn){
                                        selection = "All"
                                    }
                                }
                                .padding(2)
                            Rectangle()
                                .fill(selection == "All" ? Color.blue : Color.clear)

                                .frame(width: 50, height: 3)
                        }
                        .padding(10)
                        .background{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(selection == "All" ?  Color.blue.opacity(0.1) : Color.clear)
                        }
                        Spacer()
                        VStack{
                            Text("Coaches/Recruiters")
                                .foregroundStyle(selection != "All" ? Color.blue.opacity(0.8) : Color.gray.opacity(0.5))
                                .font(.title3)
                                .onTapGesture {
                                    withAnimation(.easeIn){
                                        selection = "Coaching"
                                    }
                                }
                                .padding(2)
                                
                            Rectangle()
                                .fill(selection == "Coaching" ? Color.blue : Color.clear)
                                .frame(width: 50, height: 3)
                        }
                        .padding(10)
                        .background{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(selection == "Coaching" ?  Color.blue.opacity(0.1) : Color.clear)
                        }
                        Spacer()
                    }
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
                    if(selection == "All"){
                        VStack(spacing: 0){
                            ForEach(athletes.indices, id: \.self){ index in
                                let athlete = athletes[index]
                                let name = athlete.first_name + " " + athlete.last_name
                                
                                NavigationLink{
                                    AthleteProfileView(athlete: athlete)
                                    
                                }label: {
                                    ChatListItemView(profile_img: athlete.profile_img, name: name, message_text:
                                        messages[index])
                           
                                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                                    
                                    
                                    
                                }
                            }
                            Spacer()
                                .frame(height: 50)
                        }
                        Spacer()
                    }
                    else{
                        VStack(spacing: 0){
                            ForEach(coachNames.indices, id: \.self){ index in
                                let coach_img = "coach_" + String(index + 1)
                                NavigationLink{
                                    Image(coach_img)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 100)
                                    
                                        .clipped()
                                    //                        .clipShape(Circle())
                                        .clipShape(.rect(cornerRadius: 20))
                                    
                                }label: {
                                    ChatListItemView(profile_img: coach_img, name: coachNames[index], message_text:
                                                        coachMessages[index])
                                    
                                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                                    
                                }
                                
                            }
                        }
                    }
                    
                }
                .toolbar(.hidden, for: .navigationBar)
                
            }
        }
    }
}

//#Preview {
//    AthleteScrollView()
//}
