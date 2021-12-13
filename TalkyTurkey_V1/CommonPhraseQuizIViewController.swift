//
//  CommonPhraseQuizIViewController.swift
//  TalkyTurkey_V1
//
//  Created by Ilgin Bedir on 20/11/21.
//

import UIKit

var phraseQuestion : Int?
let shuffledPhrases = commonPhraseDic.values.shuffled()
class CommonPhraseQuizIViewController: UIViewController {

    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var questionTextField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //sets question index to 0 on load
        if phraseQuestion == nil{
            phraseQuestion = 0
        }
       //setting the questionTextField to the question
        questionTextField.text = shuffledPhrases[phraseQuestion!].englishWord
    }
    

   
    @IBAction func submitAnswerButton(_ sender: UIButton) {
        
            //show correct message if the textfield matches turkishWord
            if answerTextField.text == shuffledPhrases[phraseQuestion!].turkishWord{
                message = "Correct!"
                answerTextField.text = ""
            }
            //show incorrect message if textfield does not match turkishWord
            else{
                
                message = "Incorrect! The correct answer is " + shuffledPhrases[phraseQuestion!].turkishWord
                answerTextField.text = ""
            }
        //set index to next question
        phraseQuestion! += 1
        //after last question return user back to menu
        if phraseQuestion! == shuffledPhrases.count{
            message += "\n Congratulations! You've completed the common phrases translation module"
            showMessageReturnToMenu(value: message, controller: self)
            phraseQuestion = 0
        }
        //display message box
        showMessageNext(value: message, controller: self)
    }
    
}
