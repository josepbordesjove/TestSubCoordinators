//
//  OperationsCoordinator.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

final class OperationsCoordinator: Coordinator {
    weak var navigationController: UINavigationController?
    
    init(from navigationController: UINavigationController) {
        self.navigationController = navigationController

        let transition = ControllerTransitionStyle.Pushing(fromNavigationController: navigationController)
        super.init(transition: .push(transition))
    }
    
    override func start() {
        let presenter = OperationsPresenter()
        presenter.delegate = self
        
        let ui = OperationsViewController(presenter: presenter)
        transition?.show(controller: ui, animated: true)
    }
}

// MARK:

extension OperationsCoordinator: OperationsSceneDelegate {
    func onCalculateResultTapped() {
        guard let navigationController = transition?.pushing?.fromNavigationController else { return }
        let basicInfoCoordinator = ResultCounterCoordinator(from: navigationController)
        addChild(basicInfoCoordinator, starting: true)
    }
}

