//
//  IncrementCounterView.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

protocol IncrementCounterViewDelegate: AnyObject { }

final class IncrementCounterView: View {
    weak var delegate: IncrementCounterViewDelegate?
    
    private lazy var incrementCounterButton = UIButton(type: .system).then {
        $0.setTitle("IncrementCounter", for: .normal)
    }
    
    // MARK: Setup methods
    
    override func setupView() {
        backgroundColor = .white
        addSubview(incrementCounterButton)
    }

    override func setupConstraints() {
        [incrementCounterButton.constraintCenter()].activateNestedConstraints()
    }
}
