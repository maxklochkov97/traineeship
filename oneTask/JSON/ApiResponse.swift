//
//  ApiResponse.swift
//  oneTask
//
//  Created by Максим Клочков on 17.05.2022.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
