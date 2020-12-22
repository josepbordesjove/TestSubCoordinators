//
//  IncrementCounterView.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

protocol IncrementCounterViewDelegate: AnyObject {
    func incrementCounter(by value: Int)
}

final class IncrementCounterView: View {
    weak var delegate: IncrementCounterViewDelegate?
    
    private lazy var incrementCounterButton = UIButton(type: .system).then {
        $0.setTitle("IncrementCounter", for: .normal)
        $0.addTarget(self, action: #selector(incrementCounter), for: .touchUpInside)
    }
    
    // MARK: Setup methods
    
    override func setupView() {
        backgroundColor = .white
        addSubview(incrementCounterButton)
    }

    override func setupConstraints() {
        [incrementCounterButton.constraintCenter()].activateNestedConstraints()
    }
    
    // MARK: Helpers
    
    @objc func incrementCounter() {
        delegate?.incrementCounter(by: Int.random(in: 1...10))
    }
}
