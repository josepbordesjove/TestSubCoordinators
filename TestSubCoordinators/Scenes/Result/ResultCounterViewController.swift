//
//  ResultCounterViewController.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

final class ResultCounterViewController: ViewController {
    private let mainView = ResultCounterView()
    private let presenter: ResultCounterPresenting
    
    init(presenter: ResultCounterPresenting) {
        self.presenter = presenter
        super.init()
        presenter.ui = self
    }
    
    override func loadView() {
        view = mainView
        mainView.delegate = self
    }
}

extension ResultCounterViewController: ResultCounterViewDelegate { }

extension ResultCounterViewController: ResultCounterUI { }
