//
//  TravelListeningViewController.swift
//  TalkyTurkey_V1
//
//  Created by Ilgin Bedir on 23/11/21.
//

import UIKit
import OSSSpeechKit
var firstTravelListening = 1
class TravelListeningViewController: UIViewController {

    @IBOutlet weak var answerTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting speech to Turksih
        speechKit.voice = OSSVoice(quality: .enhanced, language: .Turkish)
        //on loading text-to-speech reads out the first word
        speechKit.speakText(travelPhraseDic[firstTravelListening]?.turkishWord)
    }
    
    //Repeats sound using OSSSpeechKit
    @IBAction func repeatButton(_ sender: UIButton) {
        speechKit.voice = OSSVoice(quality: .enhanced, language: .Turkish)
        speechKit.speakText(travelPhraseDic[firstTravelListening]?.turkishWord)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        //Checks if answer is the same as turkishWord. Shows correct message if it is
            if answerTextField.text == travelPhraseDic[firstTravelListening]?.turkishWord{
                message = "Correct!"
                answerTextField.text = ""
            }
        //shows incorrect message if answer input is different to turkishWord
            else{
                message = "Incorrect! The correct answer is " + travelPhraseDic[firstTravelListening]!.turkishWord
                answerTextField.text = ""
                
            }
        //goes to next item in the list
        firstTravelListening += 1
        //after the last question navigates user back to menu
        if firstTravelListening > travelPhraseDic.count{
            message += "\n Congratulations! You've completed the travel listening module"
            showMessageReturnToTravelMenu(value: message, controller: self)
            firstTravelListening = 1
        }
        showMessageNext(value: message, controller: self)
    }
    
    

}
