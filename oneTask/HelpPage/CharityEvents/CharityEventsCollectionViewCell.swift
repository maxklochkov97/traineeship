//
//  CharityEventsTableViewCell.swift
//  oneTask
//
//  Created by Максим Клочков on 05.05.2022.
//

import UIKit

class CharityEventsCollectionViewCell: UICollectionViewCell {

    private let mainPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let gradientImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gradientPNG")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "OfficinaSansExtraBoldSCC", size: 21)
        label.textColor = .blueGrey
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()

    private let dividerLabelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "dividerLabelImage")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkSlateBlue
        label.numberOfLines = 3
        label.textAlignment = .center
        label.font = UIFont(name: "SFUIText-Regular", size: 15)
        return label
    }()

    private let leafView: UIView = {
        let view = UIView()
        view.backgroundColor = .leaf
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let calendarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Calendar")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let deadlineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "SFUIText-Regular", size: 11)
        return label
    }()

    private let mainLabelVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalSpacing
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    private let deadlineLabelHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalSpacing
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with events: CharityEvents) {
        self.mainPhotoImageView.image = UIImage(named: events.image)
        self.titleLabel.text = events.title
        self.descriptionLabel.text = events.description
        self.deadlineLabel.text = events.deadline
    }

    private func layout() {
        self.contentView.backgroundColor = .white

        [mainPhotoImageView,
         gradientImageView, mainLabelVerticalStack,
         leafView, deadlineLabelHorizontalStack
        ].forEach { contentView.addSubview($0) }

        [titleLabel, dividerLabelImageView, descriptionLabel].forEach({ mainLabelVerticalStack.addArrangedSubview($0) })

        [calendarImageView, deadlineLabel].forEach({ deadlineLabelHorizontalStack.addArrangedSubview($0) })

        let offsetPhoto: CGFloat = 4
        let offsetStackLabel: CGFloat = 16

        NSLayoutConstraint.activate([
            mainPhotoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: offsetPhoto),
            mainPhotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offsetPhoto),
            mainPhotoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -offsetPhoto),
            mainPhotoImageView.heightAnchor.constraint(equalTo: mainPhotoImageView.widthAnchor, multiplier: 0.65),

            gradientImageView.topAnchor.constraint(equalTo: mainPhotoImageView.topAnchor),
            gradientImageView.leadingAnchor.constraint(equalTo: mainPhotoImageView.leadingAnchor),
            gradientImageView.trailingAnchor.constraint(equalTo: mainPhotoImageView.trailingAnchor),
            gradientImageView.bottomAnchor.constraint(equalTo: mainPhotoImageView.bottomAnchor),

            mainLabelVerticalStack.topAnchor.constraint(equalTo: mainPhotoImageView.bottomAnchor),
            mainLabelVerticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offsetStackLabel),
            mainLabelVerticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -offsetStackLabel),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),

            leafView.topAnchor.constraint(equalTo: mainLabelVerticalStack.bottomAnchor, constant: offsetStackLabel),
            leafView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            leafView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            leafView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            deadlineLabelHorizontalStack.centerXAnchor.constraint(equalTo: leafView.centerXAnchor),
            deadlineLabelHorizontalStack.centerYAnchor.constraint(equalTo: leafView.centerYAnchor)
        ])
    }
}
