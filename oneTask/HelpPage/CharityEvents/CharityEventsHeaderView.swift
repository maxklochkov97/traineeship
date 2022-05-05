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
        //button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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
        //button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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

        //[completeButton].forEach({ self.addSubview($0) })
        
        let offsetTopBottom: CGFloat = 16
        let offsetSides: CGFloat = 10

        NSLayoutConstraint.activate([
            //buttonHorizontalStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonHorizontalStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonHorizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            buttonHorizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            //buttonHorizontalStack.widthAnchor.constraint(equalToConstant: 200)


        ])
    }
}
