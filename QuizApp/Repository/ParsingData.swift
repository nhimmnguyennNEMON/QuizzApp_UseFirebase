//
//  GetJsonFirebase.swift
//  QuizApp
//
//  Created by V000273 on 18/08/2022.
//

import Foundation

func stringArrayToData(from: [Any]) -> Data? {
    return try? JSONSerialization.data(withJSONObject: from, options: [])
}

extension Dictionary {
    func toData() -> Data? {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: [])
            return data
        } catch let error {
            print(error)
            return nil
        }
    }
}

extension Data {
    func tranforms<T: Decodable>(to: T.Type) -> T? {
        guard let response = try? JSONDecoder().decode(to, from: self) else { return nil }
        return response
    }
}





