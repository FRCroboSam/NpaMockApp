//
//  ShopScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/12/24.
//

import SwiftUI
import IsScrolling
import Combine
struct EventTypeScrollView: View {
    @State private var offset = CGFloat.zero
    @State private var previousOffset = CGFloat(10)

    @State var doneScrolling = false
    @EnvironmentObject var podcastVM: PodcastVM
    @State private var currentIndex = 0
    @State private var maxPodcastViewHeight: CGFloat = 380
    
    @State private var urls = [
        "games",
        "baseball_showcase",
        "summer_camp"
    ]
    @State private var titles = [
        "Games",
        "Showcases",
        "Camps"
    ]
    @State var isDragging = 0;
    
    @State var detector: CurrentValueSubject<CGFloat, Never>
    @State var publisher: AnyPublisher<CGFloat, Never>

    init() {
        let detector = CurrentValueSubject<CGFloat, Never>(0)
        self.publisher = detector
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .dropFirst()
            .eraseToAnyPublisher()
        self.detector = detector
    }
    var body: some View {
        ZStack{
            ScrollViewReader{ value in
                ScrollView(.horizontal, showsIndicators: false){
                    
                    LazyHStack {
                        Spacer()
                            .frame(width: 20)
                        ForEach(urls.indices, id: \.self) { index in
                            EventTypeView(image_name: urls[index], text: titles[index])
                                .id(index)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.5)){
                                        value.scrollTo(index, anchor: .leading)
                                    }
                                }
                            
                            
                            //
                        }
                        
                        Spacer()
                            .frame(width: 200)
                        
                        
                    }
                    .background(GeometryReader {
                        Color.clear.preference(key: ViewOffsetKey.self,
                            value: -$0.frame(in: .named("scroll")).origin.x)
                    })
                    .onPreferenceChange(ViewOffsetKey.self) {
                        print(ViewOffsetKey.self.defaultValue)
                        detector.send($0)
                    }
                    
//                    .background(GeometryReader { proxy -> Color in
//                        DispatchQueue.main.async {
//                            offset = -proxy.frame(in: .named("scroll")).origin.x
//                            print(offset)
//                            if(offset != previousOffset){
//                                doneScrolling = false
//                            }
//                            isDragging = 1;
//                            previousOffset = offset;
//                            
//                        }
//                        
//                        return Color.clear
//                    })
                }
                .coordinateSpace(name: "scroll")
                        .onReceive(publisher) {
                            print("Stopped on: \($0)")
                        }
                
                .contentShape(Rectangle())
                
                .background(Color.white)
                
                
                
                
            }.coordinateSpace(name: "global")
                .frame(width: deviceWidth, height: 200)

        }

        

        
        
//        ScrollView(.horizontal, showsIndicators: false){
//            HStack(spacing: 10){
//                Spacer()
//                    .frame(width: 10)
//                EventCardVertical(event_url: "https://www.footballcamps.com/media/fbcamps360webcmscom/photos/1458/1458_3.jpg")
//
//                EventCardVertical(event_url:
//                            "https://www.ussportscamps.com/media/images/soccer/nike/camps/soxdal_gallerypic3_950x516.jpg"
//                )
//
//                EventCardVertical(event_url:
//                            "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg"
//                )
//                EventCardVertical(event_url:
//                            "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg"
//                )
//
////                .scaleEffect(0.8)
//
//
////                .scaleEffect(0.8)
//
//            }
//        }.scrollIndicators(.hidden)
    }
}

#Preview {
    EventTypeScrollView()
        .environmentObject(PodcastVM())
}



//struct ViewOffsetKey: PreferenceKey {
//    typealias Value = CGFloat
//    static var defaultValue = CGFloat.zero
//    static func reduce(value: inout Value, nextValue: () -> Value) {
//        value += nextValue()
//    }
//}
