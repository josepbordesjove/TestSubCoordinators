//
//  OperationsView.swift
//  TestSubCoordinators
//
//  Created by Josep Bordes on 21/12/20.
//

import UIKit

protocol OperationsViewDelegate: AnyObject {
    func calculateResultTapped()
}

final class OperationsView: View {
    private enum Constants {
        enum StackView {
            static let spacing: CGFloat = 10
        }
    }

    private(set) lazy var stackView = UIStackView().then {
        $0.alignment = .fill
        $0.distribution = .fill
        $0.axis = .vertical
        $0.spacing = Constants.StackView.spacing
    }
    
    private var button = UIButton(type: .system).then {
        $0.setTitle("Calculate result", for: .normal)
        $0.addTarget(self, action: #selector(calculateResultTapped), for: .touchUpInside)
    }
   
    weak var delegate: OperationsViewDelegate?
   
    override func setupView() {
        backgroundColor = .white
        [stackView, button].forEach(addSubview)
    }

    override func setupConstraints() {
        [button.constraintCenter()].activateNestedConstraints()
    }
}

extension OperationsView {
    @objc private func calculateResultTapped() {
        delegate?.calculateResultTapped()
    }
}
