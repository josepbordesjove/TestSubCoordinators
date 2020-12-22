//
//  IncrementCounterPresenter.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import Foundation

protocol IncrementCounterSceneDelegate: class {
    func onIncrementCounter(by value: Int)
}

protocol IncrementCounterPresenting: AnyObject {
    /* weak */ var ui: IncrementCounterUI? { get set }
    func onIncrementCounter(by value: Int)
}

protocol IncrementCounterUI: AnyObject { }

final class IncrementCounterPresenter {
    weak var delegate: IncrementCounterSceneDelegate?
    
    weak var ui: IncrementCounterUI?
    
    init() { }
}

extension IncrementCounterPresenter: IncrementCounterPresenting {
    func onIncrementCounter(by value: Int) {
        delegate?.onIncrementCounter(by: value)
    }
}
