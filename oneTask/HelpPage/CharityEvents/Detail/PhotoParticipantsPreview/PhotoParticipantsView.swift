//
//  View.swift
//  oneTask
//
//  Created by Максим Клочков on 12.05.2022.
//

import UIKit

class PhotoParticipantsView: UIView {

    private var photoParticipants = Photo.allPhotos()

    private let layoutCol: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutCol)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(
            PhotoPreviewCollectionViewCell.self,
            forCellWithReuseIdentifier: PhotoPreviewCollectionViewCell.identifier)

        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGreyOne
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        [collectionView].forEach({ self.addSubview($0) })

        let offset: CGFloat = 20

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.bottomAnchor, constant: offset),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: offset),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -offset),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -offset)
        ])

    }
}

// MARK: - UICollectionViewDataSource
extension PhotoParticipantsView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        photoParticipants.count <= 5 ? photoParticipants.count : 5
        5
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

    private var sideInset: CGFloat { return 0 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 4) / 5
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
}
