import UIKit

open class ViewController: UIViewController {
    var isFirstViewDidAppearExecuted = false
    var isFirstViewWillAppearExecuted = false
    open var mustHideNavigationBar: Bool?
    
    public static let statusBarAnimationDuration: TimeInterval = 0.3
    
    private var statusBarHidden = false
    private var statusBarStyle: UIStatusBarStyle = .default
    private var statusBarAnimation: UIStatusBarAnimation = .slide
    
    private var originalGestureRecognizerDelegate: UIGestureRecognizerDelegate?
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    public init() { super.init(nibName: nil, bundle: nil) }
    
    open override func loadView() { preconditionFailure("error: type '\(String(describing: self))' does not implement method \(#function)") }
    open override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let navController = self.navigationController, let mustHideNavigationBar = mustHideNavigationBar {
            if mustHideNavigationBar {
                if !navController.isNavigationBarHidden {
                    navController.setNavigationBarHidden(true, animated: animated)
                }
                // Workaround for back swipe gesture of UINavigationController
                // (looks like hidding the navigation or setting back button breaks it)
                originalGestureRecognizerDelegate = navController.interactivePopGestureRecognizer?.delegate
                navController.interactivePopGestureRecognizer?.delegate = nil
            } else {
                if navController.isNavigationBarHidden {
                    navController.setNavigationBarHidden(false, animated: animated)
                }
            }
        }
        
        if !isFirstViewWillAppearExecuted {
            firstViewWillAppear(animated)
            isFirstViewWillAppearExecuted = true
        }
    }
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let navController = self.navigationController else { return }
        if let originalGestureRecognizerDelegate = originalGestureRecognizerDelegate {
            // Workaround for back swipe gesture of UINavigationController
            // (looks like hidding the navigation or setting back button breaks it)
            navController.interactivePopGestureRecognizer?.delegate = originalGestureRecognizerDelegate
        }
    }
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !isFirstViewDidAppearExecuted {
            firstViewDidAppear(animated)
            isFirstViewDidAppearExecuted = true
        }
    }
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    open func firstViewDidAppear(_ animated: Bool) { }
    
    open func firstViewWillAppear(_ animated: Bool) { }
    
    open func setup() { }
}
