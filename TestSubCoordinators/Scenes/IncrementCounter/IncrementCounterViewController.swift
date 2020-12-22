//
//  IncrementCounterViewController.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

final class IncrementCounterViewController: ViewController {
    private let mainView = IncrementCounterView()
    private let presenter: IncrementCounterPresenting
    
    init(presenter: IncrementCounterPresenting) {
        self.presenter = presenter
        super.init()
        presenter.ui = self
    }
    
    override func loadView() {
        view = mainView
        mainView.delegate = self
    }
}

extension IncrementCounterViewController: IncrementCounterViewDelegate {
    func incrementCounter(by value: Int) {
        presenter.onIncrementCounter(by: value)
    }
}

extension IncrementCounterViewController: IncrementCounterUI { }
