//
//  Header.swift
//  oneTask
//
//  Created by Максим Клочков on 18.05.2022.
//

import UIKit

class FilterHeaderView: UIView {

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("filterHeaderText", comment: "")
        label.textAlignment = .left
        label.textColor = .charcoalGrey
        label.font = UIFont(name: "SFUIText-Regular", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        addSubview(headerLabel)
        [headerLabel].forEach({ self.addSubview($0)})

        let offset: CGFloat = 20

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: offset),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: offset),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -offset),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -offset)
        ])
    }
}
