//
//  DiscoverView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/21/24.
//

import SwiftUI

struct DiscoverView: View {
    @EnvironmentObject var athleteVM: AthleteVM
    @State private var searchText = ""
    @State private var selected_athlete: Athlete?
    @State private var goToAthleteProfile = false
    @State private var filterViewOffset = 0.0
    @State private var startSlidingDown = false
    @State private var showTeams = false
    var body: some View{
        NavigationStack{
            CustomNavBar(title: "Athletes", backButtonHidden: false)
            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 30)
//                Text("Athletes")
//                    .font(.title)
//                    .bold()
//                    .padding(.leading, 20)

                    VStack(spacing: 0){
                        HStack{
                            Spacer()
                                .frame(width: 10)
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.black.opacity(0.6))
                                    
                                    
                                    TextField("Discover, sponsor athletes", text: $searchText)
                                        .font(.headline)
                                        .foregroundStyle(.gray.opacity(0.6))
                                    
                                    Spacer()
                                    
                                }
                                Rectangle()
                                    
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 3/4 * deviceWidth, height: 2)
                            }
                            
                            .frame(width: 3/4 * deviceWidth)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 10)
                            .background{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color(UIColor.clear))
                            }
                            Button{
                                filterViewOffset = 500
                                if(athleteVM.showingFilters){
                                    athleteVM.startSlidingDown = true
                                    athleteVM.animatingFilters = true
                                }
                                else{
                                    athleteVM.showingFilters = true
                                    athleteVM.animatingFilters = true


                                }
                                
                            } label: {
                                HStack{
                                    Image(systemName: "slider.horizontal.3")
                                        //.resizable()
                                        .font(.system(size: 20))
                                        .foregroundStyle(.gray.opacity(0.8))
                                        .frame(width: 50, height: 50)

//                                        .background{
//                                            Color(UIColor.gray).opacity(0.6)
//                                                .clipShape(.circle)
//                                        }
//                                    Text("Filter")
                                }
                                .padding(.trailing, 10)
                            }
                        }
                        //                    Spacer()
                        //                        .frame(height: 30)
                        Spacer()
                            .frame(height: 10)
                        
                        AthleteFiltersScrollView()
                            .padding(.bottom, 5)
                            


                        ZStack{
                            if(!showTeams){
                                AthleteDiscoverView(searchText: $searchText, showTeams: $showTeams
                                )
                                    .onAppear{
                                        goToAthleteProfile = false
                                        print(String(
                                            athleteVM.athletes.count))
                                    }
                            }
                            else{
                                TeamsDiscoverView( showTeams: $showTeams)
                            }
                        }
                    }
                    
                    
                    
                
            }

            .zIndex(6)

        }

//        if(athleteVM.showingFilters){
//            
//            
//            FilterView()
//                .zIndex(40)
//
//                .offset(y: filterViewOffset)
//                .animation(.easeIn, value: filterViewOffset)
//                .onAppear{
//                    withAnimation(.easeIn.speed(3.5)){
//                        let y = print("SHOWING COMMENT SECTION")
//                        filterViewOffset = 200
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
//                        athleteVM.animatingFilters = false
//                    }
//                }
//                .onChange(of: startSlidingDown) { value in
//                    if(value == true){
//                        withAnimation(.easeIn.speed(3.5)){
//                            filterViewOffset = 500
//                        }
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
//                            athleteVM.animatingFilters = false
//                            startSlidingDown = false
//                            athleteVM.showingFilters = false
//                            
//                        }
//                    }
//                }
//            
//        }


    }
}
struct BigButtonStyle: ButtonStyle {
    let height: CGFloat
//    @State var width: CGFloat?
    @State var cornerRadius: CGFloat =  12
//    @State var percentWidth = 0.75
    @State var color: Color = .orange
    @State var textColor: Color = .white
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
            .foregroundColor(isEnabled ? textColor : Color(UIColor.systemGray3))
            .background(isEnabled   ? color: Color(UIColor.systemGray5))
            .frame(height: height)
            
            .cornerRadius(cornerRadius)
            .overlay{
                if configuration.isPressed{
                    Color(white: 1.0, opacity: 0.2)
                        .cornerRadius(12)
                }
            }
    }
}


#Preview {
    DiscoverView()
        .environmentObject(AthleteVM())
}
