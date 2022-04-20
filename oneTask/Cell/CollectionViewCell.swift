//
//  CollectionViewCell.swift
//  oneTask
//
//  Created by Максим Клочков on 15.04.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!

    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            cellImage.image = UIImage(named: unwrappedPage.imageName)
            headerLabel.text = unwrappedPage.headerText
        }
    }
}
