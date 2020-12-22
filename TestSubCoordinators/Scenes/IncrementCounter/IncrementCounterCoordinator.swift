//
//  IncrementCounterCoordinator.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

final class IncrementCounterCoordinator: Coordinator {
    weak var navigationController: UINavigationController?
    var onIncrementCounter: (Int) -> Void
    
    init(from navigationController: UINavigationController, onIncrementCounter: @escaping (Int) -> Void) {
        self.navigationController = navigationController
        self.onIncrementCounter = onIncrementCounter
        let transition = ControllerTransitionStyle.Pushing(fromNavigationController: navigationController)
        super.init(transition: .push(transition))
    }
    
    init(fromController: UIViewController, containerView: UIStackView, onIncrementCounter: @escaping (Int) -> Void) {
        self.onIncrementCounter = onIncrementCounter
        super.init(transition: .stackedChild(fromController: fromController, containerStack: containerView, at: 0))
    }
    
    override func start() {
        let presenter = IncrementCounterPresenter()
        presenter.delegate = self
        
        let ui = IncrementCounterViewController(presenter: presenter)
        transition?.show(controller: ui, animated: true)
    }
}

// MARK: IncrementCounterSceneDelegate

extension IncrementCounterCoordinator: IncrementCounterSceneDelegate {
    func onIncrementCounter(by value: Int) {
        onIncrementCounter(value)
    }
}
