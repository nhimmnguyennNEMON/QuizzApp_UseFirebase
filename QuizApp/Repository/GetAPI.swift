//
//  GetAPI.swift
//  QuizApp
//
//  Created by V000273 on 22/08/2022.
//

import Foundation
import Firebase
import FirebaseDatabase

class GetAPI{
    
    static var share = GetAPI()
    
    var Quiz: [Exam] = []
    var topicss: [String] = []
    
    var ref: DatabaseReference!
    
    func getAllQuestion(_ childFB: String, _ topicFB: String, complete: @escaping (([Questions])->()) ) {
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
    
    func getAllQuizz(_ childFB: String, complete: @escaping (([Exam])->()))  {
        topicss.removeAll()
        var tempExam: [Exam] = []
        ref = Database.database().reference()
        ref?.child(childFB).observeSingleEvent(of: .value, with: { snapshot in
            if let value = snapshot.value as? [String: Any] {
                for topics in value{
                    var quizExam: [Questions]?
                    if let topic = topics.value as? [Any] {
                        quizExam = stringArrayToData(from: topic)?.tranforms(to: [Questions].self)
                        let examdata = Exam(title: topics.key, listQuestion: quizExam ?? [])
                        tempExam.append(examdata)
                    }
                }
                complete(tempExam)
            }
        })
    }
    
}
