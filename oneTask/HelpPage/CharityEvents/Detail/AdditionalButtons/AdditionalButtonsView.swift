//
//  AdditionalButtonsView.swift
//  oneTask
//
//  Created by Максим Клочков on 12.05.2022.
//

import UIKit

class AdditionalButtonsView: UIView {

    private let helpWithThingsLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("HelpWithThings", comment: "")
        label.textAlignment = .center
        label.textColor = .warmGreyOne
        label.numberOfLines = 2
        label.font = UIFont(name: "SFUIText-Regular", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let helpWithThingsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "shirt")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let helpWithThingsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.spacing = 9
        return stack
    }()

    private let becomeAVolunteerLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("BecomeAVolunteer", comment: "")
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .warmGreyOne
        label.font = UIFont(name: "SFUIText-Regular", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let becomeAVolunteerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "hands")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let becomeAVolunteerStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.spacing = 9
        return stack
    }()

    private let profHelpLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("ProfHelp", comment: "")
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .warmGreyOne
        label.font = UIFont(name: "SFUIText-Regular", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let profHelpImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "tools")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let profHelpStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.spacing = 9
        return stack
    }()

    private let helpWithMoneyLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("HelpWithMoney", comment: "")
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .warmGreyOne
        label.font = UIFont(name: "SFUIText-Regular", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let helpWithMoneyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "coins")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let helpWithMoneyStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.spacing = 9
        return stack
    }()

    private let separatorImageViewOne: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "separatorDetail")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let separatorImageViewTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "separatorDetail")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let separatorImageViewThree: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "separatorDetail")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let mainHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalCentering
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelf()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSelf() {
        self.backgroundColor = .white
        self.addBorders(edges: .top, color: UIColor.lightGreyOne)
    }

    private func layout() {
        [mainHorizontalStack].forEach({ self.addSubview($0) })

        [helpWithThingsImageView, helpWithThingsLabel].forEach({ helpWithThingsStack.addArrangedSubview($0) })

        [becomeAVolunteerImageView, becomeAVolunteerLabel].forEach({ becomeAVolunteerStack.addArrangedSubview($0) })

        [profHelpImageView, profHelpLabel].forEach({ profHelpStack.addArrangedSubview($0) })

        [helpWithMoneyImageView, helpWithMoneyLabel].forEach({ helpWithMoneyStack.addArrangedSubview($0) })

        [helpWithThingsStack, separatorImageViewOne,
         becomeAVolunteerStack, separatorImageViewTwo,
         profHelpStack, separatorImageViewThree,
         helpWithMoneyStack].forEach({ mainHorizontalStack.addArrangedSubview($0) })

        let offsetSide: CGFloat = 13
        let offsetTopBottom: CGFloat = 9
        let heightStack: CGFloat = 60
        let widthStack: CGFloat = 66

        NSLayoutConstraint.activate([
            mainHorizontalStack.topAnchor.constraint(equalTo: topAnchor, constant: offsetTopBottom),
            mainHorizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offsetSide),
            mainHorizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offsetSide),
            mainHorizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offsetTopBottom),

            helpWithThingsStack.heightAnchor.constraint(equalToConstant: heightStack),
            helpWithThingsStack.widthAnchor.constraint(equalToConstant: widthStack),

            becomeAVolunteerStack.heightAnchor.constraint(equalToConstant: heightStack),
            becomeAVolunteerStack.widthAnchor.constraint(equalToConstant: widthStack),

            profHelpStack.heightAnchor.constraint(equalToConstant: heightStack),
            profHelpStack.widthAnchor.constraint(equalToConstant: widthStack),

            helpWithMoneyStack.heightAnchor.constraint(equalToConstant: heightStack),
            helpWithMoneyStack.widthAnchor.constraint(equalToConstant: widthStack)
        ])
    }
}
