//
//  TopicModel.swift
//  QuizApp
//
//  Created by V000273 on 18/08/2022.
//

import Foundation

struct TopicQuiz: Codable{

    //it field model on firebase
    var civicEducation: [Questions]?
    var geography: [Questions]?
    var history: [Questions]?

    enum CodingKeys: String, CodingKey {
        case civicEducation = "Civic Education"
        case geography = "Geography"
        case history = "History"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        civicEducation = try values.decodeIfPresent([Questions].self, forKey: .civicEducation)
        geography = try values.decodeIfPresent([Questions].self, forKey: .geography)
        history = try values.decodeIfPresent([Questions].self, forKey: .history)
    }

}

class Exam: NSObject {
    var title: String?
    var listQuestion: [Questions]
    init(title: String, listQuestion: [Questions]) {
        self.title = title
        self.listQuestion = listQuestion
    }
}
