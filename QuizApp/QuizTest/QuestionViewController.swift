//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by V000273 on 16/08/2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var tableQuesstion: UITableView!
    @IBOutlet weak var btPre: UIButton!
    @IBOutlet weak var btNext: UIButton!
    @IBOutlet weak var topicExam: UILabel!
    @IBOutlet weak var timeCount: UILabel!
    
    //declered data
    var titleExam: String = ""
    var lisQues: [Questions] = []
    var quesData: String = ""
    var choiceData: [String] = ["A", "B", "C", "D"]
    var answerData: [String] = []
    
    //declered check and add answer
    var lisAnswerTemp: [String] = []
    var lisAnswer: [String] = []
    var listSelectChoice: [Int?] = []
    var indexChoice: Int?
    var pointExamTrue: Int = 0
    var pointExamFalse: Int = 0
    var indexQues: Int = 0
    var timer: Timer?
    var totalTime = 900
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableQuesstion.register(UINib(nibName: "QuestionTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "QuestionTableViewCell")
        
        tableQuesstion.delegate = self
        tableQuesstion.dataSource = self
        
        styleOption()
        topicExam.text = titleExam
        getQuestionSelected()
        startOtpTimer(totalTime)
        checkButton()
        
    }
    
    private func startOtpTimer(_ totalTime: Int) {
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        self.timeCount.text = self.timeFormatted(self.totalTime) // will show timer
        if totalTime != 0 {
            totalTime -= 1  // decrease counter timer
        } else {
            if let timer = self.timer {
                timer.invalidate()
                self.timer = nil
            }
        }
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func stopTimerTest() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func getQuestionSelected(_ indexQues: Int = 0){
        lbQuestion.text = lisQues[indexQues].question
        answerData.removeAll()
        answerData.append(lisQues[indexQues].choice_1 ?? "")
        answerData.append(lisQues[indexQues].choice_2 ?? "")
        answerData.append(lisQues[indexQues].choice_3 ?? "")
        answerData.append(lisQues[indexQues].choice_4 ?? "")
        tableQuesstion.reloadData()
    }
    
    func styleOption() {
        btNext.layer.cornerRadius = 20
        btPre.layer.cornerRadius = 20
        //        tableQuesstion!.layer.cornerRadius = 12 //set corner radius here
        //        tableQuesstion!.layer.borderWidth = 2 // set border width here
        //        tableQuesstion!.layer.borderColor = UIColor.clear.cgColor
        //        tableQuesstion!.layer.masksToBounds = true
        //        tableQuesstion!.layer.shadowColor = UIColor.black.cgColor
        //        tableQuesstion!.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        //        tableQuesstion!.layer.shadowRadius = 5
        //        tableQuesstion!.layer.shadowOpacity = 0.3
        //        tableQuesstion!.layer.masksToBounds = false
        //        tableQuesstion!.layer.shadowPath = UIBezierPath(roundedRect: tableQuesstion!.bounds, cornerRadius: tableQuesstion!.layer.cornerRadius).cgPath
    }
    
    func blockBT(_ btSelect: UIButton){
        btSelect.isEnabled = false
        btSelect.backgroundColor = UIColor.gray
        getQuestionSelected(indexQues)
    }
    
    func openBT(_ btSelect: UIButton){
        btSelect.isEnabled = true
        btSelect.backgroundColor = UIColor.systemBlue
        getQuestionSelected(indexQues)
    }
    
    func addAnswer(){
        if (lisAnswerTemp.isEmpty) || indexChoice == nil {
            return
        } else {
            lisAnswer.append(lisAnswerTemp[lisAnswerTemp.count - 1])
            lisAnswerTemp.removeAll()
            listSelectChoice.append(indexChoice)
            print(listSelectChoice)
        }
    }
    
    func checkAnswer(_ indexQues: Int){
        if (lisAnswerTemp.isEmpty){
            return
        } else {
            if (lisQues[indexQues].answer == lisAnswerTemp[lisAnswerTemp.count - 1]) {
                pointExamTrue += 1
            } else {
                pointExamFalse += 1
            }
        }
    }
    
    func displayAlert() {
        let dialogMessage = UIAlertController(title: "Xác Nhận!", message: "Bạn Có Muốn Dừng Bài Thi Không?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Có", style: .default, handler: { (action) -> Void in
            let vc = ResultViewController(nibName: "ResultViewController", bundle: nil)
            vc.resultExamDis = self.pointExamTrue
            vc.sumQuestionDis = self.lisQues.count
            vc.titleExamTry = self.titleExam
            self.navigationController?.pushViewController(vc, animated: true)
        })
        let cancel = UIAlertAction(title: "Không", style: .cancel) { (action) -> Void in
            self.startOtpTimer(self.totalTime)
        }
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func btStop(_ sender: Any) {
        displayAlert()
        stopTimerTest()
    }
    
    func checkButton(){
        if indexQues >= lisQues.count - 1{
            blockBT(btNext)
        } else if indexQues == 0 {
            blockBT(btPre)
        } else {
            openBT(btNext)
            openBT(btPre)
        }
    }
    
    @IBAction func clickSubmit(_ sender: Any) {
        let vc = ResultViewController(nibName: "ResultViewController", bundle: nil)
        vc.resultExamDis = pointExamTrue
        vc.sumQuestionDis = lisQues.count
        vc.titleExamTry = titleExam
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func nextQues(_ sender: Any) {
        if indexQues < lisQues.count - 1 {
            indexQues = indexQues + 1
            getQuestionSelected(indexQues)
            checkButton()
            checkAnswer(indexQues - 1)
            addAnswer()
        }
        else {
            blockBT(btNext)
        }
    }
    
    @IBAction func preQues(_ sender: Any) {
        if indexQues >= 1 {
            indexQues = indexQues - 1
            getQuestionSelected(indexQues)
            checkButton()
            checkAnswer(indexQues - 1)
            addAnswer()
        }
        else {
            blockBT(btPre)
        }
    }
}

extension QuestionViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableQuesstion.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as? QuestionTableViewCell {
            cell.configCell(isHigilight: listSelectChoice.contains(where: {$0 == indexPath.row}))
            cell.choice.text = choiceData[indexPath.row]
            cell.answer.text = answerData[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexChoice = indexPath.row
        lisAnswerTemp.append(answerData[indexPath.row])
    }
    
}
