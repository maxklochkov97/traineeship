//
//  HelpCollectionViewCell.swift
//  oneTask
//
//  Created by Максим Клочков on 26.04.2022.
//

import UIKit

class HelpCollectionViewCell: UICollectionViewCell {

    weak var tapCellDelegate: TapHelpCollectionViewCellDelegate?
    var identifier = ""

    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .zero
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .lightOliveGreen
        label.font = UIFont(name: "OfficinaSansExtraBoldSCC", size: 15)
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

    @objc private func photoAction() {
        tapCellDelegate?.tapCellAction()
    }

    public func configure(with page: Category) {
        self.imageView.image = UIImage(named: page.image)
        self.headerLabel.text = page.title
        self.identifier = page.identifier
        self.contentView.backgroundColor = .lightGreyTwo
    }

    private func layout() {
        [imageView, headerLabel].forEach({ contentView.addSubview($0) })

        let offset: CGFloat = 14

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -offset),

            headerLabel.heightAnchor.constraint(equalToConstant: 25),
            headerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -offset),
            headerLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
