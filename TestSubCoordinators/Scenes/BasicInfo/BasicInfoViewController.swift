//
//  BasicInfoViewController.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

final class BasicInfoViewController: ViewController {
    private let mainView = BasicInfoView()
    private let presenter: BasicInfoPresenting
    
    init(presenter: BasicInfoPresenting) {
        self.presenter = presenter
        super.init()
        presenter.ui = self
    }
    
    override func loadView() {
        view = mainView
        mainView.delegate = self
    }
}

extension BasicInfoViewController: BasicInfoViewDelegate { }

extension BasicInfoViewController: BasicInfoUI { }
