//
//  ListeningIViewController.swift
//  TalkyTurkey_V1
//
//  Created by Ilgin Bedir on 20/11/21.
//

import UIKit
import OSSSpeechKit
import CoreData
var message = ""
//displays pop up message to user
func showMessage(value:String, controller : UIViewController)
{
    var alert = UIAlertController(title: "", message: value, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: {
        action
        in
        controller.dismiss(animated: true, completion: nil)
    })
    alert.addAction(action)
    controller.present(alert, animated: true, completion: nil)
}
//displays pop up message to user and loads next page after user clicks OK
func showMessageNext(value:String, controller : UIViewController)
{
    var alert = UIAlertController(title: "", message: value, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: {
        action
        in
        controller.dismiss(animated: true, completion: controller.viewDidLoad)
    })
    alert.addAction(action)
    controller.present(alert, animated: true, completion: nil)
}
// This function should hopefully return to the menu after displaying a message and the user clicking OK while still retaining the navigation menu - Holden
func showMessageReturnToMenu(value:String, controller : UIViewController)
{
    var alert = UIAlertController(title: "", message: value, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: {
        action
        in
        controller.dismiss(animated: true, completion: {controller.performSegue(withIdentifier: "backToPhrases", sender: nil)})
    })
    alert.addAction(action)
    controller.present(alert, animated: true, completion: nil)
}

var firstItem = 1
class ListeningIViewController: UIViewController {

    @IBOutlet weak var answerTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting speechkit language to turkish
        speechKit.voice = OSSVoice(quality: .enhanced, language: .Turkish)
        //uses text-to-speech on loading
        speechKit.speakText(commonPhraseDic[firstItem]?.turkishWord)
    }
    
    //Repeats sound using OSSSpeechKit
    @IBAction func repeatButton(_ sender: UIButton) {
        speechKit.voice = OSSVoice(quality: .enhanced, language: .Turkish)
        speechKit.speakText(commonPhraseDic[firstItem]?.turkishWord)
    }
    
    
    @IBAction func submitAnswerButton(_ sender: UIButton) {
            //shows correct message if answer matches turkishWord
            if answerTextField.text == commonPhraseDic[firstItem]?.turkishWord{
                message = "Correct"
                answerTextField.text = ""
            }
            //shows incorrect message if answer does not match turkishWord
            else{
                message = "Incorrect! The correct answer is " + commonPhraseDic[firstItem]!.turkishWord
                answerTextField.text = ""
                
            }
        //goes to next index in list
        firstItem += 1
        //after the last question, shows message and navigates user back to menu
        if firstItem > commonPhraseDic.count{
            message += "\n Congratulations! You've completed the common phrases listening module"
            
            // ----- Holden -----
            showMessageReturnToMenu(value: message, controller: self)
            // ----- Holden -----
            
            firstItem = 1
        }
            
            showMessageNext(value: message, controller: self)
        
        
    }
   
}
