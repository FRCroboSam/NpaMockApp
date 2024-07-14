//
//  DiscoverView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/21/24.
//

import SwiftUI

struct CareerContentView: View {
    @EnvironmentObject var athleteVM: AthleteVM
    @State private var searchText = ""
    @State private var selected_athlete: Athlete?
    @State private var goToAthleteProfile = false
    @State private var filterViewOffset = 0.0
    @State private var startSlidingDown = false
    @State private var showTeams = false
    let jobPostings = [
        Job_Posting(job_title: "Graphics Design Intern",
                    company_logo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRc1Ie41bKx7HhHNHegc9t9afos4ZPSa5qxg&s",
                    company_name: "ESPN",
                    pay_range: "$30.00 - $35.00 /hr",
                    job_type: "Internship",
                    location: "Seattle, WA", posted_date: "5 days ago"
               ),
        Job_Posting(job_title: "Graphics Design Intern",
                    company_logo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSURXxn_XzzxNMM3U6Pq6DAOZrXbOTwE144Q&s",
                    company_name: "ABC",
                    pay_range: "$30.00 - $35.00 /hr",
                    job_type: "Internship",
                    location: "Seattle, WA", posted_date: "5 days ago"
               ),
        Job_Posting(job_title: "Broadcast Network Intern",
                    company_logo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPkYgnIyhyLJ2Me2WrOS4RShKVTHN3-j755A&s",
                    company_name: "BBC",
                    pay_range: "$25.00 - $35.00 /hr",
                    job_type: "Internship",
                    location: "Los Angeles, CA", posted_date: "2 days ago"
               ),
        Job_Posting(job_title: "Broadcast Network Intern",
                    company_logo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLUKC4N08mSt9gTRyIok64sctLVYBiZoi7MA&s",
                    company_name: "Next Professional Athlete",
                    pay_range: "$25.00 - $35.00 /hr",
                    job_type: "Internship",
                    location: "Los Angeles, CA", posted_date: "2 days ago"
               )
    ]
    var body: some View{
        NavigationStack{
            CustomNavBar(title: "Careers", backButtonHidden: true)
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
                                    Image(systemName: "suitcase")
                                        .foregroundColor(.black.opacity(0.6))
                                    
                                    
                                    TextField("Search for jobs", text: $searchText)
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
                        Spacer()
                            .frame(height: 10)
                        Divider()
                        Spacer()
                            .frame(height: 15)
                        HStack{
                            Text("48 results")
                                .foregroundStyle(.gray)
                                .padding(.leading, 15)
                            Spacer()
                            Text("Most Relevant")
                                .foregroundStyle(Color(hex: "#2E8BC0"))
                            Image(systemName: "chevron.down")
                                .font(.subheadline)
                                .foregroundStyle(Color(hex: "#2E8BC0"))
                            Spacer()
                                .frame(width: 15)
                        }
                        Spacer()
                            .frame(height: 15)
                        Divider()


                    }
                ScrollView{
                    VStack{
                        ForEach(jobPostings.indices, id: \.self) { index in
                            JobPostView(job_posting: jobPostings[index])
                                .padding(.leading, 10)
                            Spacer()
                                .frame(height: 10)
                            Divider()
                            
                        }
                    }
                }
                .scrollIndicators(.hidden)
                    
                    Spacer()
                
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


#Preview {
    CareerContentView()
        .environmentObject(AthleteVM())
}
