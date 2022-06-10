//
//  CharityEventsHeaderView.swift
//  oneTask
//
//  Created by Максим Клочков on 05.05.2022.
//

import UIKit

class CharityEventsHeaderView: UICollectionReusableView {
    
    private let currentButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("сhildrenCurrentButton", comment: ""), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .leaf
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let completeButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("сhildrenCompletedButton", comment: ""), for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.leaf, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.leaf.cgColor
        button.layer.cornerRadius = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 0
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        self.backgroundColor = .white
        [buttonHorizontalStack].forEach({ self.addSubview($0) })
        [currentButton, completeButton].forEach({self.buttonHorizontalStack.addArrangedSubview($0)})

        let offsetTopBottom: CGFloat = 16

        NSLayoutConstraint.activate([
            buttonHorizontalStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonHorizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: offsetTopBottom),
            buttonHorizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -offsetTopBottom)
        ])
    }
}
