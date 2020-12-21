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
}

protocol BasicInfoUI: AnyObject { }

final class BasicInfoPresenter {
    weak var delegate: BasicInfoSceneDelegate?
    
    weak var ui: BasicInfoUI?
    
    init() { }
}

extension BasicInfoPresenter: BasicInfoPresenting { }
