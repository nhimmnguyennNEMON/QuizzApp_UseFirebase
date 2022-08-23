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
    
//    var Quiz: [Exam] = []
    
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
    
    func getAllTopic(_ childFB: String, complete: @escaping ((TopicQuiz?)->())) {
        ref = Database.database().reference()
        ref?.child(childFB).observeSingleEvent(of: .value, with: { snapshot in
            if let value = snapshot.value as? [String: Any] {
                if let value = value.toData() {
                    let datas = value.tranforms(to: TopicQuiz.self)
                    complete(datas)
                }
                //                for topics in value{
                //                    //                    if let values = topics.value as? [String: Any] {
                //                    //                        let datas = values.toData()?.tranforms(to: TopicQuiz.self)
                //                    //                        complete(datas)
                //                    //                    }
                //                    let title: String = topics.key
                //                    var quizExam: [Questions]?
                //                    if let topic = topics.value as? [Any] {
                //                        quizExam = stringArrayToData(from: topic)?.tranforms(to: [Questions].self)
                //                        let examdata = Exam(title: title, listQuestion: quizExam)
                //                        Quiz.append(examdata)
                //                    }
                //
                //                }
            }
        })
    }
    
}
