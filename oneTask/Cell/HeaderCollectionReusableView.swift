//
//  Header.swift
//  oneTask
//
//  Created by Максим Клочков on 15.04.2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите категорию помощи"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        label.textColor = .black
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
