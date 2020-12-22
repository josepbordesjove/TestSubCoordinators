//
//  OperationsCoordinator.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

final class OperationsCoordinator: Coordinator {
    internal var subcoordinators: [OperationsSubCoordinator] = []
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
        
        addSubCoordinators(to: ui.containerStackView, parentController: ui)
    }
    
    private func addSubCoordinators(to containerView: UIStackView, parentController: UIViewController) {
        let basicInformationCoordinator = BasicInfoCoordinator(
            fromController: parentController,
            containerView: containerView)

        let incrementCounterCoordinator = IncrementCounterCoordinator(
            fromController: parentController,
            containerView: containerView,
            onIncrementCounter: subcoordinators.incrementCounter)
        
        [
            .basicInfo(basicInformationCoordinator),
            .incrementCounter(incrementCounterCoordinator)
        ].forEach { subcoordinators.append($0) }
        subcoordinators.addAndStart(to: self)
    }
}

// MARK: OperationsSceneDelegate

extension OperationsCoordinator: OperationsSceneDelegate {
    func onCalculateResultTapped() {
        guard let navigationController = transition?.pushing?.fromNavigationController else { return }
        let basicInfoCoordinator = ResultCounterCoordinator(from: navigationController)
        addChild(basicInfoCoordinator, starting: true)
    }
}
