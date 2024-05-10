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
                
        var isDecelerating = false
        
        var isGoingBack = false
        
        var lastOffsetX = 0.0
        var velocityStreak = 0
        
        @objc func viewTap() {
            print("Tap gesture executed")
        }

        // MARK: - Init
        init(_ scrollView: UIScrollView, _ scrollableView: ScrollableView, offset: Binding<CGPoint>, goToNearestTab: Binding<Bool>) {
            self.scrollView          = scrollView
            self.offset              = offset
            self.goToNearestTab      = goToNearestTab
            self.scrollableView      = scrollableView
            super.init()
            self.scrollView.delegate = self
        }
        
        // MARK: - UIScrollViewDelegate
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            // user just released their finger, find the nearest offset (0 for now)
            let velocity = abs(offset.wrappedValue.x - lastOffsetX)
            if(velocity < 1){
                velocityStreak += 1
            }
            else{
                velocityStreak = 0
            }
            
            if(velocity > 2 && goToNearestTab.wrappedValue == true){
                //goToNearestTab.wrappedValue = false
            }
            

            if(scrollView.isTracking){
                print("USER IS SCROLLING")
                DispatchQueue.main.async{
                    
//                    self.offset.wrappedValue.x = scrollView.contentOffset.x
                    self.offset.wrappedValue.x = scrollView.contentOffset.x

                }
            }
            else{
                    print("NOT SCROLLING")
                    DispatchQueue.main.async{
                        self.offset.wrappedValue.x = scrollView.contentOffset.x
                    }
                
            }
            
            print("VELOCITYL " + String(Double(velocity)))
//            if(!goToNearestTab.wrappedValue && velocityStreak >= 5 && !scrollView.isTracking){
//                velocityStreak = 0
//                DispatchQueue.main.async{
//                    print("ACTUALLY GOING TO NEAREST TAB")
//
//                    self.goToNearestTab.wrappedValue = true
//                }
//            }
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
            goToNearestTab.wrappedValue = true

//            if(!scrollView.isTracking){
//                self.offset.wrappedValue.x = 0
//            }
            if(!scrollView.isTracking){
                //goToNearestTab.wrappedValue = true
            }

        }

        func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
            isDecelerating = true
            lastOffsetX = scrollView.contentOffset.x
            print("STARTING DECELERATION: " + String(lastOffsetX))

        }
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            if(abs(velocity.x) < 2){
                print("DRAG END VLEOCITY: " + String(Double(velocity.x)))
                goToNearestTab.wrappedValue = true
            }
            
        }
    }
    
    // MARK: - Type
    typealias UIViewControllerType = UIScrollViewController<Content>
    
    // MARK: - Properties
     var offset: Binding<CGPoint>
     var localSelection: Binding<Int>
    var goToNearestTab: Binding<Bool>


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
    
    
    @State var lastXOffset = 0.0
    private let scrollViewController: UIViewControllerType

    // MARK: - Init
    init(_ offset: Binding<CGPoint>, localSelection: Binding<Int>, goToNearestTab: Binding<Bool>, animationDuration: TimeInterval, showsScrollIndicator: Bool = false, axis: Axis = .horizontal, onScale: ((CGFloat)->Void)? = nil, disableScroll: Bool = false, forceRefresh: Bool = true, stopScrolling: Binding<Bool> = .constant(false),
         @ViewBuilder content: @escaping () -> Content) {
        self.offset               = offset
        self.localSelection      = localSelection
        self.goToNearestTab      = goToNearestTab
        self.onScale              = onScale
        self.animationDuration    = 1.0
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
        let newValue: CGPoint                     = self.offset.wrappedValue
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

        let coordinator = Coordinator(self.scrollViewController.scrollView, self, offset: self.offset, goToNearestTab: self.goToNearestTab)
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
        
        return CGPoint(x: min(newValue.x, maxOffsetX), y: min(newValue.y, maxOffsetY))
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