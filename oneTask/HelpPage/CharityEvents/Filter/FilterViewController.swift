//
//  FilterViewController.swift
//  oneTask
//
//  Created by Максим Клочков on 18.05.2022.
//

import UIKit

class FilterViewController: UIViewController {

    weak var filterEventsModelDelegate: FilterEventsModelDelegate?

    private var dataManager = LocalDataManager()
    private var date: Events?
    private var filterEventsModel = [CharityEvents]()
    internal var identifierFilter = [String]()

    private let howToHelpModel = [
        Filter(typeOfHelp: NSLocalizedString("howToHelpMoney", comment: ""), identifier: "money"),
        Filter(typeOfHelp: NSLocalizedString("howToHelpThing", comment: ""), identifier: "thing")
    ]

    private let navBarTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "OfficinaSansExtraBoldSCC", size: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FilterTableViewCell.self, forCellReuseIdentifier: FilterTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGreyOne
        setupNavBar()
        fillIdentifierFilter()
        layout()
    }

    private func fillIdentifierFilter() {
        for object in howToHelpModel {
            identifierFilter.append(object.identifier)
        }
    }

    private func setupNavBar() {
        let rightSaveButton = UIBarButtonItem(image: UIImage(named: "savefiltering"), style: .plain, target: self, action: #selector(tabSaveButton) )
        rightSaveButton.tintColor = .white
        navigationItem.rightBarButtonItem = rightSaveButton

        navigationItem.titleView = navBarTitleLabel

        let leftBackButton = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(tabBackButton) )
        leftBackButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = leftBackButton
    }

    @objc private func tabBackButton() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func tabSaveButton() {
        filterEventsModelDelegate?.filterEventsModel(identifierFilter)
        self.navigationController?.popViewController(animated: true)
    }

    private func layout() {
        [tableView].forEach({ self.view.addSubview($0)})

        NSLayoutConstraint.activate([
            navBarTitleLabel.heightAnchor.constraint(equalToConstant: 25),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension FilterViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  howToHelpModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FilterTableViewCell.identifier,
            for: indexPath) as? FilterTableViewCell else {
                return UITableViewCell()
            }

        cell.configure(with: howToHelpModel[indexPath.row])
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        cell.fillIdentifierFilterDelegate = self
        return cell
    }
}

extension FilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = FilterHeaderView()
        return header
    }
}

extension FilterViewController: FillIdentifierFilterDelegate {}
