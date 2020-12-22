//
//  OperationsCoordinator+Subcoordinators.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 22/12/20.
//

import Foundation

protocol SceneCoordinatorsValuesUpdater {
    func incrementCounter(by value: Int)
}

extension OperationsCoordinator {
    enum OperationsSubCoordinator: SceneCoordinatorsValuesUpdater {
        case incrementCounter(IncrementCounterCoordinator)
        case basicInfo(BasicInfoCoordinator)
        
        func incrementCounter(by value: Int) {
            switch self {
            case .incrementCounter:
                break
            case .basicInfo(let coordinator):
                coordinator.setCounter(to: value)
            }
        }
        
        func addCoordinator(to parent: Coordinator, starting: Bool) {
            switch self {
            case .incrementCounter(let coordinator):
                parent.addChild(coordinator, starting: starting)
            case .basicInfo(let coordinator):
                parent.addChild(coordinator, starting: starting)
            }
        }
    }
}

// MARK: SceneCoordinatorsValuesUpdater

extension OperationsCoordinator: SceneCoordinatorsValuesUpdater {
    func incrementCounter(by value: Int) {
        subcoordinators.incrementCounter(by: value)
    }
}

extension Array where Element == OperationsCoordinator.OperationsSubCoordinator {
    func addAndStart(to parent: Coordinator) {
        forEach { $0.addCoordinator(to: parent, starting: true) }
    }
    
    func incrementCounter(by value: Int) {
        forEach { $0.incrementCounter(by: value) }
    }
}
