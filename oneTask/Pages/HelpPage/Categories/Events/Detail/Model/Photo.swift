//
//  File.swift
//  oneTask
//
//  Created by Максим Клочков on 12.05.2022.
//

import Foundation

struct Photo: Codable {
    let image: String

    static func allPhotos() -> [Photo] {
        var photos = [Photo]()
        photos.append(Photo(image: "ph1"))
        photos.append(Photo(image: "ph1"))
        photos.append(Photo(image: "ph1"))
        photos.append(Photo(image: "ph1"))
        photos.append(Photo(image: "ph1"))
        photos.append(Photo(image: "ph1"))
        photos.append(Photo(image: "ph1"))
        photos.append(Photo(image: "ph1"))
        return photos
    }
}
