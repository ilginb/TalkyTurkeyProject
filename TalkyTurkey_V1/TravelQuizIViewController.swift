//
//  TravelQuizIViewController.swift
//  TalkyTurkey_V1
//
//  Created by Holden on 23/11/21.
//

import UIKit

class TravelQuizIViewController: UIViewController {
    var currentQuestion : Int?
    var correctAnswer : TravelPhraseAnswer? = nil
    var shuffledAnswers : Array<TravelPhraseAnswer> = []
    var questionDictionary : Dictionary<Int, String> = [:]
    var alertMessage = ""
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var AnswerButton1: UIButton!
    @IBOutlet weak var AnswerButton2: UIButton!
    @IBOutlet weak var AnswerButton3: UIButton!
    @IBOutlet weak var AnswerButton4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if currentQuestion == nil{
            currentQuestion = 1
        }
        questionDictionary = TravelPhraseQuestion.getTravelPhrasesQuestions()
        var answerDictionary = TravelPhraseAnswer.getTravelPhraseAnswers()
        QuestionLabel.text = questionDictionary[currentQuestion!]
        answerDictionary = answerDictionary.filter {
            $0.value.question == currentQuestion
        }
        shuffledAnswers = answerDictionary.values.shuffled()
        
        AnswerButton1.setTitle(shuffledAnswers[0].answerText, for: .normal)
        AnswerButton2.setTitle(shuffledAnswers[1].answerText, for: .normal)
        AnswerButton3.setTitle(shuffledAnswers[2].answerText, for: .normal)
        AnswerButton4.setTitle(shuffledAnswers[3].answerText, for: .normal)
        correctAnswer = shuffledAnswers.first(where: {$0.isCorrect})

    }
    
    
    @IBAction func AnswerButton1Press(_ sender: UIButton) {
        if shuffledAnswers[0].isCorrect{
            alertMessage = "Correct!"
        }else{
            alertMessage = "Incorrect! The correct answer is " + correctAnswer!.answerText
        }
        currentQuestion! += 1
        if currentQuestion! > questionDictionary.count {
            alertMessage += "\nCongratulations, Quiz Completed!"
            showMessageReturnHome(value: alertMessage, controller: self)
        }
        else{
            showMessageLoadNext(value: alertMessage, controller: self)
        }
    }
    
    
    @IBAction func AnswerButton2Press(_ sender: UIButton) {
        if shuffledAnswers[1].isCorrect{
            alertMessage = "Correct!"
        }else{
            alertMessage = "Incorrect! The correct answer is " + correctAnswer!.answerText
        }
        currentQuestion! += 1
        if currentQuestion! > questionDictionary.count {
            alertMessage += "\nCongratulations, Quiz Completed!"
            showMessageReturnHome(value: alertMessage, controller: self)
        }
        showMessageLoadNext(value: alertMessage, controller: self)
    }
    
    
    @IBAction func AnswerButton3Press(_ sender: UIButton) {
        if shuffledAnswers[2].isCorrect{
            alertMessage = "Correct!"
        }else{
            alertMessage = "Incorrect! The correct answer is " + correctAnswer!.answerText
        }
        currentQuestion! += 1
        if currentQuestion! > questionDictionary.count {
            alertMessage += "\nCongratulations, Quiz Completed!"
            showMessageReturnHome(value: alertMessage, controller: self)
        }
        showMessageLoadNext(value: alertMessage, controller: self)
    }
    
    
    @IBAction func AnswerButton4Press(_ sender: UIButton) {
        if shuffledAnswers[3].isCorrect{
            alertMessage = "Correct!"
        }else{
            alertMessage = "Incorrect! The correct answer is " + correctAnswer!.answerText
        }
        currentQuestion! += 1
        if currentQuestion! > questionDictionary.count {
            alertMessage += "\nCongratulations, Quiz Completed!"
            showMessageReturnHome(value: alertMessage, controller: self)
        }
        showMessageLoadNext(value: alertMessage, controller: self)
    }
    
    func showMessageLoadNext(value:String, controller : UIViewController)
    {
        let alert = UIAlertController(title: "", message: value, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action
            in
            controller.dismiss(animated: true, completion: self.viewDidLoad)
        })
        alert.addAction(action)
        controller.present(alert, animated: true, completion: nil)
    }
    
    func showMessageReturnHome(value:String, controller : UIViewController)
    {
        let alert = UIAlertController(title: "", message: value, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action
            in
            controller.dismiss(animated: true, completion: {self.performSegue(withIdentifier: "ReturnHome", sender: nil)})
        })
        alert.addAction(action)
        controller.present(alert, animated: true, completion: nil)
    }
}
