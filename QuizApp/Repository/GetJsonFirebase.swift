//
//  GetJsonFirebase.swift
//  QuizApp
//
//  Created by V000273 on 18/08/2022.
//

import Foundation
import Firebase
import FirebaseDatabase

var ref: DatabaseReference!

func getAllQuizz(childFB: String, topicFB: String, complete: @escaping (([Questions])->()) ) {
    ref = Database.database().reference()
    ref?.child(childFB).queryOrdered(byChild: topicFB).observeSingleEvent(of: .value, with: { snapshot in
        if let value = snapshot.value as? [String: Any]{
            if let topic = value[topicFB] as? [Any] {
                let _datas = stringArrayToData(from: topic)?.tranforms(to: [Questions].self)
                 complete(_datas ?? [])
            }
        }
    })
}


func getAllTopic(childFB: String, topicFB: String, complete: @escaping (([TopicQuiz])->()) ) {
    ref = Database.database().reference()
    ref?.child(childFB).observeSingleEvent(of: .value, with: { snapshot in
        if let value = snapshot.value as? [String: Any]{
            if let topicQizz = value[childFB] as? [Any]{
                let _datas = stringArrayToData(from: topicQizz)?.tranforms(to: [TopicQuiz].self)
                complete(_datas ?? [])
            }
        }
    })
}

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



