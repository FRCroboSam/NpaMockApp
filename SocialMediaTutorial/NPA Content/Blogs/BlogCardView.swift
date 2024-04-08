//
//  PodcastView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/6/24.
//

import SwiftUI
struct BlogCardView: View {
    let blog: Blog
    @State var height: CGFloat = 350
    @State var articleString: String = ""
    var body: some View {
            VStack(alignment: .center){
                HStack{
                    Text(blog.title)
                    AsyncImage(
                        url: URL(string: blog.image),
                        content: { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(maxWidth: 100, maxHeight: 150)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }
                Divider()
                Text(articleString)
                
            }
            .onAppear{
                //articleString = blog.day + "," + ", " + "January" + "·" + " NPA team"
            }
            
            .frame(width: 11/12 * deviceWidth, height: 380)
            .background{
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .strokeBorder(Color(UIColor.systemGray4))
            }
        }
}

//#Preview {
//    BlogCardView()
//}
