//
//  TopicModel.swift
//  QuizApp
//
//  Created by V000273 on 18/08/2022.
//

import Foundation

struct TopicQuiz: Codable{
    
    //it field model on firebase
    var topic_1: String?
    var topic_2: String?
    var topic_3: String?
    
    enum CodingKeys: String, CodingKey{
        case topic_1 = "Choice1"
        case topic_2 = "Choice2"
        case topic_3 = "Choice3"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        topic_1 = try values.decodeIfPresent(String.self, forKey: .topic_1)
        topic_2 = try values.decodeIfPresent(String.self, forKey: .topic_2)
        topic_3 = try values.decodeIfPresent(String.self, forKey: .topic_3)
    }
}
