//
//  FeedTypeScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/26/24.
//

import Foundation
import SwiftUI

struct FeedTypeScrollView: View{
    @State var selectedFeed = "All"
    @EnvironmentObject var vm: FeedVM
    let feedCategories = [
        "All",
        "Tennis",
        "Basketball",
        "Baseball",
        "Soccer",
        "Swimming",
        "Football"
    ]
    let image_names = [
        "",
        "tennisball.fill",
        "basketball.fill",
        "baseball",
        "soccerball.inverse",
        "figure.pool.swim",
        "football",
    ]
    let image_colors = [
        Color.gray,
        Color.yellow,
        Color.orange,
        Color.clear,
        Color.clear,
        Color.blue,
        Color.brown
        
    ]
    var body: some View{
        
        HStack{
            ForEach(feedCategories.indices, id: \.self){index in
                HStack{
                    Text(feedCategories[index])
                        .foregroundStyle(selectedFeed == feedCategories[index] ? .white.opacity(1.0) :  Color.black.opacity(0.6))
                    if(!image_names[index].isEmpty){
                        Image(systemName: image_names[index])
                            .foregroundColor(image_colors[index] != .clear ? image_colors[index] : .primary)
                    }
                }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background{
                        if(selectedFeed == feedCategories[index]){
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hex: "0A66C2").opacity(1.0))
                            
                        }
                        else{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.6))
                            
                        }
                        
                        //.strokeBorder(Color(UIColor.systemGray4))
                        //.shadow(color: Color(UIColor.gray).opacity(0.6),radius: 1.6)*/
                        //.mask(RoundedRectangle(cornerRadius: 15).padding(.bottom, -10))
                        //.padding(.horizontal, -10)
                        //.shadow(color: Color(UIColor.gray).opacity(0.8), radius: 1.7)
                        
                    }
                    .onTapGesture{
                        if(index == 0){
                            withAnimation(.easeIn){
                                selectedFeed = "All"
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                                vm.switchToDefault()
                            }
                        }
                        else{
                            withAnimation(.easeIn){
                                selectedFeed = feedCategories[index]
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                                vm.switchFeeds()
                            }
                        }
                    }
            }
            
        }
        
    }
}
