//
//  HelpModel.swift
//  oneTask
//
//  Created by Максим Клочков on 26.04.2022.
//

import UIKit

struct Categories: Codable {
    var categories: [Category]
}

struct Category: Codable {
    let image: String
    let title: String
}
