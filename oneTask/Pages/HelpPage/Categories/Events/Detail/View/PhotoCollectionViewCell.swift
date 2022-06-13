//
//  PhotoCollectionViewCell.swift
//  oneTask
//
//  Created by Максим Клочков on 12.05.2022.
//

import UIKit

class PhotoPreviewCollectionViewCell: UICollectionViewCell {

    private var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 18
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.lightGreyOne.cgColor
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with photo: Photo) {
        self.photoImageView.image = UIImage(named: photo.image)
    }

    private func layout() {
        [photoImageView].forEach({ contentView.addSubview($0)})

        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
