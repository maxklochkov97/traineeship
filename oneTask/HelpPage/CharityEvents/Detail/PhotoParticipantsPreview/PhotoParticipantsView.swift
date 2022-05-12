//
//  View.swift
//  oneTask
//
//  Created by Максим Клочков on 12.05.2022.
//

import UIKit

class PhotoParticipantsView: UIView {

    private var photoParticipants = [Photo]()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoPreviewCollectionViewCell.self, forCellWithReuseIdentifier: PhotoPreviewCollectionViewCell.identifier)
        collectionView.backgroundColor = .lightGreyOne
        return collectionView
    }()

    private var participantsCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .greyOne
        label.font = UIFont(name: "SFUIText-Regular", size: 15)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with photos: [Photo]) {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.whiteTwo.cgColor

        self.photoParticipants = photos

        if photos.count <= 5 {
            self.participantsCountLabel.text = ""
        } else {
            self.participantsCountLabel.text = "+\(photos.count - 5)"
        }

        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }

        self.backgroundColor = .lightGreyOne
    }

    private func layout() {
        [collectionView, participantsCountLabel].forEach({ self.addSubview($0) })

        let offsetTopBottom: CGFloat = 16
        let offsetSides: CGFloat = 20

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offsetSides),
            collectionView.widthAnchor.constraint(equalToConstant: 165),
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: offsetTopBottom),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offsetTopBottom),

            participantsCountLabel.leadingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: 10),
            participantsCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            participantsCountLabel.topAnchor.constraint(equalTo: collectionView.topAnchor),
            participantsCountLabel.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension PhotoParticipantsView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoParticipants.count <= 5 ? photoParticipants.count : 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoPreviewCollectionViewCell.identifier,
            for: indexPath) as? PhotoPreviewCollectionViewCell else {
                return UICollectionViewCell()
            }
        cell.configure(with: photoParticipants[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotoParticipantsView: UICollectionViewDelegateFlowLayout {

    private var sideInset: CGFloat { return 10 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 36
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        -sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        -sideInset
    }
}
