import UIKit 



open class Coordinator: NSObject {
    public private(set) var children = [Coordinator]()
    /// Transition for this coordinator. It may be nil if the coordinator is not showing nothing by itself but handling some other coordinators. Otherwise it may have a transition style here that will be use for showing the controller.
    public let transition: ControllerTransitionStyle?
    private weak var parent: Coordinator?
    private var isFinishing: Bool = false

    public init(transition: ControllerTransitionStyle? = nil) {
        self.transition = transition
    }
    
    open func start() {
        fatalError("\(#function) on \(type(of: self)) hasn't been implemented yet, please do so in your subclass before invoking it")
    }
    
    public func finish(animated: Bool = true, completion: (() -> Void)? = nil) {
        let selfHasTransition = transition != nil
        let coordinatorPerformingHide: Coordinator
        if let firstChildren = children.first,
            let modalChild = getFirstModalPresentationCoordinatorIfAny(from: firstChildren) {
            coordinatorPerformingHide = modalChild
        } else if !selfHasTransition,
            let firstChildren = children.first,
            let firstChildWithTransition = getFirstChildWithTransitionIfAny(from: firstChildren) {
            coordinatorPerformingHide = firstChildWithTransition
        } else {
            coordinatorPerformingHide = self
        }

        performHideTransition(on: coordinatorPerformingHide, animated: animated) { [weak self] in
            completion?()
            self?.remove()
        }
    }
    
    public func addChild(_ child: Coordinator, starting: Bool = false) {
        children.append(child)
        child.parent = self

        if starting {
            child.start()
        }
    }
}

// MARK: - Helpers

extension Coordinator {
    private func getFirstChildWithTransitionIfAny(from coordinator: Coordinator) -> Coordinator? {
        if coordinator.transition != nil, !coordinator.isFinishing {
            return coordinator
        } else {
            return getFirstChildWithTransition(from: coordinator.children)
        }
    }

    private func getFirstChildWithTransition(from children: [Coordinator]) -> Coordinator? {
        children.compactMap(getFirstChildWithTransitionIfAny).first
    }

    private func getFirstModalPresentationCoordinatorIfAny(from coordinator: Coordinator) -> Coordinator? {
        if coordinator.transition?.isPresentation ?? false, !coordinator.isFinishing {
            return coordinator
        } else {
            return getModalTransitionCoordinator(from: coordinator.children)
        }
    }

    private func getModalTransitionCoordinator(from children: [Coordinator]) -> Coordinator? {
        children.compactMap(getFirstModalPresentationCoordinatorIfAny).first
    }

    private func performHideTransition(on coordinator: Coordinator, animated: Bool, completion: (() -> Void)?) {
        coordinator.isFinishing = true
        
        if let transition = coordinator.transition {
            transition.hide(animated: animated, completion: completion)
        } else {
            completion?()
        }
    }

    private func remove() {
        children.forEach { $0.remove() }
        parent?.removeChild(self)
        parent = nil
    }
    
    private func removeChild(_ coordinator: Coordinator) {
        children.removeAll(where: { $0 === coordinator })
    }
}
