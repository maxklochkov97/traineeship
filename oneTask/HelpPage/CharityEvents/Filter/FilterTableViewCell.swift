//
//  FilterTableViewCell.swift
//  oneTask
//
//  Created by Максим Клочков on 18.05.2022.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    weak var fillIdentifierFilterDelegate: FillIdentifierFilterDelegate?

    private var identifier = ""

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "SFUIText-Regular", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var activateSwitch: UISwitch = {
        let activateSwitch = UISwitch()
        activateSwitch.isOn = true
        activateSwitch.onTintColor = .leaf
        activateSwitch.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        activateSwitch.translatesAutoresizingMaskIntoConstraints = false
        return activateSwitch
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with filter: Filter) {
        self.identifier = filter.identifier
        self.headerLabel.text = filter.typeOfHelp
    }

    @objc private func switchValueDidChange(_ sender: UISwitch!) {
        guard let filterArray = fillIdentifierFilterDelegate?.identifierFilter else { return }
        
        switch sender.isOn {
        case true:
            if !filterArray.contains(identifier) {
                fillIdentifierFilterDelegate?.identifierFilter.append(identifier)
            }
        case false:
            if filterArray.contains(identifier) {
                fillIdentifierFilterDelegate?.identifierFilter = filterArray.filter {$0 != identifier}
            }
        }
    }

    private func layout() {
        [activateSwitch, headerLabel].forEach { contentView.addSubview($0) }

        let offsetSides: CGFloat = 20
        let offsetTopBottom: CGFloat = 6

        NSLayoutConstraint.activate([
            activateSwitch.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: offsetTopBottom),
            activateSwitch.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -offsetTopBottom),
            activateSwitch.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -offsetSides),

            headerLabel.centerYAnchor.constraint(equalTo: activateSwitch.centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: offsetSides),
            headerLabel.trailingAnchor.constraint(equalTo: activateSwitch.leadingAnchor, constant: -offsetSides)
        ])
    }
}
