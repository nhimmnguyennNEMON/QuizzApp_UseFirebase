//
//  QuizModel.swift
//  QuizApp
//
//  Created by V000273 on 16/08/2022.
//

import Foundation

struct Questions: Codable{
    
    //it field model on firebase
    var id: Int?
    var answer: String?
    var choice_1: String?
    var choice_2: String?
    var choice_3: String?
    var choice_4: String?
    var question: String?
    
    enum CodingKeys: String, CodingKey{
        case id = "Id"
        case question = "Question"
        case choice_1 = "Choice1"
        case choice_2 = "Choice2"
        case choice_3 = "Choice3"
        case choice_4 = "Choice4"
        case answer = "Answer"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        choice_1 = try values.decodeIfPresent(String.self, forKey: .choice_1)
        choice_2 = try values.decodeIfPresent(String.self, forKey: .choice_2)
        choice_3 = try values.decodeIfPresent(String.self, forKey: .choice_3)
        choice_4 = try values.decodeIfPresent(String.self, forKey: .choice_4)
        question = try values.decodeIfPresent(String.self, forKey: .question)
        answer = try values.decodeIfPresent(String.self, forKey: .answer)
    }
}


