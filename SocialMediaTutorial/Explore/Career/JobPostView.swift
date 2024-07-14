//
//  JobPostView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 7/8/24.
//

import Foundation
import SwiftUI
import NukeUI 



struct Job_Posting {
    var job_title: String
    var company_logo_url: String
    var company_name: String
    var pay_range: String
    var job_type: String
    var location: String
    var posted_date: String
}

struct JobPostView: View{
    let job_posting: Job_Posting
    var body: some View{
        VStack{
            HStack(alignment: .top){
                LazyImage(url: URL(string: job_posting.company_logo_url)) { phase in
                    if let image = phase.image {
                        image // Displays the loaded image.
                            .resizable()
                            .scaledToFill()
                            .frame(width: 35, height: 35)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .background{
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.white)
                                    .shadow(radius: 1)
                            }
                                
                        
                        
                        
                    } else {
                        LoadingView(width: 35, height: 35)
                        
                    }
                }
                
                
                VStack(alignment: .leading){
                    Text(job_posting.job_title)
                        .bold()
                        .font(.title3)
                    Text(job_posting.company_name)
                        .foregroundStyle(.black.opacity(0.4))
                        .font(.subheadline)
                        .italic()
                    HStack{
                        Text(job_posting.pay_range)
                        Text("·")
                        Text(job_posting.job_type)
                    }
                    .foregroundStyle(.black.opacity(0.4))
                    .font(.subheadline)

                    HStack{
                        Text(job_posting.location)
                        Text("·")
                        Text(job_posting.posted_date)
                    }
                    .foregroundStyle(.gray.opacity(0.8))
                    .font(.caption)
                    Spacer()
                        .frame(height: 5)
                    HStack(spacing: 10){
                        Text("New")
                            .font(.subheadline)
                            .foregroundStyle(.green)
                            .padding(3)
                            .padding(.horizontal, 8)
                            .bold()
                            .background{
                                Color.green
                                    .roundedCorner(5, corners: .allCorners)
                                    .opacity(0.3)
                            }
                        Text("In Person")
                            .font(.subheadline)
                            .foregroundStyle(.orange)
                            .padding(3)
                            .padding(.horizontal, 8)
                            .bold()                            
                            .background{
                                Color.orange
                                    .roundedCorner(5, corners: .allCorners)
                                    .opacity(0.3)
                            }
                        Spacer()
                    }
                    
                }
                Spacer()
            }
        }
        .frame(width: 11/12 * deviceWidth)
//        .background{
//            Color.white
//                .roundedCorner(15, corners: .allCorners)
//                .shadow(radius: 1)
//
//        }
    }
}
