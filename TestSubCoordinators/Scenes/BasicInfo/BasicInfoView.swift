//
//  BasicInfoView.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

protocol BasicInfoViewDelegate: AnyObject { }

final class BasicInfoView: View {
    weak var delegate: BasicInfoViewDelegate?
    
    private lazy var counterLabel = UILabel().then {
        $0.text = "Counter is empty"
    }
    
    // MARK: Setup methods
    
    override func setupView() {
        backgroundColor = .white
        addSubview(counterLabel)
    }

    override func setupConstraints() {
        [counterLabel.constraintCenter()].activateNestedConstraints()
    }
    
    func setCounter(to value: Int) {
        counterLabel.text = "\(value)"
    }
}
