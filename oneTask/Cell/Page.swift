//
//  Page.swift
//  oneTask
//
//  Created by Максим Клочков on 15.04.2022.
//

import UIKit

struct  Page {
    let imageName: String
    let headerText: String

    static func allPages() -> [Page] {
        var pages = [Page]()

        [Page(imageName: "сhildren", headerText: "Дети"),
         Page(imageName: "adults", headerText: "Взрослые"),
         Page(imageName: "theElderly", headerText: "Пожилые"),
         Page(imageName: "animals", headerText: "Животные"),
         Page(imageName: "events", headerText: "Мероприятия")
        ].forEach({ pages.append($0) })

        return pages
    }
}
