//
//  JSONManager.swift
//  oneTask
//
//  Created by Максим Клочков on 12.05.2022.
//

import UIKit

class JSONManager {

    func fetchMessageEvents() {
        guard let path = Bundle.main.path(forResource: "events", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)

        do {
            let jsonDate = try Data(contentsOf: url)
            let currentEvents = try JSONDecoder().decode(Events.self, from: jsonDate)


            DispatchQueue.main.async {
                self.charityEventsCollectionView.reloadData()
            }

        } catch {
            print(error)
        }
    }
}

class JSONManager2 {
    let eventsFileName = "events"
    let categoryFileName = "category"
    let photosParticipantsFileName = "photosParticipants"

    var isPagination = false

    func fetchEvents<T>(pagination: Bool = false, name: String, completionHandler: @escaping (Result<T, Error>) -> Void) {

        if pagination {
            isPagination = true
        }

        guard let path = Bundle.main.path(forResource: name, ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)

        do {
            let jsonDate = try Data(contentsOf: url)
            let currentData = try JSONDecoder().decode(T.self, from: jsonDate)
            completionHandler(.success(currentData))

            if pagination {
                self.isPagination = false
            }

        } catch {
            print("Что-то не так в \(#function)")
            completionHandler(.failure(error))
        }
    }
}
