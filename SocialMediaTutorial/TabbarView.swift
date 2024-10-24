//
//  TabbarView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI
import YouTubePlayerKit
extension View {

    /// Calls the completion handler whenever an animation on the given value completes.
    /// - Parameters:
    ///   - value: The value to observe for animations.
    ///   - completion: The completion callback to call once the animation completes.
    /// - Returns: A modified View instance with the observer attached.
    func onAnimationCompleted<Value: VectorArithmetic>(for value: Value, completion: @escaping () -> Void) -> ModifiedContent<Self, AnimationCompletionObserverModifier<Value>> {
        return modifier(AnimationCompletionObserverModifier(observedValue: value, completion: completion))
    }
}

/// An animatable modifier that is used for observing animations for a given animatable value.
struct AnimationCompletionObserverModifier<Value>: AnimatableModifier where Value: VectorArithmetic {

    /// While animating, SwiftUI changes the old input value to the new target value using this property. This value is set to the old value until the animation completes.
    var animatableData: Value {
        didSet {
            notifyCompletionIfFinished()
        }
    }

    /// The target value for which we're observing. This value is directly set once the animation starts. During animation, animatableData will hold the oldValue and is only updated to the target value once the animation completes.
    private var targetValue: Value

    /// The completion callback which is called once the animation completes.
    private var completion: () -> Void

    init(observedValue: Value, completion: @escaping () -> Void) {
        self.completion = completion
        self.animatableData = observedValue
        targetValue = observedValue
    }

    /// Verifies whether the current animation is finished and calls the completion callback if true.
    private func notifyCompletionIfFinished() {
        guard animatableData == targetValue else { return }

        /// Dispatching is needed to take the next runloop for the completion callback.
        /// This prevents errors like "Modifying state during view update, this will cause undefined behavior."
        DispatchQueue.main.async {
            self.completion()
        }
    }

    func body(content: Content) -> some View {
        /// We're not really modifying the view so we can directly return the original input value.
        return content
    }
}
struct TabbarView: View {
    @State var shouldUpdate = false
    @State var addCartOpacity = 1.0
    @EnvironmentObject var athleteVM: AthleteVM

    @EnvironmentObject var vm: FeedVM
    @State private var selected = 1
    @State private var lastSelected = 1
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var urls = ["1", "2"]
    @State var selected2 = 1
    
    @State var displayView = 1
    @State var filterViewOffset = 600.0
    @State var filterFeed = false
    @State var slidingTabOffset = (deviceWidth - 250) / 6 + 25
    let tabOffsets = [(deviceWidth - 250) / 6 * 1 + 25,
                      (deviceWidth - 250) / 6 * 2 + 75,
                      (deviceWidth - 250) / 6 * 3 + 125,
                      (deviceWidth - 250) / 6 * 4 + 175,
                      (deviceWidth - 250) / 6 * 5 + 225,
                      ]
    @State private var startSlidingDown = false
    var body: some View {
        
        ZStack{
            if(!vm.showCommentSection){
                VStack(alignment: .leading){
                    
                    Rectangle()
                        .fill(Color(hex: "0A66C2"))
                        .frame(width: 40, height: 2.0)
                        .offset(x: slidingTabOffset - 20, y: -5)
                        .animation(.easeIn, value: slidingTabOffset)
                        .onAnimationCompleted(for: slidingTabOffset) {
                            print("DONE WITH ANIMATION")
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                                withAnimation(.easeIn){
                                    displayView = selected
                                }
                            }
                        }
                    HStack {
                        Spacer()
                        VStack{
                            Button(action: {
                                withAnimation(.easeIn){
                                    self.selected = 1
                                    slidingTabOffset = tabOffsets[self.selected - 1]
                                }
                            } ) {
                                Image("home_icon")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFill()
                                    .scaleEffect(1.25)
                                    .frame(width: 25, height: 25)
                                    .padding(3)
                                //Image(systemName: self.selected == 1 ? "house.fill" : "house") // Tab icon for HomeView

                                    .foregroundStyle(self.selected == 1 ? Color(hex: "0A66C2") : .gray)
                            }
                            .frame(height: 25)

                            Text("Home")
                                .font(.caption)
                                .foregroundStyle(self.selected == 1 ? Color(hex: "0A66C2") : .gray)
                        }
                        .frame(width: 50)

                        Spacer()
                        VStack{
                            Button(action: {
                                withAnimation(.easeIn){
                                self.selected = 2
                                slidingTabOffset = tabOffsets[self.selected - 1]



                            } } ) {
                                Image("discover_icon") // Tab icon for Search View
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFill()
                                    .scaleEffect(1.2)
                                    .frame(width: 25, height: 25)
                                    .font(.system(size: 25))
                                    //bold(self.selected == 2)
                                    .tint(self.selected == 2 ? Color(hex: "0A66C2") : .gray)
                                
                            }
                            .frame(height: 25)

                            Text("Explore")
                                .font(.caption)
                                .foregroundStyle(self.selected == 2 ? Color(hex: "0A66C2") : .gray)

                        }
                        .frame(width: 50)

                        Spacer()
                        VStack{
                            Button(action: {                                 withAnimation(.easeIn){
                                self.selected = 3
                                slidingTabOffset = tabOffsets[self.selected - 1]


                            } } ) {
                                Image("athlete_icon") // Tab icon for New Post
                                    .renderingMode(.template)
                                    
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(1.25)
                                    .frame(width: 25, height: 25)
                                    .tint(self.selected == 3 ? Color(hex: "0A66C2") : .gray)
//                                    .background{
//                                        Color.orange
//                                    }
                                
                            }
                            .frame(height: 25)

                            Text("Athletes")
                                .font(.caption)
                                .foregroundStyle(self.selected == 3 ? Color(hex: "0A66C2") : .gray)
                        }

                        .frame(width: 50)

                        Spacer()
                        VStack{
                            Button(action: {                                 withAnimation(.easeIn){
                                self.selected = 4
                                slidingTabOffset = tabOffsets[self.selected - 1]


                            } } ) {
                                Image("content_icon") // Tab icon for New Post
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(1.2)
                                    .frame(width: 25, height: 25)
                                    .tint(self.selected == 4 ? Color(hex: "0A66C2") : .gray)
                                
                            }
                            .frame(height: 25)

                            Text("Content")
                                .font(.caption)
                                .foregroundStyle(self.selected == 4 ? Color(hex: "0A66C2") : .gray)
                        }

                        .frame(width: 50)

                        Spacer()

                        VStack{
                            Button(action: {                                 withAnimation(.easeIn){
                                self.selected = 5
                                slidingTabOffset = tabOffsets[self.selected - 1]


                            } } ) {
                                Image(systemName:  "person.crop.circle.fill") // Tab icon for Profile View
                                    .font(.system(size: 25))
                                    .tint(self.selected == 5 ? Color(hex: "0A66C2") : .gray)
                                
                            }
                            .frame(height: 25)

                            Text("Profile")
                                .font(.caption)
                                .foregroundStyle(self.selected == 5 ? Color(hex: "0A66C2") : .gray)
                        }
                        .frame(width: 50)

                        Spacer()
                    }
                }

                    .onChange(of: selected){ value in
                        if(lastSelected == 3 && selected == 1){
                            
                        }
                        lastSelected = selected
                        
                        
                    }
                    
                    .padding(.top, 5)
                    .zIndex(athleteVM.showingFilters ? 5 : 20)

                
                    .background{
                        Color.white
                            .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 0, y: 0)
                            .padding(.bottom, -50)
                    }
                    .offset(y: 1/2 * deviceHeight - 60 )
                    //                .frame(width: deviceWidth)
                    .onChange(of: athleteVM.feedOrCommentSection){ value in
                        withAnimation(.easeIn){
                            selected2 = athleteVM.feedOrCommentSection
                        }
                    }
                    
                }
            if(displayView == 1){
                TabView(selection: $selected2){ //$athleteVM.feedOrCommentSection.animation()){
//                    ForEach(urls.indices, id: \.self) { index in
//                        if(urls[index] == "1"){
//                            FeedView()
//                        }
//                        else{
//                            InboxView(athletes: athleteVM.athletes)
//                        }
//                    }
                    CreatePostView().tag(0)

                    FeedView().tag(1)

                    InboxView(athletes: athleteVM.athletes).tag(2)
                    EmptyView().tag(4)
                    
                    //NotificationsView().tag(-1)
                }
                
                .onAppear{
                    UIScrollView.appearance().alwaysBounceHorizontal = false
                }
                
                
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            else if(displayView == 2){
                ExploreView()
                //MainExploreView()

            }
            else if(displayView == 3){
                
                DiscoverView()
//                    .ignoresSafeArea(.keyboard)

                    .onAppear{
                        print("DISCOVER APPEARS")
//                        selected = 1
                    }
            }
            else if(displayView == 4){
                NpaContentView()
            }
            else if(displayView == 5){
                EditProfileView(athlete: Athlete.defaultAthlete())
            }
            else{
                Color.white
//                    .onAppear{
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
//                            selected = 1
//                        }
//                    }

            }
            if(athleteVM.showingFilters){
                ZStack{
                    if(selected == 1){
                        FeedFilterView()
                    }
                    else{
                        FilterView()
                    }
                }
                .tag(1)
                .zIndex(40)
                
                .offset(y: filterViewOffset)
                .animation(.easeIn, value: filterViewOffset)
                .onAppear{
                    print("SHOULD BE APPEARING")
                    filterViewOffset = 500
                    withAnimation(.easeIn.speed(3.5)){
                        let y = print("SHOWING COMMENT SECTION")
                        filterViewOffset = 300
                        filterFeed = true
                    }
                    
                }
                
                .onChange(of: athleteVM.startSlidingDown) { value in
                    if(value == true){
                        withAnimation(.easeIn.speed(3.5)){
                            filterViewOffset = 500
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                            athleteVM.animatingFilters = false
                            athleteVM.startSlidingDown = false
                            athleteVM.showingFilters = false
                            filterFeed = false
                            
                        }
                    }
                }
            }
            if(vm.addCartNotification){
                AddCartNotification(itemURL: $vm.cartImageLink, shouldUpdate: $shouldUpdate)
                    .opacity(addCartOpacity)
                    .offset(y: 1/2 * deviceHeight - 130)
                    .zIndex(100000)
                    

            }
            

//            TabView(selection: $selected) {
//                FeedView()
//                    .tabItem {
//                        Text("")
//                    }.tag(1)
//            .toolbar(vm.showCommentSection || athleteVM.showingFilters ? .hidden : .visible, for: .tabBar)                      .zIndex(athleteVM.animatingFilters ? -10 : 0)
//
////
//
//
//
//                ExploreView()
//
//                    .tabItem {
//                        Text("")
//                    }.tag(2)
//                    .navigationBarTitleDisplayMode(.inline)
//                    .toolbar(vm.showCommentSection || athleteVM.showingFilters ? .hidden : .visible, for: .tabBar)                    .zIndex(athleteVM.animatingFilters ? -10 : 0)
//
//
//                DiscoverView()
//                    .tabItem {
//                        Text("")
//                    }.tag(3)
//                    .navigationBarTitleDisplayMode(.inline)
//                    .toolbar {
//                        ToolbarItem(placement: .principal) {
//                            HStack {
//                                Image(systemName: "sun.min.fill")
//                                Text("Title").font(.headline)
//                            }
//                        }
//                    }
//                    .toolbar(vm.showCommentSection || athleteVM.animatingFilters ? .hidden : .visible, for: .tabBar)
//                    .zIndex(athleteVM.showingFilters ? -10 : 0)
//
//                NpaContentView()
//                    .tabItem {
//                        Text("")
//                    }.tag(4)
//                    .toolbar(vm.showCommentSection || athleteVM.animatingFilters ? .hidden : .visible, for: .tabBar)
//                    .zIndex(athleteVM.showingFilters ? -10 : 0)
//
//
//                EditProfileView(athlete: Athlete.defaultAthlete())
//                    .tag(5)
//                    .toolbar(vm.showCommentSection || athleteVM.animatingFilters ? .hidden : .visible, for: .tabBar)
//                    .zIndex(athleteVM.showingFilters ? -10 : 0)
//
//
////                InboxView(athletes: athleteVM.athletes)
////                    .tabItem {
////                        Text("")
////                    }.tag(5)
////                    .toolbar(vm.showCommentSection ? .hidden : .visible, for: .tabBar)
//
//            }
            
            
            
//            .onAppear {
//                  UIScrollView.appearance().isScrollEnabled = false
//            }
            //.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//            .navigationTitle("NPA")
//            .navigationBarTitleDisplayMode(.large)
//            .accentColor(.brown) // Accent color for the TabView
            // tab-items cover - do anything needed, height, position, alignment, etc.

            }
//        .onChange(of: selected){_ in
//            print("CHANGING DISPLAY")
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
//                withAnimation(.easeIn){
//                    displayView = selected
//                }
//            }
//
//        }
        .onChange(of: vm.addCartNotification){ _ in
            if(vm.addCartNotification == true){
                shouldUpdate.toggle()
                print("SHOULD STOP SHOWING SOON")
                addCartOpacity = 1.0

                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                    withAnimation(.easeOut.speed(0.5)){
                        addCartOpacity = 0.0
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                    withAnimation(.easeOut.speed(0.5)){
                        print("SHOULD STOP SHOWING")
                        vm.addCartNotification = false
                    }
                }

            }
        }


            .toolbar(.hidden, for: .navigationBar)
            
        
        

    }


}

//struct TabbarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabbarView()
//            .environmentObject(FeedVM())
//            .environmentObject(AthleteVM())
//    }
//}

struct NavigationBarAccessor: UIViewControllerRepresentable {
    var callback: (UINavigationBar) -> (AnyView)
    private let proxyViewController = ProxyViewController()

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationBarAccessor>) -> UIViewController {
        self.proxyViewController.callback = callback
        return proxyViewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationBarAccessor>) {
    }

    private class ProxyViewController: UIViewController {
        var callback: ((UINavigationBar) -> AnyView)?

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if let navigationBar = self.navigationController?.navigationBar {
                _ = self.callback?(navigationBar)
            }
        }
    }
}
