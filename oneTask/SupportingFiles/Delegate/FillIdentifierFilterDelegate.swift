//
//  File.swift
//  oneTask
//
//  Created by Максим Клочков on 18.05.2022.
//

import Foundation

protocol FillIdentifierFilterDelegate: AnyObject {
    var identifierFilter: [String] { get set }
}
