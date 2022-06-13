//
//  ViewController.swift
//  oneTask
//
//  Created by Максим Клочков on 06.05.2022.
//

import UIKit

class CharityEventsDetailViewController: UIViewController {

    private var date: PhotoParticipants?
    private let activityIndicator = UIActivityIndicatorView()

    var navBarTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "OfficinaSansExtraBoldSCC", size: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var mainView: CharityEventsDetailView = {
        let view = CharityEventsDetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let additionalButtonsView: AdditionalButtonsView = {
        let view = AdditionalButtonsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadDateFromLocalJSON()
        layout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    private func loadDateFromLocalJSON() {
        scrollView.isHidden = true
        activityIndicator.startAnimating()

        LocalDataManager.fetchData(forPath: LocalDataManager.pathPhotosParticipants, to: date) { [weak self] answer in
            switch answer {
            case .success(let data):
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self?.mainView.photoParticipantsView.configure(with: data.photos)
                    self?.activityIndicator.stopAnimating()
                    self?.scrollView.isHidden = false
                }
            case.failure(let error):
                DispatchQueue.main.async {
                    self?.addAlert(error: error.localizedDescription)
                    self?.activityIndicator.stopAnimating()
                    self?.scrollView.isHidden = false
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

    private func setupView() {
        self.view.backgroundColor = .white

        let rightClearButton = UIBarButtonItem(image: UIImage(named: "iconShare"), style: .plain, target: self, action: nil)
        rightClearButton.tintColor = .white
        navigationItem.rightBarButtonItem = rightClearButton

        navigationItem.titleView = navBarTitleLabel

        let leftBackButton = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(backToMainAction) )
        leftBackButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = leftBackButton
    }

    @objc func backToMainAction() {
        self.navigationController?.popViewController(animated: true)
    }

    private func layout() {
        activityIndicator.center = view.center
        [scrollView, additionalButtonsView, activityIndicator].forEach({ view.addSubview($0) })
        [mainView].forEach({ scrollView.addSubview($0) })

        NSLayoutConstraint.activate([
            navBarTitleLabel.heightAnchor.constraint(equalToConstant: 25),

            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: additionalButtonsView.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            mainView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            additionalButtonsView.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            additionalButtonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            additionalButtonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            additionalButtonsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
