//
//  OperationsViewController.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

final class OperationsViewController: ViewController {
    public var containerStackView: UIStackView { self.mainView.stackView }
    private let mainView = OperationsView()
    private let presenter: OperationsPresenting
    
    init(presenter: OperationsPresenting) {
        self.presenter = presenter
        super.init()
        presenter.ui = self
    }
    
    override func loadView() {
        view = mainView
        mainView.delegate = self
    }
}

extension OperationsViewController: OperationsViewDelegate {
    func calculateResultTapped() {
        presenter.onCalculateResultTapped()
    }
}

extension OperationsViewController: OperationsUI { }
