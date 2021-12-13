//
//  TravelQuizViewController.swift
//  TalkyTurkey_V1
//
//  Created by Ilgin Bedir on 23/11/21.
//

import UIKit
var firstTravelTranslation = 1
var travelPhraseQuestion : Int?
let shuffledTravelPhrases = travelPhraseDic.values.shuffled()

//navigates user back to menu
func showMessageReturnToTravelMenu(value:String, controller : UIViewController)
{
    var alert = UIAlertController(title: "", message: value, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: {
        action
        in
        controller.dismiss(animated: true, completion: {controller.performSegue(withIdentifier: "backToTravel", sender: nil)})
    })
    alert.addAction(action)
    controller.present(alert, animated: true, completion: nil)
}

class TravelQuizViewController: UIViewController {

    @IBOutlet weak var englishTextView: UITextView!
    @IBOutlet weak var answerTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //englishTextView.text = travelPhraseDic[firstTravelTranslation]?.englishWord
        //sets question index to 0 on load
        if travelPhraseQuestion == nil{
            travelPhraseQuestion = 0
        }
       //setting the questionTextField to the question
        englishTextView.text = shuffledTravelPhrases[travelPhraseQuestion!].englishWord
    }
    

    @IBAction func submitButton(_ sender: Any) {
       
        //show correct message if the textfield matches turkishWord
        if answerTextField.text == shuffledTravelPhrases[travelPhraseQuestion!].turkishWord{
            message = "Correct!"
            answerTextField.text = ""
        }
        //show incorrect message if textfield does not match turkishWord
        else{
            
            message = "Incorrect! The correct answer is " + shuffledTravelPhrases[travelPhraseQuestion!].turkishWord
            answerTextField.text = ""
        }
    //set index to next question
    travelPhraseQuestion! += 1
    //after last question return user back to menu
    if travelPhraseQuestion! == shuffledTravelPhrases.count{
        message += "\n Congratulations! You've completed the travel translation module"
        showMessageReturnToTravelMenu(value: message, controller: self)
        travelPhraseQuestion = 0
    }
    //display pop up message
    showMessageNext(value: message, controller: self)
    }
    

}
