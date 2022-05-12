//
//  File.swift
//  oneTask
//
//  Created by Максим Клочков on 13.05.2022.
//

import Foundation

struct CharityEvents: Codable {
    var image: String
    var imageTwo: String
    var imageThree: String
    var title: String
    var phone: String
    var description: String
    var deadline: String
    var fond: String
    var address: String
    var additionalDescription: String

    private enum CodingKeys: String, CodingKey {
        case image
        case phone
        case imageTwo = "image_two"
        case imageThree = "image_three"
        case title
        case description
        case deadline
        case fond
        case address
        case additionalDescription = "additional_description"
    }
}
