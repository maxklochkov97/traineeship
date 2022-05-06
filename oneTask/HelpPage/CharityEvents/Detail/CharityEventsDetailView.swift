//
//  View.swift
//  oneTask
//
//  Created by Максим Клочков on 06.05.2022.
//

import UIKit

class CharityEventsDetailView: UIView {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private let titleVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "OfficinaSansExtraBoldSCC", size: 21)
        label.textColor = .blueGrey
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()

    private let deadlineHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()

    private let calendarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "iconCalGray")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let deadlineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .greyOne
        label.font = UIFont(name: "SFUIText-Regular", size: 11)
        return label
    }()

    private let fondLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .charcoalGrey
        label.font = UIFont(name: "SFUIText-Regular", size: 11)
        return label
    }()

    private let navHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()

    private let navImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "iconNav")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .charcoalGrey
        label.numberOfLines = 2
        label.font = UIFont(name: "SFUIText-Regular", size: 15)
        return label
    }()

    private let phoneHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()

    private let phoneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "iconPhone")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .charcoalGrey
        label.numberOfLines = 2
        label.font = UIFont(name: "SFUIText-Regular", size: 15)
        return label
    }()

    private let mailHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()

    private let mailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "mail")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let mailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .charcoalGrey
        label.text = "У вас есть вопросы? Напишите нам"
        label.numberOfLines = 2
        label.font = UIFont(name: "SFUIText-Regular", size: 15)
        return label
    }()

//    private let emailUsLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .leaf
//        label.text = "Напишите нам"
//        label.numberOfLines = 0
//        label.font = UIFont(name: "SFUIText-Regular", size: 15)
//        return label
//    }()

    private let photoVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()

    private let mainPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let secondPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let thirdPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .charcoalGrey
        label.numberOfLines = 0
        label.font = UIFont(name: "SFUIText-Regular", size: 15)
        return label
    }()

    private let onTheSiteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .leaf
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

    func setupView(_ model: CharityEvents) {
        self.titleLabel.text = model.title
        self.deadlineLabel.text = model.deadline
        self.fondLabel.text = model.fond
        self.addressLabel.text = model.address
        self.phoneLabel.text = model.phone
        self.mainPhotoImageView.image = UIImage(named: model.image)
        self.secondPhotoImageView.image = UIImage(named: model.imageTwo)
        self.thirdPhotoImageView.image = UIImage(named: model.imageThree)
        self.descriptionLabel.text = model.additionalDescription
    }

    private func layout() {
        self.backgroundColor = .white

        [scrollView].forEach({ self.addSubview($0) })

        [contentView].forEach({ scrollView.addSubview($0) })

        [titleVerticalStack, mainPhotoImageView, photoVerticalStack, descriptionLabel].forEach({ contentView.addSubview($0) })

        [calendarImageView, deadlineLabel].forEach({self.deadlineHorizontalStack.addArrangedSubview($0)})

        [navImageView, addressLabel].forEach({self.navHorizontalStack.addArrangedSubview($0)})

        [phoneImageView, phoneLabel].forEach({self.phoneHorizontalStack.addArrangedSubview($0)})

        [mailImageView, mailLabel].forEach({self.mailHorizontalStack.addArrangedSubview($0)})

        [titleLabel, deadlineHorizontalStack,
         fondLabel, navHorizontalStack,
         phoneHorizontalStack, mailHorizontalStack
        ].forEach({self.titleVerticalStack.addArrangedSubview($0)})

        [secondPhotoImageView, thirdPhotoImageView].forEach({self.photoVerticalStack.addArrangedSubview($0)})

        let offset: CGFloat = 20

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleVerticalStack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: offset),
            titleVerticalStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: offset),
            titleVerticalStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -offset),

            mainPhotoImageView.topAnchor.constraint(equalTo: titleVerticalStack.bottomAnchor, constant: offset),
            mainPhotoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: offset),
            mainPhotoImageView.trailingAnchor.constraint(equalTo: photoVerticalStack.leadingAnchor, constant: -offset),
            mainPhotoImageView.heightAnchor.constraint(equalTo: photoVerticalStack.heightAnchor, multiplier: 1),

            photoVerticalStack.topAnchor.constraint(equalTo: titleVerticalStack.bottomAnchor, constant: offset),
            photoVerticalStack.leadingAnchor.constraint(equalTo: mainPhotoImageView.trailingAnchor, constant: offset),
            photoVerticalStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -offset),

            descriptionLabel.topAnchor.constraint(equalTo: photoVerticalStack.bottomAnchor, constant: offset),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: offset),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -offset)
        ])
    }
}
