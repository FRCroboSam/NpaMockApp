import SwiftUI
import UIKit

struct CustomTabBarView: View {
    @State private var scrollPosition: CGPoint = .zero

    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    
    //@Binding var goToNearestTab: Bool
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    @State var tabAtIndexShouldExtend = false ;
    @State var selectedIndex = 0
    @State var hasScrolled = false;
    
    @State var goToNearestTab = false;
    @State var stoppedAccelerating = false;
    @State var called = false
    @State var scrollViewOffset = CGPoint(x: 6.00001, y: 0)
    @State var opacities = [Double](repeating: 0.0, count: 12)
    @State var nearestTab = 0
    @State var oldTab = 0
    @State var isTouching = false
    
    @State var velocity = 0.0
    
    @State var isLeft = false
    
    @State var tabOffsets = (0..<6).map { Double(35 * $0 + 6) }

    @State var lastOffset = CGPoint(x: 0, y: 0)
    var body: some View {
        tabBarVersion2
            .onChange(of: selection, perform: { value in
                withAnimation(.easeInOut(duration: 0.2)) {
                    print("TAB THING IS CHANGING")
                    localSelection = value
                }
            })
    }
    
   
}
extension CustomTabBarView {
    
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))

        }
        .foregroundColor(localSelection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? tab.color.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
    
    private var tabBarVersion1: some View {
        ScrollView(.horizontal){
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    tabView(tab: tab)
                        .onTapGesture {
                            switchToTab(tab: tab, index: 0)
                        }
                }
            }
            //.padding(6)
            .background(Color.white.ignoresSafeArea(edges: .bottom))
        }.scrollIndicators(.hidden)
    }
    
    private func switchToTab(tab: TabBarItem, index: Int) {
        localSelection = tab
        
        opacities = [Double](repeating: 0.0, count: 12)
        opacities[index] = 0.2
        selectedIndex = index
        
    }
    
}

extension CustomTabBarView {

    private func tabView2(tab: TabBarItem) -> some View {
        
        VStack {
            
                VStack{
                    Image(systemName: tab.iconName)
                        .font(.system(size: 25))
                        .foregroundStyle(localSelection == tab ? Color.blue : Color.gray)
                        .frame(height: 25)
                    
                    Text(tab.title)
                    //.font(.system(size: 15, weight: .semibold, design: .rounded))
                        .scaledToFill()
                        .foregroundStyle(localSelection == tab ? Color.blue : Color.gray)
                        .minimumScaleFactor(0.5)
                }
                .frame(width: 40, height: 50)

        }
        .scrollBounceBehavior(.basedOnSize)
        //.foregroundColor(localSelection == tab ? Color.blue : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
//        .background(
//            ZStack {
//                if localSelection == tab {
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(tab.color.opacity(0.2))
//                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
//                        .padding(-5)
//                        .frame(width : 70)
//
//                }
//            }
//        )
    }
    
    private var tabBarVersion2: some View {
            VStack(alignment: .leading){
                ScrollableView($scrollViewOffset, localSelection: $selectedIndex, goToNearestTab: $goToNearestTab,
                               isTouching: $isTouching, stoppedAccelerating: $stoppedAccelerating, nearestTab: $nearestTab, animationDuration: 0.2){
                    HStack {
                        Spacer()
                            .frame(width: 30)
                        ForEach(tabs.indices, id: \.self) { index in
                            VStack{
                                let tab = tabs[index]
                                tabView2(tab: tab)
                                    .opacity(opacities[index] + 0.8)
                                    .animation(.easeInOut(duration: 0.3), value: opacities[index])
                                    .id(index)
                                    .onTapGesture {
                                        print("TAPPPED")

                                        withAnimation(.easeIn){
                                            scrollViewOffset.x = 35.0 * Double(index) + 6.0
                                        }
                                        
                                        print(selectedIndex)
                                        switchToTab(tab: tab, index: index)

                                        
                                        
                                    }
                                //                        if(localSelection == tab){
                                //                            Rectangle()
                                //                                .fill(Color.blue)
                                //                                .offset(x:  min(570 * 1.2, 1.2 * abs(scrollPosition.x)))
                                //                        }
                                
                            }
                            Spacer()
                                .frame(width: index != tabs.count - 1  ? 30 : 10)
                        }
                        Spacer()
                            .frame(width: 200)

                    }
                    
                    .padding(6)

                    .background(GeometryReader { geometry in
                        Color.clear
                            .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
                    })
                    .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                        let tab = round((scrollViewOffset.x - 6) / 35)
                        

                        velocity = abs(lastOffset.x - scrollViewOffset.x)
                        //print("OFFSET IS:: " + String(Double(scrollViewOffset.x)))
                        if(scrollViewOffset.x == 6.00001){
                            scrollViewOffset.x = 6.0
                        }
                        if(!isTouching || abs((tab * 35 + 6) - scrollViewOffset.x) < 2){
                            tabAtIndexShouldExtend = false
                        }
                        if(velocity > 2.0 || isTouching){
                            
                            print(tab)
                            let newTab = max(0, min(tabs.count - 1, Int(round((scrollViewOffset.x - 6) / 35))))
                            //                        if(newTab != nearestTab){
                            
                            if(nearestTab != newTab && abs((tab * 35 + 6) - scrollViewOffset.x) < 10){
                                oldTab = nearestTab
                                if(lastOffset.x - scrollViewOffset.x < 0){
                                    isLeft = true
                                }
                                else if(lastOffset.x - scrollViewOffset.x > 0){
                                    isLeft = false
                                }
                                nearestTab = newTab
                                if(abs((tab * 35 + 6) - scrollViewOffset.x) > 1 ){
                                     tabAtIndexShouldExtend = true
                                }
                                switchToTab(tab: tabs[newTab], index: newTab)
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                impactMed.impactOccurred()
                                
                            }
                            
                            
                            //print(scrollViewOffset.x)
                            //                        if(abs(scrollViewOffset.x - lastOffset.x) < 0.1){
                            //                            goToNearestTab = true
                            //                        }
                            print("GO TO NEAREST TAB IS: " + String(goToNearestTab))
                        }
                        
                        lastOffset.x = scrollViewOffset.x
                        
                    }
                }
               .onChange(of: isTouching, perform: { value in
                   if(isTouching == false){
                       tabAtIndexShouldExtend = false
                   }
               })
               .onChange(of: localSelection, perform: { value in
                   print("CHANGING")
                   DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                       withAnimation(.easeIn){
                           selection = localSelection
                       }
                   }

               })

                .onChange(of: goToNearestTab, perform: { value in
                    print("go TO nearest tab changed")
                    //let newTab = max(0, min(tabs.count - 1, Int(round((scrollViewOffset.x - 6) / 35))))
                    if(goToNearestTab == true){
                        print("NEAREST TAB: " + String(nearestTab))

                        withAnimation(.easeIn){
                            scrollViewOffset.x = 35 * Double(nearestTab) + 6.0
                            print("GOING TO NEAREST TAB2" + String(scrollViewOffset.x == 35 * Double(nearestTab) + 6.0))
                            goToNearestTab = false

                            //selection = localSelection

                        }

                        
                        print(selectedIndex)
                        switchToTab(tab: tabs[nearestTab], index: nearestTab)

                    }
                })

                .frame(width: deviceWidth, height: 60)
//                .onTapGesture {
//                    DragGesture(minimumDistance: 0.0).onEnded { value in
//                        print("DONE DRAGGING")
//                    }
//                }
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: tabAtIndexShouldExtend ? 60 : 45, height: 2)
                    
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                        .offset(x: tabAtIndexShouldExtend ? tabOffsets[oldTab] :
                                tabOffsets[nearestTab], y: 0)
                        .padding(.leading, tabAtIndexShouldExtend && !isLeft ? -10 : 20 + (tabAtIndexShouldExtend ? 0 : 0))
                        .animation(.linear.speed(0.7) , value: tabAtIndexShouldExtend ? tabOffsets[oldTab] :
                                    tabOffsets[nearestTab])
                        .animation(.easeIn.speed(3.0) , value: tabAtIndexShouldExtend)


                
            }
            
        

    }
    
}
                    
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}
//struct DragGestureViewModifier: ViewModifier {
//    @GestureState private var isDragging: Bool = false
//    @State var gestureState: GestureStatus = .idle
//
//    var onStart: Callback?
//    var onUpdate: ((DragGesture.Value) -> Void)?
//    var onEnd: Callback?
//    var onCancel: Callback?
//
//    func body(content: Content) -> some View {
//        content
//            .gesture(
//                DragGesture()
//                    .updating($isDragging) { _, isDragging, _ in
//                        isDragging = true
//                    }
//                    .onChanged(onDragChange(_:))
//                    .onEnded(onDragEnded(_:))
//            )
//            .onChange(of: gestureState) { state in
//                guard state == .started else { return }
//                gestureState = .active
//            }
//            .onChange(of: isDragging) { value in
//                if value, gestureState != .started {
//                    gestureState = .started
//                    onStart?()
//                } else if !value, gestureState != .ended {
//                    gestureState = .cancelled
//                    onCancel?()
//                }
//            }
//    }
//
//    func onDragChange(_ value: DragGesture.Value) {
//        guard gestureState == .started || gestureState == .active else { return }
//        onUpdate?(value)
//    }
//
//    func onDragEnded(_ value: DragGesture.Value) {
//        gestureState = .ended
//        onEnd?()
//    }
//
//    enum GestureStatus: Equatable {
//        case idle
//        case started
//        case active
//        case ended
//        case cancelled
//    }
//}
//struct ScrollingHStackTabModifier: ViewModifier {
//    
//    @State private var scrollOffset: CGFloat
//    @State private var dragOffset: CGFloat
//    @State private var currentTab = 0
//    
//    var items: Int
//    var itemWidth: CGFloat
//    var itemSpacing: CGFloat
//    
//    init(items: Int, itemWidth: CGFloat, itemSpacing: CGFloat) {
//        self.items = items
//        self.itemWidth = itemWidth
//        self.itemSpacing = itemSpacing
//        
//        // Calculate Total Content Width
//        let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
//        let screenWidth = UIScreen.main.bounds.width
//        
//        // Set Initial Offset to first Item
//        let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth - itemWidth) / 2.0)
//        
//        self._scrollOffset = State(initialValue: 140)
//        self._dragOffset = State(initialValue: 0)
//    }
//    
//    func body(content: Content) -> some View {
//        content
//            .offset(x: scrollOffset + dragOffset, y: 0)
//            .gesture(DragGesture(minimumDistance: 5)
//                .onChanged({ event in
//                    print("DRAGGING")
//                    dragOffset = event.translation.width
//                })
//                .onEnded({ event in
//                    // Scroll to where user dragged
//                    print("DRAGGING IS DONE")
//                    scrollOffset += event.translation.width
//                    dragOffset = 0
//                    print("SCROLL OFFSET IS: " + String(Double(scrollOffset)))
//                    let nearestIndex = Int(round((scrollOffset + 20 - 150) / -(itemWidth + itemSpacing)))
//
//                    
//                    // Now calculate which item to snap to
//                    let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
//                    let screenWidth = UIScreen.main.bounds.width
//                    
//                    // Center position of current offset
//                    let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
//                    
//                    // Calculate which item we are closest to using the defined size
//                    var index = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)
//                    let velocity = CGSize(
//                            width:  event.predictedEndLocation.x - event.location.x,
//                            height: event.predictedEndLocation.y - event.location.y
//                        )
//                    
//                    let isRight = velocity.width > 0;
//                    
//                    
//                    
//                        // Should we stay at current index or are we closer to the next item...
//                    print(velocity.width)
//                    if(abs(velocity.width) < 20){
//                         currentTab = nearestIndex
//                        print("NEAREST INDEX IS: " + String(currentTab))
//                    }
//                    else{
//                        let totalItemSize = itemWidth + itemSpacing
//                        index = abs(round(CGFloat(items) - (center - (screenWidth / 2.0)) / (totalItemSize)))
//                        print("INDEX IS: " + String(Double(index)))
//                        if(isRight){
//                            index = CGFloat(Int(index));
//                            print("NEW INDEX IS: " + String(Double(index)))
//                            currentTab -= 1
//
//                        }
//                        else{
//                            index = CGFloat(Int(index + 1));
//                            print("NEW INDEX IS: " + String(Double(index)))
//                            print(index)
//                            currentTab += 1
//                            
//
//
//                        }
//                    }
//                    // Protect from scrolling out of bounds
////                    index = min(index, CGFloat(items) - 1)
////                    index = max(index, 0)
//                    print("ACTUALLY INDEX IS:  ")
//                    print(index)
//                    if(currentTab < 0){
//                        currentTab = 0
//                    }
//                    if(currentTab > items - 1){
//                        print("why tf are you running this")
//
//                        index = CGFloat(items - 1)
//                        currentTab = items - 1
//                    }
//                    print("NEW INDEX 2IS: " + String(Double(index)))
//
//                    // Set final offset (snapping to item)
//                    
////                    let newOffset = index * itemWidth + (index - 1) * itemSpacing - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - itemWidth) / 2.0) + itemSpacing
////                    print("newOffset")
////                    print(newOffset)
//                    var newOffset = 150 - Double(itemWidth + itemSpacing) * Double(currentTab) - 20
//                    print("NEW OFFSET")
//                    print(newOffset)
//                    print("CURRENT TAB IS")
//                    print(currentTab)
//                    // Animate snapping
//                    withAnimation(.linear(duration: 0.1)) {
//                        scrollOffset = newOffset
//                        
//                    }
//                    
//                    //-235 for index 2
//                    //-8 for index 1
//                    //200 for index 0
//                    
//                })
//            )
//    }
//}


