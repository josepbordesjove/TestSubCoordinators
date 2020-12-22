//
//  OperationsPresenter.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import Foundation

protocol OperationsSceneDelegate: class {
    func onCalculateResultTapped()
}

protocol OperationsPresenting: AnyObject {
    /* weak */ var ui: OperationsUI? { get set }
    func onCalculateResultTapped()
}

protocol OperationsUI: AnyObject {
}

final class OperationsPresenter {
    struct State {
        var calculatedAmount: Int = 0
    }

    weak var delegate: OperationsSceneDelegate?
    
    weak var ui: OperationsUI?
    
    init() { }
}

extension OperationsPresenter: OperationsPresenting {
    func onCalculateResultTapped() {
        delegate?.onCalculateResultTapped()
    }
}
