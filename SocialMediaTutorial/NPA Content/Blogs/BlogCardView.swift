//
//  PodcastView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/6/24.
//

import SwiftUI
import NukeUI
struct BlogCardView: View {
    let blog: Blog
    @State var height: CGFloat = 350
    @State var articleString: String = ""
    @State var articleText: String = "Happy Monday everyone, let's take another look at what went down this week sports-wise. Bills fans, you might want to look away."
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
                VStack(spacing: 0){
                    Spacer()
                        .frame(height: 5)
                    HStack{
//                        Image("star_logo")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 20, height: 20)
//                            .padding(.leading, 5)

                        Text("NPA+")
                            .foregroundStyle(Color.white)
                            .bold()
                            .padding(.leading, 10)
//                            .font(.title)
                        Spacer()
                    }
                    Divider()
                }.background{
                    Rectangle()
                        .roundedCorner(10, corners: .topLeft)
                        .roundedCorner(10, corners: .topRight)
                        .foregroundStyle(Color(hex: "0A66C2"))

                }
                Spacer()
                    .frame(height: 10)
                HStack(alignment: .top){
                    VStack(alignment: .leading){
                        Text(blog.title)
                            .padding(.leading, 10)
                        Spacer()
                            .frame(height: 10)
                        Text(articleText)
                            .padding(.leading, 10)
                            .font(.system(size: 12))
                            .lineLimit(3)
                            .foregroundStyle(Color(UIColor.systemGray2))
                            .frame(width: 1/2 * deviceWidth)

                    }
                    Spacer()
//                    AsyncImage(
//                        url: URL(string: blog.image),
//                        content: { image in
//                            image.resizable()
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 100, height: 100)
//
//                                 .roundedCorner(8, corners: .allCorners)
//
//                        },
//                        placeholder: {
//                           LoadingView(width: 100, height: 100)
//                        }
//                    )
                    LazyImage(url: URL(string: blog.image)){ phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .roundedCorner(8, corners: .allCorners)
                            
                        }
                        else{
                           LoadingView(width: 100, height: 100)

                        }
                        
                    }
                    
                    
                    
                    .padding(.trailing, 20)
                }
                Spacer()
                    .frame(height: 10)
                Divider()
                Spacer()
                    .frame(height: 7)
                HStack{
                    Text(String(blog.day) + " hrs ago · NPA")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .padding(.leading, 15)
                }
                Spacer()
                    .frame(height: 10)
                
            }

            
            .frame(width: 11/12 * deviceWidth)
            .background{
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .strokeBorder(Color(UIColor.systemGray4))
            }
            Spacer() //TODO: remove this
        }
}

#Preview {
    BlogCardView(blog: Blog.defaultBlog())
}
