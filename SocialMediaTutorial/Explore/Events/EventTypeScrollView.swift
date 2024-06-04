//
//  ShopScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/12/24.
//

import SwiftUI
import Foundation
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
            .debounce(for: .seconds(0.1), scheduler: DispatchQueue.main)
            .dropFirst()
            .eraseToAnyPublisher()
        self.detector = detector
    }
    var body: some View {
        ZStack{
//            ScrollViewReader{ value in
//                ScrollView(.horizontal, showsIndicators: false){
                    
            HStack(spacing: 10) {
//                        Spacer()
//                            .frame(width: 20)
                        ForEach(urls.indices, id: \.self) { index in
                            EventTypeView(image_name: urls[index], text: titles[index])
                                .id(index)

                            
                            
                            //
                        }
                        

                        
                        
                    }.modifier(ScrollingHStackModifier(items: urls.count, itemWidth: 5/9 * deviceWidth, itemSpacing: 10))
                .frame(width: 7/8 * deviceWidth)
                    

//                }
                
                .coordinateSpace(name: "scroll")
                        .onReceive(publisher) {
                            print("Stopped on: \($0)")
                        }
                
                .contentShape(Rectangle())


                .background(Color.white)
                
                
                
                
//            }.coordinateSpace(name: "global")

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

import SwiftUI

struct ScrollingHStackModifier: ViewModifier {
    
    @State private var scrollOffset: CGFloat
    @State private var dragOffset: CGFloat

    
    var items: Int
    var itemWidth: CGFloat
    var itemSpacing: CGFloat
    
    init(items: Int, itemWidth: CGFloat, itemSpacing: CGFloat) {
        self.items = items
        self.itemWidth = itemWidth
        self.itemSpacing = itemSpacing
        
        // Calculate Total Content Width
        let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
        let screenWidth = UIScreen.main.bounds.width
        
        // Set Initial Offset to first Item
        let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth - itemWidth) / 2.0)
        
        self._scrollOffset = State(initialValue: 200)
        self._dragOffset = State(initialValue: 0)
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x: scrollOffset + dragOffset, y: 0)
            .gesture(DragGesture()
                .onChanged({ event in
                    dragOffset = event.translation.width
                })
                .onEnded({ event in
                    // Scroll to where user dragged
                    scrollOffset += event.translation.width
                    dragOffset = 0
                    
                    // Now calculate which item to snap to
                    let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
                    let screenWidth = UIScreen.main.bounds.width
                    
                    // Center position of current offset
                    let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
                    
                    // Calculate which item we are closest to using the defined size
                    var index = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)
                    let velocity = CGSize(
                            width:  event.predictedEndLocation.x - event.location.x,
                            height: event.predictedEndLocation.y - event.location.y
                        )
                    
                    let isRight = velocity.width > 0;
                    
                    
                    
                        // Should we stay at current index or are we closer to the next item...
                    print(velocity.width)
                    if(abs(velocity.width) < 20){
                         index = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)
                        if index.remainder(dividingBy: 1) > 0.5 && abs(Double(velocity.width)) < 20.0{
                            print("GOING TO THE NEXT ITEM")
                            index += 1
                        } else {
                            print("NOT GOING TO THE NEXT ITEM")
                            index = CGFloat(Int(index))
                        }
                    }
                    else{
                        //don't care about the scroll offset

                         index = abs(round(2 - (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)))
                        print("INDEX IS: " + String(Double(index)))
                        if(isRight){
                            index = CGFloat(Int(index));
                            print("NEW INDEX IS: " + String(Double(index)))

                        }
                        else{
                            index = CGFloat(Int(index + 1));
                            print("NEW INDEX IS: " + String(Double(index)))
                            print(index)


                        }
                    }
                    // Protect from scrolling out of bounds
//                    index = min(index, CGFloat(items) - 1)
//                    index = max(index, 0)
                    print("ACTUALLY INDEX IS:  ")
                    print(index)
                    if(index < 0){
                        index = 0
                    }
                    if(index > 2){
                        print("why tf are you running this")

                        index = 2
                    }
                    print("NEW INDEX 2IS: " + String(Double(index)))

                    // Set final offset (snapping to item)
                    
//                    let newOffset = index * itemWidth + (index - 1) * itemSpacing - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - itemWidth) / 2.0) + itemSpacing
//                    print("newOffset")
//                    print(newOffset)
                    var newOffset = index
                    if(index == 2.0){
                        newOffset = -235
                    }
                    else if(index == 1.0){
                        newOffset = -8
                    }
                    else{
                        newOffset = 200
                    }
                    print("NEW OFFSET")
                    print(newOffset)
                    // Animate snapping
                    withAnimation(.linear(duration: 0.1)) {
                        scrollOffset = newOffset
                    }
                    
                    //-235 for index 2
                    //-8 for index 1
                    //200 for index 0
                    
                })
            )
    }
}
