import UIKit

// Credits to https://github.com/Machipla/SugarLumpUIKit/blob/master/Sources/UINavigationController/NavigationController%2BTransitions.swift
extension UINavigationController {
    public var onTransitionFromController: UIViewController? {  transitionCoordinator?.viewController(forKey: .from) }
    public var isOnPopTransition: Bool {
        guard !viewControllers.isEmpty, let fromController = onTransitionFromController, !viewControllers.contains(fromController) else { return false }
        return true
    }
    
    public func pushViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        pushViewController(viewController, animated: animated)
        handleTransition(animated: animated, completion: completion)
    }
    
    public func popViewController(animated: Bool, completion: (() -> Void)?) {
        popViewController(animated: animated)
        handleTransition(animated: animated, completion: completion)
    }
    
    public func popToViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        popToViewController(viewController, animated: animated)
        handleTransition(animated: animated, completion: completion)
    }
    
    public func popToRootViewController(animated: Bool, completion:(() -> Void)?) {
        popToRootViewController(animated: animated)
        handleTransition(animated: animated, completion: completion)
    }
}

extension UINavigationController {
    private func handleTransition(animated: Bool, completion:(() -> Void)?) {
        guard animated, let coordinator = transitionCoordinator else {
            completion?()
            return
        }
        
        coordinator.animate(alongsideTransition: nil) { _ in completion?() }
    }
}
