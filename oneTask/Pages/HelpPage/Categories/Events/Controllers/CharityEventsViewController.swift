//
//  CharityEventsViewController.swift
//  oneTask
//
//  Created by Максим Клочков on 05.05.2022.
//

import UIKit

class CharityEventsViewController: UIViewController {

    private var filterSettings = FilterViewController()
    private var eventsModel = [CharityEvents]()
    private var date: Events?
    private var identifierCategory = ""
    private let activityIndicator = UIActivityIndicatorView()

    var navBarTitleLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("childrenNavTitle", comment: "")
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "OfficinaSansExtraBoldSCC", size: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let layoutCol: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()
    
    private lazy var charityEventsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutCol)
        
        collectionView.register(
            CharityEventsCollectionViewCell.self,
            forCellWithReuseIdentifier: CharityEventsCollectionViewCell.identifier)
        
        collectionView.register(
            CharityEventsHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: CharityEventsHeaderView.identifier)
        
        collectionView.backgroundColor = .lightGreyOne
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        loadDateFromLocalJSON()
        layout()
        setupNavBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

    private func loadDateFromLocalJSON() {
        self.activityIndicator.startAnimating()

        LocalDataManager.fetchData(forPath: LocalDataManager.pathEvents, to: date) { [weak self] answer in
            switch answer {
            case .success(let data):
                guard let data = data else { return }

                var filterModel = [CharityEvents]()
                for event in data.events where event.identifierCategory == self?.identifierCategory {
                    filterModel.append(event)
                }

                DispatchQueue.main.async {
                    self?.activityIndicator.stopAnimating()
                    self?.eventsModel = filterModel
                    self?.charityEventsCollectionView.reloadData()
                }

            case.failure(let error):
                DispatchQueue.main.async {
                    self?.activityIndicator.stopAnimating()
                    self?.addAlert(error: error.localizedDescription)
                }
            }
        }
    }

    private func addAlert(error: String) {
        let alert = UIAlertController(title: NSLocalizedString("alertHeaderText", comment: ""), message: error, preferredStyle: .alert)
        let okAlert = UIAlertAction(title: NSLocalizedString("alertOkText", comment: ""), style: .default) { _ in
            self.dismiss(animated: true)
            self.loadDateFromLocalJSON()
        }
        let cancelAlert = UIAlertAction(title: NSLocalizedString("alertCancelText", comment: ""), style: .destructive)
        [cancelAlert, okAlert].forEach({ alert.addAction($0) })
        present(alert, animated: true)
    }
    
    private func setupNavBar() {
        let rightFilterButton = UIBarButtonItem(image: UIImage(named: "filter"), style: .plain, target: self, action: #selector(tabFilterButton))
        rightFilterButton.tintColor = .white
        navigationItem.rightBarButtonItem = rightFilterButton
        
        navigationItem.titleView = navBarTitleLabel
        
        let leftBackButton = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(tabBackButton) )
        leftBackButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = leftBackButton
    }

    func setupView(_ category: Category) {
        self.identifierCategory = category.identifier
        self.navBarTitleLabel.text = category.title
    }
    
    @objc private func tabBackButton() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func tabFilterButton() {
        filterSettings.filterEventsModelDelegate = self
        navigationController?.pushViewController(filterSettings, animated: true)
    }
    
    private func layout() {
        activityIndicator.center = view.center
        [charityEventsCollectionView, activityIndicator].forEach({ self.view.addSubview($0)})

        let offset: CGFloat = 0
        
        NSLayoutConstraint.activate([
            navBarTitleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            charityEventsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: offset),
            charityEventsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -offset),
            charityEventsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: offset),
            charityEventsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -offset)
        ])
    }
}

extension CharityEventsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        eventsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharityEventsCollectionViewCell.identifier,
            for: indexPath) as? CharityEventsCollectionViewCell else {
                return UICollectionViewCell()
            }
        cell.configure(with: eventsModel[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = CharityEventsDetailViewController()
        detailVC.navBarTitleLabel.text = eventsModel[indexPath.row].title
        detailVC.mainView.setupView(eventsModel[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: CharityEventsHeaderView.identifier,
            for: indexPath) as? CharityEventsHeaderView else {
                return UICollectionReusableView()
            }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 57)
    }
}

extension CharityEventsViewController: UICollectionViewDelegateFlowLayout {
    
    private var sideInset: CGFloat { return 8 }
    private var topBottomInset: CGFloat { return 10 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 2)
        
        return CGSize(width: width, height: width * 1.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: topBottomInset, left: sideInset, bottom: topBottomInset, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
}

extension CharityEventsViewController: FilterEventsModelDelegate {
    func filterEventsModel(_ identifierFilter: [String]) {
        eventsModel = [CharityEvents]()
        charityEventsCollectionView.reloadData()

        activityIndicator.startAnimating()

        DispatchQueue.global(qos: .background).async {
            LocalDataManager.fetchData(forPath: LocalDataManager.pathEvents, to: self.date) { [weak self] answer in
                switch answer {
                case .success(let data):
                    guard let data = data else { return }

                    var filterModel = [CharityEvents]()
                    for event in data.events where
                    event.identifierCategory == self?.identifierCategory &&
                    event.identifierFilter.allSatisfy(identifierFilter.contains) {
                        filterModel.append(event)
                    }

                    DispatchQueue.main.async {
                        self?.activityIndicator.stopAnimating()
                        self?.eventsModel = filterModel
                        self?.charityEventsCollectionView.reloadData()
                    }

                case.failure(let error):
                    DispatchQueue.main.async {
                        self?.activityIndicator.stopAnimating()
                        self?.addAlert(error: error.localizedDescription)
                    }
                }
            }
        }
    }
}
