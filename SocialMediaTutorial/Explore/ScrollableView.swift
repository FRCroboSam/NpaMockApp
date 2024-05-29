import SwiftUI
enum DragState{
    case DRAGGING
    case RELEASED
}
    
struct ScrollableView<Content: View>: UIViewControllerRepresentable, Equatable {
        
    // MARK: - Coordinator
    final class Coordinator: NSObject, UIScrollViewDelegate {
        
        // MARK: - Properties
        private let scrollView: UIScrollView
        private let scrollableView: ScrollableView
        var offset: Binding<CGPoint>
        var goToNearestTab: Binding<Bool>
        var stoppedAccelerating: Binding<Bool>
        
        var scrollAfterSlowDown = false
        
        var nearestTab: Binding<Int>
        
        var isTouching: Binding<Bool>

                
        var isDecelerating = false
        
        var isGoingBack = false
        
        var lastOffsetX = 0.0
        var velocityStreak = 0
        
        @objc func viewTap() {
            print("Tap gesture executed")
        }

        // MARK: - Init
        init(_ scrollView: UIScrollView, _ scrollableView: ScrollableView, offset: Binding<CGPoint>, nearestTab: Binding<Int>, goToNearestTab: Binding<Bool>, isTouching: Binding<Bool>, stoppedAccelerating: Binding<Bool>) {
            self.scrollView          = scrollView
            self.nearestTab          = nearestTab
            self.offset              = offset
            self.goToNearestTab      = goToNearestTab
            self.isTouching          = isTouching
            self.scrollableView      = scrollableView
            self.stoppedAccelerating = stoppedAccelerating
            super.init()
            self.scrollView.delegate = self
        }
        
        // MARK: - UIScrollViewDelegate
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            // user just released their finger, find the nearest offset (0 for now)
            let velocity = abs(offset.wrappedValue.x - lastOffsetX)
            if(velocity < 8 && !scrollView.isTracking){
                velocityStreak += 1
            }
            else{
                velocityStreak = 0
            }
        
            

            if(scrollView.isTracking){
                print("USER IS SCROLLING")
                DispatchQueue.main.async{
                    self.isTouching.wrappedValue = true

                    //self.goToNearestTab.wrappedValue = false
                    self.scrollAfterSlowDown = false
                }
                DispatchQueue.main.async{
                    
//                    self.offset.wrappedValue.x = scrollView.contentOffset.x
                    self.offset.wrappedValue.x = scrollView.contentOffset.x

                }
            }
            else{
                DispatchQueue.main.async{
                    self.isTouching.wrappedValue = false
                }
                if(!scrollAfterSlowDown){
                    DispatchQueue.main.async{
//                        print("SETTING THE WRAPPED VALUE OFFSET FROM CONTENT OFFSET ")

                        self.offset.wrappedValue.x = scrollView.contentOffset.x
                        print("ExpECted OFFSET HERE FOR SOME REASON")
                        
                    }
                }
                else{
                    DispatchQueue.main.async{
//                        print("SETTING THE CONTENT OFFSET FROM WRAPPED VALUE ")
                        self.scrollView.contentOffset.x = Double(self.nearestTab.wrappedValue) * 35.0 + 6.0
                        
                    }
                }
                
                
            }
            
//            print("VELOCITYL " + String(Double(velocity)) + String(goToNearestTab.wrappedValue))
//            print("ACTUAL CONTENT OFFSET: " + String(Double(self.scrollView.contentOffset.x)))

            if(!self.scrollAfterSlowDown && velocityStreak >= 2 && !scrollView.isTracking){
                print("VELOCITY: HELLO1")
                velocityStreak = 0
//                DispatchQueue.main.async{
                    //self.goToNearestTab.wrappedValue = true
                self.scrollAfterSlowDown = true
                print(self.scrollAfterSlowDown)
                DispatchQueue.main.async{
                    UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction, .curveLinear, .beginFromCurrentState], animations: {
                        self.offset.wrappedValue.x = Double(self.nearestTab.wrappedValue) * 35.0 + 6.0
                        self.scrollView.contentOffset.x = Double(self.nearestTab.wrappedValue) * 35.0 + 6.0
                        print("EXPECTED OFFSET: " + String(Double(self.offset.wrappedValue.x)))
                        print("EXPECTED OFFSET: " + String(Double(self.scrollView.contentOffset.x)))
                        
                        
                        
                    });
                }

//                    });

//
//                        print("OFFSET: " + String(Double(self.offset.wrappedValue.x)))
//                        print("SHOULD BE: " + String(Double(self.nearestTab.wrappedValue) * 35.0 + 6.0))
////                    });


                
            
            }
            lastOffsetX = self.offset.wrappedValue.x

//            DispatchQueue.main.async{
//                self.offset.wrappedValue.x = max(-10, max(self.offset.wrappedValue.x, 370) )
//            }


        }
        
//        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//            //self.offset.wrappedValue.x = 0
//            
//            print(self.scrollableView.stopScrolling)
//            print("NOT SCROLLING")
//        }
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            print("ENDED ACCELERATING")
            //goToNearestTab.wrappedValue = true
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
//                self.offset.wrappedValue.x = Double(self.nearestTab.wrappedValue) * 35.0 + 6.0
//                //self.scrollView.contentOffset.x = Double(self.nearestTab.wrappedValue) * 35.0 + 6.0
//                print("EXPECTED OFFSET: " + String(Double(self.offset.wrappedValue.x)))
//                print("EXPECTED OFFSET: " + String(Double(self.scrollView.contentOffset.x)))
//            }

//            if(!scrollView.isTracking){
//            }
            stoppedAccelerating.wrappedValue = true 
            if(!scrollView.isTracking && !goToNearestTab.wrappedValue){
                goToNearestTab.wrappedValue = false
                goToNearestTab.wrappedValue = true
            }

        }

        func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
            isDecelerating = true
            lastOffsetX = scrollView.contentOffset.x
            print("STARTING DECELERATION: " + String(lastOffsetX))

        }
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            isTouching.wrappedValue = false
//            if(abs(velocity.x) < 2.0){
//                print("DRAG END VLEOCITY: " + String(Double(velocity.x)))
            goToNearestTab.wrappedValue = false
            goToNearestTab.wrappedValue = true
            
//            scrollView.setContentOffset(CGPoint(x: Double(self.nearestTab.wrappedValue) * 35.0 + 6.0, y: 0.0), animated: true)
            print("VELOCITY: HELLO 0")
//
            
            print("DONE DRAGGING")
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
//                self.offset.wrappedValue.x = Double(self.nearestTab.wrappedValue) * 35.0 + 6.0
//                //self.scrollView.contentOffset.x = Double(self.nearestTab.wrappedValue) * 35.0 + 6.0
//                print("EXPECTED OFFSET: " + String(Double(self.offset.wrappedValue.x)))
//                print("EXPECTED OFFSET: " + String(Double(self.scrollView.contentOffset.x)))
//            }
            
        }
    }
    
    // MARK: - Type
    typealias UIViewControllerType = UIScrollViewController<Content>
    
    // MARK: - Properties
     var offset: Binding<CGPoint>
     var localSelection: Binding<Int>
    var goToNearestTab: Binding<Bool>

    var nearestTab: Binding<Int>


//    var userStoppedScrolling: Binding<Bool>
//    var stoppeDecelerating: Binding<Bool>
    
    var animationDuration: TimeInterval
    var showsScrollIndicator: Bool
    var axis: Axis
    var content: () -> Content
    var onScale: ((CGFloat)->Void)?
    var disableScroll: Bool
    var forceRefresh: Bool
    var stopScrolling: Binding<Bool>
    var stoppedAccelerating: Binding<Bool>

    var isTouching: Binding<Bool>
    
    
    @State var lastXOffset = 0.0
    private let scrollViewController: UIViewControllerType

    // MARK: - Init
    init(_ offset: Binding<CGPoint>, localSelection: Binding<Int>, goToNearestTab: Binding<Bool>, isTouching: Binding<Bool>, stoppedAccelerating: Binding<Bool> , nearestTab: Binding<Int>, animationDuration: TimeInterval, showsScrollIndicator: Bool = false, axis: Axis = .horizontal, onScale: ((CGFloat)->Void)? = nil, disableScroll: Bool = false, forceRefresh: Bool = true, stopScrolling: Binding<Bool> = .constant(false),
         @ViewBuilder content: @escaping () -> Content) {
        self.offset               = offset
        self.localSelection      = localSelection
        self.goToNearestTab      = goToNearestTab
        self.isTouching           = isTouching
        self.nearestTab           = nearestTab
        self.stoppedAccelerating = stoppedAccelerating
        self.onScale              = onScale
        self.animationDuration    = 0.5
        self.content              = content
        self.showsScrollIndicator = showsScrollIndicator
        self.axis                 = axis
        self.disableScroll        = disableScroll
        self.forceRefresh         = forceRefresh
        self.stopScrolling        = stopScrolling
        self.scrollViewController = UIScrollViewController(rootView: self.content(), offset: self.offset, axis: self.axis, onScale: self.onScale)
    }
    
    // MARK: - Updates
    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> UIViewControllerType {
        self.scrollViewController
    }
    


    func updateUIViewController(_ viewController: UIViewControllerType, context: UIViewControllerRepresentableContext<Self>) {
        print("UPDATING THE UI VIEW CONTROLLER")
        //viewController.updateContent()
        viewController.viewDidLoad()
        viewController.scrollView.showsVerticalScrollIndicator   = self.showsScrollIndicator
        viewController.scrollView.showsHorizontalScrollIndicator = self.showsScrollIndicator
        viewController.updateContent(self.content)

        let duration: TimeInterval                = self.duration(viewController)
        var newValue: CGPoint                     = self.offset.wrappedValue
//        DispatchQueue.main.async{
//            newValue.x = 0.1 * newValue.x
//        }
        viewController.scrollView.isScrollEnabled = !self.disableScroll
//        print(newValue.x)
//        print("NEW VALUE X: " + String(Double(newValue.x)))
//        print("VELOCITY: " + String(Double(velocity)))
//        
        if self.stopScrolling.wrappedValue {
            viewController.scrollView.setContentOffset(viewController.scrollView.contentOffset, animated:false)
            return
        }
        
        
        
        guard duration != .zero else {

            viewController.scrollView.contentOffset = newValue
            return
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: [.allowUserInteraction, .curveEaseInOut, .beginFromCurrentState], animations: {
            viewController.scrollView.contentOffset = newValue

        }, completion: nil)
    }
    
    func makeCoordinator() -> Coordinator {

        let coordinator = Coordinator(self.scrollViewController.scrollView, self, offset: self.offset, nearestTab: self.nearestTab, goToNearestTab: self.goToNearestTab, isTouching: self.isTouching, stoppedAccelerating: self.stoppedAccelerating)
//        var tapGestureRecognizer = UITapGestureRecognizer(target: coordinator, action: #selector(coordinator.handleTap))
//        tapGestureRecognizer.numberOfTapsRequired = 1
//        tapGestureRecognizer.isEnabled = true
//        tapGestureRecognizer.cancelsTouchesInView = false
//        self.scrollViewController.scrollView.addGestureRecognizer(tapGestureRecognizer)
        return coordinator
    }

    
    //Calcaulte max offset
    private func newContentOffset(_ viewController: UIViewControllerType, newValue: CGPoint) -> CGPoint {
        
        let maxOffsetViewFrame: CGRect = viewController.view.frame
        let maxOffsetFrame: CGRect     = viewController.hostingController.view.frame
        let maxOffsetX: CGFloat        = maxOffsetFrame.maxX - maxOffsetViewFrame.maxX
        let maxOffsetY: CGFloat        = maxOffsetFrame.maxY - maxOffsetViewFrame.maxY
        
        return CGPoint(x: max(-6, min(newValue.x, maxOffsetX)), y: min(newValue.y, maxOffsetY))
    }
    
    //Calculate animation speed
    private func duration(_ viewController: UIViewControllerType) -> TimeInterval {
        
        var diff: CGFloat = 0
        
        switch axis {
            case .horizontal:
                diff = abs(viewController.scrollView.contentOffset.x - self.offset.wrappedValue.x)
            default:
                diff = abs(viewController.scrollView.contentOffset.y - self.offset.wrappedValue.y)
        }
        
        if diff == 0 {
            return .zero
        }
        
        let percentageMoved = diff / UIScreen.main.bounds.height
        
        return self.animationDuration * min(max(TimeInterval(percentageMoved), 0.25), 1)
    }
    
    // MARK: - Equatable
    static func == (lhs: ScrollableView, rhs: ScrollableView) -> Bool {
        return !lhs.forceRefresh && lhs.forceRefresh == rhs.forceRefresh
    }
}

final class UIScrollViewController<Content: View> : UIViewController, ObservableObject {

    // MARK: - Properties
    var offset: Binding<CGPoint>
    var onScale: ((CGFloat)->Void)?
    let hostingController: UIHostingController<Content>
    private let axis: Axis
    lazy var scrollView: UIScrollView = {
        
        let scrollView                                       = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.canCancelContentTouches                   = true
        scrollView.delaysContentTouches                      = true
        scrollView.scrollsToTop                              = false
        scrollView.backgroundColor                           = .clear
        scrollView.decelerationRate                           = .fast


        scrollView.bounces                                   = false
        
        if self.onScale != nil {
            scrollView.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(self.onGesture)))
        }
        
        return scrollView
    }()
    
    @objc func onGesture(gesture: UIPinchGestureRecognizer) {
        self.onScale?(gesture.scale)
    }

    // MARK: - Init
    init(rootView: Content, offset: Binding<CGPoint>, axis: Axis, onScale: ((CGFloat)->Void)?) {
        self.offset                                 = offset
        self.hostingController                      = UIHostingController<Content>(rootView: rootView)
        self.hostingController.view.backgroundColor = .clear
        self.axis                                   = axis
        self.onScale                                = onScale
        super.init(nibName: nil, bundle: nil)

    }

    // MARK: - Update
    func updateContent(_ content: () -> Content) {
//        UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction, .curveEaseInOut, .beginFromCurrentState], animations: {

            print("UPDATING CONTENT")
            self.hostingController.rootView = content()
            self.scrollView.addSubview(self.hostingController.view)
            
            var contentSize: CGSize = self.hostingController.view.intrinsicContentSize
            
            switch self.axis {
            case .vertical:
                contentSize.width = self.scrollView.frame.width
            case .horizontal:
                contentSize.height = self.scrollView.frame.height
            }
            
            self.hostingController.view.frame.size = contentSize
            self.scrollView.contentSize            = contentSize
            self.view.updateConstraintsIfNeeded()
            self.view.layoutIfNeeded()
//        }, completion: nil)
        
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        print("VIEW DID LOAD")
            
            super.viewDidLoad()
            self.view.addSubview(self.scrollView)
            self.createConstraints()
            self.view.setNeedsUpdateConstraints()
            self.view.updateConstraintsIfNeeded()
            self.view.layoutIfNeeded()


    }
    
    // MARK: - Constraints
    fileprivate func createConstraints() {
        NSLayoutConstraint.activate([
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
