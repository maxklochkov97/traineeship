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
    var identifierCategory: String
    var identifierFilter: [String]

    private enum CodingKeys: String, CodingKey {
        case image, phone, title, description, deadline, fond, address
        case imageTwo = "image_two"
        case imageThree = "image_three"
        case additionalDescription = "additional_description"
        case identifierCategory = "identifier_category"
        case identifierFilter = "identifier_filter"
    }
}
