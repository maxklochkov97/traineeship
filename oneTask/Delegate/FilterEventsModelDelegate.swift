//
//  FilterEventsModelDelegate.swift
//  oneTask
//
//  Created by Максим Клочков on 18.05.2022.
//

import Foundation

protocol FilterEventsModelDelegate: AnyObject {
    func filterEventsModel(_ identifierFilter: [String])
}
