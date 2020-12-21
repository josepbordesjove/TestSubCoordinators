//
//  ResultCounterView.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

protocol ResultCounterViewDelegate: AnyObject { }

final class ResultCounterView: View {
    weak var delegate: ResultCounterViewDelegate?
    
    private lazy var ResultCounterButton = UILabel().then {
        $0.text = "TODO: Calculate the result"
    }
    
    // MARK: Setup methods
    
    override func setupView() {
        backgroundColor = .white
        addSubview(ResultCounterButton)
    }

    override func setupConstraints() {
        [ResultCounterButton.constraintCenter()].activateNestedConstraints()
    }
}
