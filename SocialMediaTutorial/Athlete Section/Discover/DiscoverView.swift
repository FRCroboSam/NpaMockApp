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
    @State private var showingFilters: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    HStack{
                        Text("Discover, recruit, and sponsor your favorite athletes!")
                            .padding(.leading, 20)
                        Spacer()
                    }
                    .padding(.bottom, -10)
                    .navigationBarItems(trailing: Image(systemName: "bell.badge.fill")) // Add leading and trailing navigation bar items
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                        TextField("Search for an athlete", text: $searchTeacher)
                            .foregroundColor(.black)
                            .textContentType(.newPassword)
                            .keyboardType(.asciiCapable)
                            .autocorrectionDisabled()
                            .listRowSeparator(.hidden)
                    }.modifier(customViewModifier(roundedCornes: 30, startColor: Color(UIColor.systemGray5), endColor: Color(UIColor.systemGray5), textColor: .black, ratio: 0.925))
                        .padding(.top, 10)
                        .offset(y: 20)
                        .navigationTitle("NPA") // Set the navigation title
                        .navigationBarItems(trailing: Image(systemName: "bell.badge.fill"))
                    Spacer()
                        .frame(height: 30)
                    ScrollView{
                        Button {
                            withAnimation(.easeIn){
                                showingFilters = true
                            }
                        } label: {
                            HStack{
                                Image(systemName: "line.3.horizontal.decrease")
                                Text("Apply Filters ")
                            }
                        }.buttonStyle(BigButtonStyle(height: 50))
                        Divider()
                        ForEach(athleteVM.athletes){ athlete in
                            AthleteListView(athlete: athlete)
                                .onTapGesture{
                                    print("HELLO")
                                }
                            Divider()
                        }
                    }
                    
                    .onAppear{
                        print(String(
                            athleteVM.athletes.count))
                    }
                }
                if(showingFilters){
                   FilterView()
                        .zIndex(5)
                }
            }

        }
    }
}
struct BigButtonStyle: ButtonStyle {
    let height: CGFloat
    @State var percentWidth = 0.75
    @State var color: Color = .blue
    @Environment(\.isEnabled) private var isEnabled: Bool
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .font(.title.bold())
            .padding()
            .frame(width: percentWidth * deviceWidth, height: height)
            .foregroundColor(isEnabled ? .white : Color(UIColor.systemGray3))
            .background(isEnabled ? color : Color(UIColor.systemGray5))
            .cornerRadius(12)
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
