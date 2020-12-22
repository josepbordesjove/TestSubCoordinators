//
//  BasicInfoPresenter.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import Foundation

protocol BasicInfoSceneDelegate: class {}

protocol BasicInfoPresenting: AnyObject {
    /* weak */ var ui: BasicInfoUI? { get set }
    func setCounter(to value: Int)
}

protocol BasicInfoUI: AnyObject {
    func setCounter(to value: Int)
}

final class BasicInfoPresenter {
    weak var delegate: BasicInfoSceneDelegate?
    
    weak var ui: BasicInfoUI?
    
    init() { }
    
    func setCounter(to value: Int) {
        ui?.setCounter(to: value)
    }
}

extension BasicInfoPresenter: BasicInfoPresenting { }
