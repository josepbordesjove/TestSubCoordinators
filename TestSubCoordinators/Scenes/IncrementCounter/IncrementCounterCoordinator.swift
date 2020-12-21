//
//  IncrementCounterCoordinator.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

final class IncrementCounterCoordinator: Coordinator {
    weak var navigationController: UINavigationController?
    
    init(from navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        let transition = ControllerTransitionStyle.Pushing(fromNavigationController: navigationController)
        super.init(transition: .push(transition))
    }
    
    init(fromController: UIViewController, containerView: UIView) {
        let child = ControllerTransitionStyle.Child(fromController: fromController,
                                                    containerView: containerView,
                                                    constraintHandler: { childView, _ in
                                                        [childView.constraintEdges()].activateNestedConstraints()
                                                    })
        super.init(transition: .child(child))
    }
    
    override func start() {
        let presenter = IncrementCounterPresenter()
        presenter.delegate = self
        
        let ui = IncrementCounterViewController(presenter: presenter)
        transition?.show(controller: ui, animated: true)
    }
}

// MARK:

extension IncrementCounterCoordinator: IncrementCounterSceneDelegate { }

