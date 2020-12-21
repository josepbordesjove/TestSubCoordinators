//
//  IncrementCounterPresenter.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import Foundation

protocol IncrementCounterSceneDelegate: class {}

protocol IncrementCounterPresenting: AnyObject {
    /* weak */ var ui: IncrementCounterUI? { get set }
}

protocol IncrementCounterUI: AnyObject { }

final class IncrementCounterPresenter {
    weak var delegate: IncrementCounterSceneDelegate?
    
    weak var ui: IncrementCounterUI?
    
    init() { }
}

extension IncrementCounterPresenter: IncrementCounterPresenting { }
