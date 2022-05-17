//
//  HelpViewController.swift
//  oneTask
//
//  Created by Максим Клочков on 26.04.2022.
//

import UIKit

class HelpViewController: UIViewController {

    private var dataManager = LocalDataManager()
    private var date: Categories?
    private var allCategories = [Category]()

    private let layoutCol: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()

    private let navBarTitleLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("helpVC", comment: "")
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "OfficinaSansExtraBoldSCC", size: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutCol)

        collectionView.register(HelpCollectionViewCell.self, forCellWithReuseIdentifier: HelpCollectionViewCell.identifier)

        collectionView.register(
            HelpCollectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HelpCollectionHeader.identifier)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        //loadDataFromJSON()
        //loadAndUpdateData()
        loadDateFromLocalJSON()
        setupNavBar()
        layout()
    }

    func loadDateFromLocalJSON() {
        dataManager.fetchData2(forPath: dataManager.pathCategory, to: &date) { [weak self] answer in
            switch answer {
            case .success(let data):
                guard let data = data else { return }
                self?.allCategories = data.categories
            case.failure(let error):
                self?.addAlert(error: error.localizedDescription)
            }

            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }

    private func addAlert(error: String) {
        let alert = UIAlertController(title: "Server unavailable!", message: error, preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "Reload", style: .default) { _ in
            self.dismiss(animated: true)
            self.loadDateFromLocalJSON()
        }
        alert.addAction(okAlert)
        present(alert, animated: true)
    }

    private func loadAndUpdateData() {
        dataManager.fetchData(forPath: dataManager.pathCategory, to: &date)
        guard let date = date else { return }
        allCategories = date.categories

        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    private func loadDataFromJSON() {
        guard let path = Bundle.main.path(forResource: "category", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)

        do {
            let jsonDate = try Data(contentsOf: url)
            let currentCategories = try JSONDecoder().decode(Categories.self, from: jsonDate)
            self.allCategories = currentCategories.categories

            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }

        } catch {
            print("Error == \(error.localizedDescription)")
        }
    }

    @objc private func tabButton() {
        UIControl().sendAction(#selector(NSXPCConnection.suspend),
                               to: UIApplication.shared, for: nil)
    }

    private func setupNavBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .leaf

        navigationItem.titleView = navBarTitleLabel

        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

        let leftBackButton = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(tabButton))
        leftBackButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = leftBackButton
    }

    private func layout() {
        self.view.backgroundColor = .white

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([

            navBarTitleLabel.heightAnchor.constraint(equalToConstant: 25),

            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HelpViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCategories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HelpCollectionViewCell.identifier,
            for: indexPath) as? HelpCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(with: allCategories[indexPath.row])

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapCellAction))
        cell.addGestureRecognizer(tapGesture)
        
        return cell
    }

    @objc private func tapCellAction() {
        let newView = CharityEventsViewController()
        navigationController?.pushViewController(newView, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HelpCollectionHeader.identifier,
            for: indexPath) as? HelpCollectionHeader else {
            return UICollectionReusableView()
        }

        header.configure()
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 57)
    }
}

extension HelpViewController: UICollectionViewDelegateFlowLayout {

    private var sideInset: CGFloat { return 9 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 3) / 2

        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
}
