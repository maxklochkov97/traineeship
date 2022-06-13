//
//  JSONManager.swift
//  oneTask
//
//  Created by Максим Клочков on 12.05.2022.
//

import UIKit

enum NetworkServiceError: Error {
    case someError
    case invalidPath
}

final class LocalDataManager {
    static let pathEvents = Bundle.main.path(forResource: "events", ofType: "json")
    static let pathCategory = Bundle.main.path(forResource: "category", ofType: "json")
    static let pathPhotosParticipants = Bundle.main.path(forResource: "photosParticipants", ofType: "json")

    static func fetchData<T: Codable>(forPath path: String?, to date: T, completion: @escaping (Result<T, NetworkServiceError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            DispatchQueue.global(qos: .background).async {

                guard let path = path else {
                    completion(.failure(NetworkServiceError.invalidPath))
                    return
                }
                let url = URL(fileURLWithPath: path)
                
                do {
                    let jsonDate = try Data(contentsOf: url)
                    let currentEvents = try JSONDecoder().decode(T.self, from: jsonDate)
                    completion(.success(currentEvents))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(NetworkServiceError.someError))
                }
            }
        }
    }
}
