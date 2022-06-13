//
//  HeaderCollercitons.swift
//  oneTask
//
//  Created by Максим Клочков on 26.04.2022.
//

import UIKit

class HelpCollectionHeader: UICollectionReusableView {

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("helpPageHeaderText", comment: "")
        label.textAlignment = .center
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

    public func configure() {
        addSubview(headerLabel)
    }

    private func layout() {
        [headerLabel].forEach({ self.addSubview($0)})

        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
