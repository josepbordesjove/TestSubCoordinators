//
//  ResultCounterCoordinator.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

final class ResultCounterCoordinator: Coordinator {
    weak var navigationController: UINavigationController?
    
    init(from navigationController: UINavigationController) {
        self.navigationController = navigationController

        let transition = ControllerTransitionStyle.Pushing(fromNavigationController: navigationController)
        super.init(transition: .push(transition))
    }
    
    override func start() {
        let presenter = ResultCounterPresenter()
        presenter.delegate = self
        
        let ui = ResultCounterViewController(presenter: presenter)
        transition?.show(controller: ui, animated: true)
    }
}

// MARK:

extension ResultCounterCoordinator: ResultCounterSceneDelegate { }

