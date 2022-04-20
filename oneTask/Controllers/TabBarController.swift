//
//  TabBarController.swift
//  oneTask
//
//  Created by Максим Клочков on 15.04.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.2
        
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().barTintColor = .white
    }
}
