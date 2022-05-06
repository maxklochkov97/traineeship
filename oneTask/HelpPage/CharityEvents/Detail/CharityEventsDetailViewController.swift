//
//  ViewController.swift
//  oneTask
//
//  Created by Максим Клочков on 06.05.2022.
//

import UIKit

class CharityEventsDetailViewController: UIViewController {
    
    var mainView: CharityEventsDetailView = {
        let view = CharityEventsDetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    private func layout() {
        
        [mainView].forEach({ self.view.addSubview($0) })
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
