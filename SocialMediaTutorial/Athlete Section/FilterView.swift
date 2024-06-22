//
//  FilterView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/22/24.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject var vm: AthleteVM
    @State private var selectedSport: String = ""
    let sports = ["Swimming", "Tennis", "Baseball", "Football", "Lacrosse", "Badminton", "Soccer", "Rugby",
                  "Basketball", "Pickleball", "Cross Country", "Track and Field"]
    var deviceWidth: CGFloat{
        UIScreen.main.bounds.width
    }
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    @State private var selectingSport: Bool = false
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading ){
            HStack{
                Text("SORT BY")
                    .font(.system(size: 15))
                    .bold()
                Spacer()
            }
            Divider()
            HStack{
                Image(systemName: "flame")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .bold()
                Text("Trending")
                    .font(.title3)
                    .bold()

            
            }
            Spacer()
                .frame(height: 10)
            HStack{
                Image(systemName: "seal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.gray.opacity(0.6))
                    .frame(width: 35, height: 35)
                Text("Top")
                    .font(.title3)
                    .foregroundStyle(.gray.opacity(0.6))

            }
            Spacer()
                .frame(height: 10)
            HStack{
                Image(systemName: "basketball")
                    .resizable()
                    .foregroundStyle(.gray.opacity(0.6))
                    .frame(width: 35, height: 35)
                Text("Points Per Game")
                    .font(.title3)
                    .foregroundStyle(.gray.opacity(0.6))


            }
            Spacer()
                .frame(height: 10)
            HStack{
                Image(systemName: "trophy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundStyle(.gray.opacity(0.6))
                Text("Wins")
                    .font(.title3)
                    .foregroundStyle(.gray.opacity(0.6))

            }
            Spacer()
                .frame(height: 10)

                
            Spacer()
                .frame(height: 10)
            HStack{
                Spacer()
                Button{
                    
                }label:{
                    Text("Close")
                        .foregroundStyle(.gray)
                        .font(.system(size: 16))
                        .background{
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 5/6 * deviceWidth, height: 30)
                        }
                        .padding(.bottom, 5)
                    
                }
                Spacer()
            }
            

//                VStack(alignment: .leading){
//                    HStack{
//                        Text("Choose a year: ")
//                        Spacer()
//                        Image(systemName: "chevron.down")
//                            .font(.subheadline)
//                            .foregroundStyle(.gray)
//                            .rotationEffect(.degrees(isExpanded ? -180 : 0))
//                    }
//                    .onTapGesture {
//                        isExpanded = !isExpanded
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading) // Align text within its frame to the leading edge
//                    
//                }
//                .background(Color(UIColor.lightGray))
//                .cornerRadius(15)
//                Spacer()
            Spacer()
                .frame(height: 85)
                
            }
        .padding(15)
        .frame(width: deviceWidth)
        //.frame(width: 7/8 * deviceWidth, height: 300)///3/4 * deviceWidth, height: 300)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(UIColor.white))
                .shadow(radius: 1)// Fill the RoundedRectangle with gray color
        )
        //.padding(.leading, 10)
    }
}

#Preview {
    FilterView()
}
