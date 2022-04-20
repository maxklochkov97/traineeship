//
//  ViewController.swift
//  oneTask
//
//  Created by Максим Клочков on 17.03.2022.
//

import UIKit
import Alamofire

// MARK: - UICollectionViewController
class ViewController: UICollectionViewController {

    let pages = Page.allPages()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {

        // Добавление кнопки назад в navigation
        let addButton = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(tabButton))
        self.navigationItem.leftBarButtonItem = addButton
        self.navigationItem.leftBarButtonItem?.tintColor = .white

        // Настройка tapBar
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .mainColor
        navBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

        // добавление Header
        collectionView?.register(HeaderCollectionReusableView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: HeaderCollectionReusableView.identifier)
    }

    @objc func tabButton() {
        UIControl().sendAction(#selector(NSXPCConnection.suspend),
                               to: UIApplication.shared, for: nil)
    }

    // создание кол-во ячеек
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }

    // создание и возврат ячейки
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cellNotCast = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {
            return cellNotCast
        }

        let page = pages[indexPath.item]
        cell.page = page
        cell.backgroundColor = .secondColor

        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    // Размер ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let screen = UIScreen.main.bounds
        let cellWidth = screen.size.width / 2 - 14

        return CGSize(width: cellWidth, height: cellWidth)
    }

    // размер заголовка
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let headerNotCast = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                                     withReuseIdentifier: HeaderCollectionReusableView.identifier,
                                                                                     for: indexPath)

        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                           withReuseIdentifier: HeaderCollectionReusableView.identifier,
                                                                           for: indexPath) as? HeaderCollectionReusableView else {
            return headerNotCast
        }

        header.configure()
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 57)
    }
}
