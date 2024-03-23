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
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    HStack{
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                            TextField("Discover, engage, and sponsor your favorite athletes!", text: $searchTeacher)
                                .foregroundColor(.black)
                                .textContentType(.newPassword)
                                .keyboardType(.asciiCapable)
                                .autocorrectionDisabled()
                                .listRowSeparator(.hidden)
                        }.modifier(customViewModifier(roundedCornes: 30, startColor: Color(UIColor.systemGray5), endColor: Color(UIColor.systemGray5), textColor: .black, ratio: 0.925))
                            .padding(.top, 10)
                            .offset(y: 20)
                            .navigationBarItems(trailing: Image(systemName: "bell.badge.fill"))
                    }
                    Button {
                        withAnimation(.easeIn){
                            athleteVM.showingFilters = !athleteVM.showingFilters
                            print(athleteVM.showingFilters)
                        }
                    } label: {
                        HStack{
                            Image(systemName: "line.3.horizontal.decrease")
                            Text("Apply Filters ")
                        }
                    }.buttonStyle(BigButtonStyle(height: 10))
                    Spacer()
                        .frame(height: 30)
                    ScrollView{
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
            }
            
            if(athleteVM.showingFilters){
                VStack{
                    Spacer()
                        .frame(height: 200)
                    FilterView()
                }

            }

        }
    }
}
struct BigButtonStyle: ButtonStyle {
    let height: CGFloat
//    @State var percentWidth = 0.75
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
            .padding()
            //.frame(width: percentWidth * deviceWidth)
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
