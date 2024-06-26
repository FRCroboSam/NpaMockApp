import UIKit
import SwiftUI
//dont think this is used
class UIScrollViewViewController: UIViewController {
    lazy var scrollView: UIScrollView = {
        let v = UIScrollView()
        v.isPagingEnabled = false
        v.alwaysBounceVertical = true
        
        return v
    }()
    


    var hostingController: UIHostingController<AnyView> = UIHostingController(rootView: AnyView(EmptyView()))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.scrollView)
        self.pinEdges(of: self.scrollView, to: self.view)

        self.hostingController.willMove(toParent: self)
        self.scrollView.addSubview(self.hostingController.view)
        self.pinEdges(of: self.hostingController.view, to: self.scrollView)
        self.hostingController.didMove(toParent: self)

    }

    func pinEdges(of viewA: UIView, to viewB: UIView) {
        viewA.translatesAutoresizingMaskIntoConstraints = false
        viewB.addConstraints([
        viewA.leadingAnchor.constraint(equalTo: viewB.leadingAnchor),
        viewA.trailingAnchor.constraint(equalTo: viewB.trailingAnchor),
        viewA.topAnchor.constraint(equalTo: viewB.topAnchor),
        viewA.bottomAnchor.constraint(equalTo: viewB.bottomAnchor),
        ])
    }

}

struct UIScrollViewWrapper<Content: View>: UIViewControllerRepresentable {
    
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    func makeUIViewController(context: Context) -> UIScrollViewViewController {
        let vc = UIScrollViewViewController()
        vc.hostingController.rootView = AnyView(self.content())
        return vc
    }
    
    func updateUIViewController(_ viewController: UIScrollViewViewController, context: Context) {
        viewController.hostingController.rootView = AnyView(self.content())
    }
}
