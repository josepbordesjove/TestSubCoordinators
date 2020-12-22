//
//  RootCoordinator.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

final class RootCoordinator: Coordinator {
    init(fromWindow: UIWindow) {
        let custom = ControllerTransitionStyle.CustomShowMode(show: { (controller, animated, completion) in
            fromWindow.rootViewController = controller
            fromWindow.makeKeyAndVisible()
            completion?()
        }, hide: { _, _, _ in fatalError("This shouldn't be called since main window should always be visible") })
        super.init(transition: .custom(custom))
    }
    
    override func start() {
        let rootNavigationController = UINavigationController()
        transition?.show(controller: rootNavigationController, animated: false, completion: {
            let operationsCoordinator = OperationsCoordinator(from: rootNavigationController)
            self.addChild(operationsCoordinator, starting: true)
        })
    }
}
