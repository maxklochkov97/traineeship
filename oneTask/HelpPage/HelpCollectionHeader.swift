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
        label.text = "Выберите категорию помощи"
        label.textAlignment = .center
        label.textColor = .charcoalGrey
        label.font = UIFont(name: "SFUIText-Regular", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public func configure() {
        addSubview(headerLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        headerLabel.frame = bounds
    }
}
