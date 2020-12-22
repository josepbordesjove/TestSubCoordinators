//
//  BasicInfoCoordinator.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

final class BasicInfoCoordinator: Coordinator {
    weak var navigationController: UINavigationController?
    var presenter: BasicInfoPresenting?
    
    init(from navigationController: UINavigationController) {
        self.navigationController = navigationController

        let transition = ControllerTransitionStyle.Pushing(fromNavigationController: navigationController)
        super.init(transition: .push(transition))
    }
    
    init(fromController: UIViewController, containerView: UIStackView) {
        super.init(transition: .stackedChild(fromController: fromController, containerStack: containerView, at: 0))
    }
    
    override func start() {
        let presenter = BasicInfoPresenter()
        presenter.delegate = self
        
        self.presenter = presenter
        
        let ui = BasicInfoViewController(presenter: presenter)
        transition?.show(controller: ui, animated: true)
    }
    
    public func setCounter(to value: Int) {
        presenter?.setCounter(to: value)
    }
}

// MARK:

extension BasicInfoCoordinator: BasicInfoSceneDelegate { }

