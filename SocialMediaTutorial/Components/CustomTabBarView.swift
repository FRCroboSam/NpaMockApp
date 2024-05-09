import SwiftUI
import UIKit

struct CustomTabBarView: View {
    @State private var scrollPosition: CGPoint = .zero

    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    @State var tabAtIndexShouldExtend = false ;
    @State var hasScrolled = false;
    
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
                            switchToTab(tab: tab)
                        }
                }
            }
            //.padding(6)
            .background(Color.white.ignoresSafeArea(edges: .bottom))
        }.scrollIndicators(.hidden)
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
//        scrollPosition.x = 0
        
    }
    
}

extension CustomTabBarView {

    private func tabView2(tab: TabBarItem) -> some View {
        VStack {
            VStack{
                Image(systemName: tab.iconName)
                    .font(.system(size: 25))
                    .frame(height: 25)
                
                Text(tab.title)
                    //.font(.system(size: 15, weight: .semibold, design: .rounded))
                    .scaledToFill()
                    .minimumScaleFactor(0.5)
            }
            .frame(width: 40, height: 50)
            if(localSelection == tab){
//                if(!tabAtIndexShouldExtend){


//                }
//                if(tabAtIndexShouldExtend){
//                    Rectangle()
//                        .fill(Color.blue)
//                        .frame(width: 70, height: 2)
//                        .offset(x: -scrollPosition.x)
//                        .matchedGeometryEffect(id: "background_rectangle2", in: namespace)
//                }
            }
            
            else{
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 45, height: 2)
            }
            

        }
        .scrollBounceBehavior(.basedOnSize)
        .foregroundColor(localSelection == tab ? tab.color : Color.gray)
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
        ScrollViewReader{ reader in
            VStack(alignment: .leading){
                ScrollView(.horizontal){
                    HStack {
                        ForEach(tabs.indices, id: \.self) { index in
                            VStack{
                                let tab = tabs[index]
                                tabView2(tab: tab)
                                    .id(index)
                                    .onTapGesture {
                                        switchToTab(tab: tab)
                                        
                                        
                                        
                                    }
                                //                        if(localSelection == tab){
                                //                            Rectangle()
                                //                                .fill(Color.blue)
                                //                                .offset(x:  min(570 * 1.2, 1.2 * abs(scrollPosition.x)))
                                //                        }
                                
                            }
                            Spacer()
                                .frame(width: 30)
                        }
                        Spacer()
                            .frame(width: 200)
                    }
                    .onAppear{
                        print("SETTING SCROLL POSITION")
                        self.scrollPosition.x = 0.0
                    }
                    //.frame(width: 3/4 * deviceWidth)
                    
                    .padding(6)
                    .padding(.horizontal)
                    .background(GeometryReader { geometry in
                        Color.clear
                            .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
                    })
                    .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                        if(hasScrolled){
                            print("VALUE X: " + String(Double(value.x)))

                            if abs(value.x.truncatingRemainder(dividingBy: -30)) <= 10 {
                                print("VALUE X: " + String(Double(value.x)))
                                var nearestTab = Int(round(Double(Int(value.x / -30))))
                                print(nearestTab)//write error handling, fix logic
                                print("NEAREST  TAB" + String(nearestTab))

                                nearestTab = min(tabs.count - 1, nearestTab)
                                nearestTab = max(0, nearestTab)
                                tabAtIndexShouldExtend = false
                                print("TAB SHOULD NOT EXTEND")
                                //                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                switchToTab(tab: tabs[nearestTab])
                                //
                                //                            }
                                
                                
                            }
                            //                    else if abs(value.x.truncatingRemainder(dividingBy: -60)) <= 40 {
                            //                        withAnimation{
                            //                            tabAtIndexShouldExtend = true
                            //                        }
                            //                        print("TAB SHOULD ExTE D")
                            //                    }
                            self.scrollPosition.x = value.x
                        
                        }
                        else if(abs(value.x) < 10){
                            print(value)
                            print("SETTING TO 0")
                            hasScrolled = true
                        }
                    }
                }
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 45, height: 2)
                
                    .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                    .offset(x: -scrollPosition.x, y: -15)
                    .padding(.leading, 20)
            }
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




