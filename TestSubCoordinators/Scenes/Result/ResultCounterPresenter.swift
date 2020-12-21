//
//  ResultCounterPresenter.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import Foundation

protocol ResultCounterSceneDelegate: class {}

protocol ResultCounterPresenting: AnyObject {
    /* weak */ var ui: ResultCounterUI? { get set }
}

protocol ResultCounterUI: AnyObject { }

final class ResultCounterPresenter {
    weak var delegate: ResultCounterSceneDelegate?
    
    weak var ui: ResultCounterUI?
    
    init() { }
}

extension ResultCounterPresenter: ResultCounterPresenting { }
