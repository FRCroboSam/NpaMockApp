//
//  DiscoverView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/21/24.
//

import SwiftUI

struct DiscoverView: View {
    @EnvironmentObject var athleteVM: AthleteVM
    @State private var searchTeacher = ""
    @State private var selected_athlete: Athlete?
    @State private var goToAthleteProfile = false
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 5)
                Text("Athletes")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color(hex: "0A66C2"))
                    .padding(.leading, 20)
                ZStack{
                    VStack(spacing: 0){
                        HStack{
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                                TextField("Discover, sponsor your favorite athletes!", text: $searchTeacher)
                                    .foregroundColor(.black)
                                    .textContentType(.newPassword)
                                    .keyboardType(.asciiCapable)
                                    .autocorrectionDisabled()
                                    .listRowSeparator(.hidden)
                            }.modifier(customViewModifier(roundedCornes: 30, startColor: Color(UIColor.systemGray5), endColor: Color(UIColor.systemGray5), textColor: .black, ratio: 0.925))
//                                .padding(.top, 10)
//                                .offset(y: 20)
                        }
                        //                    Spacer()
                        //                        .frame(height: 30)
                        HStack(){
//                            Text("Sponsor and interact with your favorite athletes!")
//                                .bold()
//                                .font(.subheadline)
                            Spacer()
                            Button {
                                withAnimation(.easeIn){
                                    athleteVM.showingFilters = !athleteVM.showingFilters
                                    print(athleteVM.showingFilters)
                                }
                            } label: {
                                HStack{
                                    Image(systemName: "line.3.horizontal.decrease")
                                    Text("Filter")
                                }
                            }.buttonStyle(BigButtonStyle(height: 40, color: Color(UIColor.systemGray2), padding: 30))
                                .padding(.trailing, 30)
                        }
                        Spacer()
                            .frame(height: 10)
                        Divider()
                        
                        ScrollView{
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
                            
                            
                            .onAppear{
                                goToAthleteProfile = false
                                print(String(
                                    athleteVM.athletes.count))
                            }
                        }
                        if(athleteVM.showingFilters){
                            FilterView()
                            
                        }
                    }
                    
                    
                    
                }
            }

        }

    }
}
struct BigButtonStyle: ButtonStyle {
    let height: CGFloat
    @State var cornerRadius: CGFloat =  12
//    @State var percentWidth = 0.75
    @State var color: Color = .orange
    
    let padding: CGFloat?
    @Environment(\.isEnabled) private var isEnabled: Bool
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .padding(padding ?? 20)
            //.frame(width: percentWidth * deviceWidth)
            .foregroundColor(isEnabled ? .white : Color(UIColor.systemGray3))
            .background(isEnabled ? color : Color(UIColor.systemGray5))
            .frame(height: height)
            .cornerRadius(cornerRadius)
            .overlay {
                if configuration.isPressed {
                    Color(white: 1.0, opacity: 0.2)
                        .cornerRadius(12)
                }
            }
    }
}
//#Preview {
//    let sports = ["Swimming", "Tennis", "Baseball", "Football", "Lacrosse", "Badminton", "Soccer", "Rugby",
//                  "Basketball", "Pickleball", "Cross Country", "Track and Field"]
//    DiscoverView()
//}
