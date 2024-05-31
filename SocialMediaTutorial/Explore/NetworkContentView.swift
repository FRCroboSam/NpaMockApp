//
//  NetworkContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/31/24.
//

import SwiftUI

struct NetworkContentView: View {
    var body: some View {
        VStack(spacing: 15)
        {     
            EventFilterScrollView()
            HStack{
            Text("Featured Athletes")
                .font(.title2)
                .bold()
                .padding(.leading, 20)
            
            }
            //.offset(x: 15)
            FeaturedAthletes()
            
            HStack{
                Text("Coaches")
                    .font(.title2)
                    .bold()
                    .padding(.leading, 20)
                
            }
            //.offset(x: 15)
            FeaturedAthletes()
            
            HStack{
                Text("Agents")
                    .font(.title2)
                    .bold()
                    .padding(.leading, 20)
                
            }
            //.offset(x: 15)
            FeaturedAthletes()
        }
        
    }
}

#Preview {
    NetworkContentView()
}
