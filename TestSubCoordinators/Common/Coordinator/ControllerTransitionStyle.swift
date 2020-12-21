import UIKit

public enum ControllerTransitionStyle {
    public final class Presentation {
        public weak var fromController: UIViewController!
        public let transitionStyle: UIModalTransitionStyle?
        public fileprivate(set) weak var presentedController: UIViewController?

        public init(fromController: UIViewController,
                    transitionStyle: UIModalTransitionStyle? = nil) {
            self.fromController = fromController
            self.transitionStyle = transitionStyle
        }
    }

    public final class Pushing {
        public weak var fromNavigationController: UINavigationController!
        public fileprivate(set) weak var pushedController: UIViewController?

        public init(fromNavigationController: UINavigationController) {
            self.fromNavigationController = fromNavigationController
        }
    }

    public final class CustomShowMode {
        public typealias CompletionHandler = () -> Void
        public typealias TransitionClosure = (_ fromController: UIViewController, _ animated: Bool, _ completion: CompletionHandler?) -> Void
        public let show: TransitionClosure
        public let hide: TransitionClosure
        weak var shownController: UIViewController?

        public init(show: @escaping TransitionClosure,
                    hide: @escaping TransitionClosure) {
            self.show = show
            self.hide = hide
        }
    }

    public final class Child {
        public typealias AnimationsClosure = (_ childView: UIView, _ containerView: UIView, _ completion: @escaping () -> Void) -> Void
        public typealias ConstraintsClosure = (_ childView: UIView, _ containerView: UIView) -> Void

        public weak var fromController: UIViewController!
        public weak var containerView: UIView!
        public weak var childController: UIViewController?

        public let showAnimations: AnimationsClosure?
        public let dismissAnimations: AnimationsClosure?
        public let constraintHandler: ConstraintsClosure

        public var isShowAnimated: Bool { return showAnimations != nil }
        public var isDismissAnimated: Bool { return dismissAnimations != nil }

        public init(fromController: UIViewController,
                    childController: UIViewController? = nil,
                    containerView: UIView,
                    showAnimations: AnimationsClosure? = nil,
                    dismissAnimations: AnimationsClosure? = nil,
                    constraintHandler: @escaping ConstraintsClosure) {
            self.fromController = fromController
            self.childController = childController
            self.containerView = containerView
            self.showAnimations = showAnimations
            self.dismissAnimations = dismissAnimations
            self.constraintHandler = constraintHandler
        }
    }

    case present(Presentation)
    case push(Pushing)
    case custom(CustomShowMode)
    case child(Child)

    public var isPresentation: Bool {
        guard case .present = self else { return false }
        return true
    }

    public var pushing: Pushing? {
        guard case .push(let pushing) = self else { return nil }
        return pushing
    }

    public var presentation: Presentation? {
        guard case .present(let presentation) = self else { return nil }
        return presentation
    }

    public var child: Child? {
        guard case .child(let child) = self else { return nil }
        return child
    }
}

// MARK: - Builders

extension ControllerTransitionStyle {
    public static func stackedChild(fromController: UIViewController,
                                    containerStack: UIStackView,
                                    at index: Int) -> ControllerTransitionStyle {
        let customStackedChild = ControllerTransitionStyle.CustomShowMode(show: { childController, _, completion in
            guard containerStack.isDescendant(of: fromController.view) else { return }

            childController.willMove(toParent: fromController)
            childController.beginAppearanceTransition(true, animated: false)
            fromController.addChild(childController)
            containerStack.insertArrangedSubview(childController.view, at: index)
            childController.didMove(toParent: fromController)
            completion?()
        }, hide: { childController, _, completion in
            childController.willMove(toParent: nil)
            childController.beginAppearanceTransition(false, animated: false)
            containerStack.removeArrangedSubviewFromSuperview(childController.view)
            childController.removeFromParent()
            childController.didMove(toParent: nil)
            completion?()
        })

        return .custom(customStackedChild)
    }
}

// MARK: - Public

extension ControllerTransitionStyle {
    public func show(controller: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        switch self {
        case .present(let presentation): presentController(presentation: presentation, controller: controller, animated: animated, completion: completion)
        case .push(let pushing): pushController(pushing: pushing, controller: controller, animated: animated, completion: completion)
        case .custom(let showMode): customShow(showMode: showMode, controller: controller, animated: animated, completion: completion)
        case .child(let childish): showChild(childish: childish, controller: controller, completion: completion)
        }
    }

    public func hide(animated: Bool, completion: (() -> Void)? = nil) {
        switch self {
        case .present(let presentation): dismissController(presentation: presentation, animated: animated, completion: completion)
        case .push(let pushing): popController(pushing: pushing, animated: animated, completion: completion)
        case .custom(let showMode): customHide(showMode: showMode, animated: animated, completion: completion)
        case .child(let childish): dismissChild(childish: childish, completion: completion)
        }
    }
}

// MARK: - Helpers

extension ControllerTransitionStyle {
    private func presentController(presentation: Presentation, controller: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        if let transitionStyle = presentation.transitionStyle {
            controller.modalTransitionStyle = transitionStyle
        }

        presentation.fromController.present(controller, animated: animated) {
            presentation.presentedController = controller
            completion?()
        }
    }

    private func pushController(pushing: Pushing, controller: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        pushing.fromNavigationController.pushViewController(controller, animated: animated) {
            pushing.pushedController = controller
            completion?()
        }
    }

    private func customShow(showMode: CustomShowMode, controller: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        showMode.show(controller, animated, completion)
        showMode.shownController = controller
    }

    private func showChild(childish: Child, controller: UIViewController, completion: (() -> Void)? = nil) {
        guard childish.containerView.isDescendant(of: childish.fromController.view) else { return }

        controller.willMove(toParent: childish.fromController)
        controller.beginAppearanceTransition(true, animated: childish.isShowAnimated)
        childish.fromController.addChild(controller)
        childish.containerView.addSubview(controller.view)

        let finishHandler = {
            controller.didMove(toParent: childish.fromController)
            childish.childController = controller
        }

        childish.constraintHandler(controller.view, childish.containerView)
        if childish.isShowAnimated {
            childish.showAnimations?(controller.view, childish.containerView, finishHandler)
        } else {
            finishHandler()
        }
    }

    private func dismissController(presentation: Presentation, animated: Bool, completion: (() -> Void)? = nil) {
        let completion = {
            presentation.presentedController = nil
            completion?()
        }

        if presentation.presentedController?.presentingViewController != nil {
            presentation.presentedController?.dismiss(animated: animated, completion: completion)
        } else {
            completion()
        }
    }

    private func popController(pushing: Pushing, animated: Bool, completion: (() -> Void)? = nil) {
        guard let pushedController = pushing.pushedController,
            let pushedControllerIndex = pushing.fromNavigationController.viewControllers.firstIndex(where: { $0 === pushedController }),
            let previousController = pushing.fromNavigationController.viewControllers[ifExists: pushedControllerIndex - 1] else {
            completion?()
            return
        }

        pushing.fromNavigationController.popToViewController(previousController, animated: animated) {
            pushing.pushedController = nil
            completion?()
        }
    }

    private func customHide(showMode: CustomShowMode, animated: Bool, completion: (() -> Void)? = nil) {
        guard let shownController = showMode.shownController else { return }
        showMode.hide(shownController, animated, completion)
    }

    private func dismissChild(childish: Child, completion: (() -> Void)? = nil) {
        childish.childController?.willMove(toParent: nil)
        childish.childController?.beginAppearanceTransition(false, animated: childish.isDismissAnimated)

        let finishHandler = {
            childish.childController?.view.removeFromSuperview()
            childish.childController?.removeFromParent()
            childish.childController?.didMove(toParent: nil)
            completion?()
        }

        if childish.isDismissAnimated, let childView = childish.childController?.view {
            childish.dismissAnimations?(childView, childish.containerView, finishHandler)
        } else {
            finishHandler()
        }
    }
}
