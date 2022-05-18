//
//  JSONManager.swift
//  oneTask
//
//  Created by Максим Клочков on 12.05.2022.
//

import UIKit

class LocalDataManager {
    let pathEvents = Bundle.main.path(forResource: "events", ofType: "json")
    let pathCategory = Bundle.main.path(forResource: "category", ofType: "json")
    let pathPhotosParticipants = Bundle.main.path(forResource: "photosParticipants", ofType: "json")

    func fetchData<T: Codable>(forPath path: String?, to data: inout T, completion: @escaping (Result<T, Error>) -> Void) {

        guard let path = path else { return }
        let url = URL(fileURLWithPath: path)

        do {
            let jsonDate = try Data(contentsOf: url)
            let currentEvents = try JSONDecoder().decode(T.self, from: jsonDate)
            completion(.success(currentEvents))
        } catch {
            print(error.localizedDescription)
            completion(.failure(error))
        }
    }
}
