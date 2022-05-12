//
//  UITabBarController.swift
//  oneTask
//
//  Created by Максим Клочков on 26.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    let newsVC = NewsViewController()
    let searchVC = SearchViewController()
    let helpVC = HelpViewController()
    let historyVC = HistoryViewController()
    let profileVC = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupControllers()
    }

    private func setupTabBar() {
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.backgroundColor = UIColor.white.cgColor

        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().unselectedItemTintColor = .warmGreyTwo
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .leaf
    }

    private func setupControllers() {
        let newsNavigationController = UINavigationController(rootViewController: newsVC)
        newsVC.navigationItem.title = NSLocalizedString("newsVC", comment: "")
        newsVC.tabBarItem.title = NSLocalizedString("newsVC", comment: "")
        newsVC.tabBarItem.image = UIImage(systemName: "list.bullet")

        let searchNavigationController = UINavigationController(rootViewController: searchVC)
        searchVC.navigationItem.title = NSLocalizedString("searchVC", comment: "")
        searchVC.tabBarItem.title = NSLocalizedString("searchVC", comment: "")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")

        let helpNavigationController = UINavigationController(rootViewController: helpVC)
        helpVC.navigationItem.title = NSLocalizedString("helpVC", comment: "")
        helpVC.tabBarItem.title = NSLocalizedString("helpVC", comment: "")
        helpVC.tabBarItem.image = UIImage(systemName: "heart.circle.fill")

        let historyNavigationController = UINavigationController(rootViewController: historyVC)
        historyVC.navigationItem.title = NSLocalizedString("historyVC", comment: "")
        historyVC.tabBarItem.title = NSLocalizedString("historyVC", comment: "")
        historyVC.tabBarItem.image = UIImage(systemName: "clock.arrow.circlepath")

        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        profileVC.navigationItem.title = NSLocalizedString("profileVC", comment: "")
        profileVC.tabBarItem.title = NSLocalizedString("profileVC", comment: "")
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")

        viewControllers = [newsNavigationController,
                           searchNavigationController,
                           helpNavigationController,
                           historyNavigationController,
                           profileNavigationController]
    }
}
