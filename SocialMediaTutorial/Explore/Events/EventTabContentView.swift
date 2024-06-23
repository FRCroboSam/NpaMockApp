//
//  EventTabContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/28/24.
//

import SwiftUI

struct EventTabContentView: View {
    @State private var urls = [
        "https://www.footballcamps.com/media/fbcamps360webcmscom/photos/1458/1458_3.jpg",
        "https://www.ussportscamps.com/media/images/soccer/nike/camps/soxdal_gallerypic3_950x516.jpg",
        "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg",
        "https://images.squarespace-cdn.com/content/v1/566962bb57eb8d68a43e4b29/1672780898446-UXBQHX4A7N1PO73OJ3YO/Nike-Football-Chelsea-Camp-Boy+%281%29.jpg"
    
    ]
    @State private var campNames = [
        "Husky Football Camp 2024",
        "Little Kickers Soccer Camp 2024",
        "Little Sharks Camp 2024",
        "Lynwood Soccer Training 2024"
    ]
    
    let tabs = [
        "Camps",
        "Games",
        "Showcases",
    ]
    @State var selected = "Camps"
    var body: some View {
        CustomNavBar(title: "Events")

        VStack{
            
            ScrollView(.vertical , showsIndicators: false){
                Spacer()
                    .frame(height: 15)
                CategoryTabView(selection: $selected, categories: tabs)
                Divider()
                    .padding(.top, 5)
                Spacer()
                    .frame(height: 20)
                if(selected == "Camps"){
                    HStack{
                        Text("Camps For You")
                            .bold()
                            .font(.title2)
                            .padding(.leading, 15)
                        Spacer()
                        HStack{
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
                        }
                        .padding(.trailing, 20)
                    }
                    Spacer()
                        .frame(height: 15)
                    
                    VStack {
                        ForEach(urls.indices, id: \.self) { index in
                            EventCardVertical(width: 7/8 * deviceWidth, event_url: urls[index], event_name: campNames[index])
                            //.padding(10)
                            Spacer()
                                .frame(height: 20)
                            
                        }
                    }
                    .offset(x: -5)
                }
                else if(selected == "Showcases"){
                    ShowcasesContentView()
                }
            }
            
        }
    }
}

#Preview {
    EventTabContentView()
}
