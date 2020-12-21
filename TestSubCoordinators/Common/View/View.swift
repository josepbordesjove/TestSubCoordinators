import UIKit

public protocol ViewDelegate: class { }

open class View: UIView {
    struct Constraint {
        struct Keyboard {
            static let keyboardAnimationTime = 0.2
            static let keyboardDelayTime = 0.1
        }
    }

    public static var statusBarHeight: CGFloat {
        let height = View.realStatusBarHeight
        if #available(iOS 14.0, *) {
            return height
        }
        if height == 40 {
            // If it's 40, the status bar it's on extended mode, so we don't have to count with its height.
            // Extended mode is a case when during a call status bar has double the height (for example on iPhone 5s).
            return 0
        }
        return height
    }

    private static var realStatusBarHeight: CGFloat {
        UIApplication.shared.statusBarFrame.size.height
    }
    
    private var initialContentInsetBottom: CGFloat?
    
    // MARK: - Init
    
    @available(*, unavailable)
    override init(frame: CGRect) { fatalError("\(#function) has not been implemented") }
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) { fatalError("\(#function) has not been implemented") }

    public init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    // MARK: - Setup
    
    open func setup() {
        backgroundColor = .white
        setupView()
        setupConstraints()
    }
    open func setupView() { }
    open func setupConstraints() { }
}
