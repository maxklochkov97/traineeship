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

        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().unselectedItemTintColor = .warmGreyTwo
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .leaf
    }

    private func setupControllers() {
        let newsNavigationController = UINavigationController(rootViewController: newsVC)
        newsVC.navigationItem.title = "Новости"
        newsVC.tabBarItem.title = "Новости"
        newsVC.tabBarItem.image = UIImage(systemName: "list.bullet")

        let searchNavigationController = UINavigationController(rootViewController: searchVC)
        searchVC.navigationItem.title = "Поиск"
        searchVC.tabBarItem.title = "Поиск"
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")

        let helpNavigationController = UINavigationController(rootViewController: helpVC)
        helpVC.navigationItem.title = "Помочь"
        helpVC.tabBarItem.title = "Помочь"
        helpVC.tabBarItem.image = UIImage(systemName: "heart.circle.fill")

        let historyNavigationController = UINavigationController(rootViewController: historyVC)
        historyVC.navigationItem.title = "История"
        historyVC.tabBarItem.title = "История"
        historyVC.tabBarItem.image = UIImage(systemName: "clock.arrow.circlepath")

        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        profileVC.navigationItem.title = "Профиль"
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")

        viewControllers = [newsNavigationController,
                           searchNavigationController,
                           helpNavigationController,
                           historyNavigationController,
                           profileNavigationController]
    }
}
