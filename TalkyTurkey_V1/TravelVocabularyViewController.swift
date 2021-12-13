//
//  TravelVocabularyViewController.swift
//  TalkyTurkey_V1
//
//  Created by Ilgin Bedir on 23/11/21.
//

import UIKit
import OSSSpeechKit
//retrieve all travel phrases
let travelPhraseDic = TravelPhrase.getTravelPhrases()
var firstTravelPhrase = 1
class TravelVocabularyViewController: UIViewController {

    @IBOutlet weak var tipTextView: UITextView!
    @IBOutlet weak var englishTextField: UILabel!
    @IBOutlet weak var turkishTextField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting speech language to Turkish
        speechKit.voice = OSSVoice(quality: .enhanced, language: .Turkish)
        let i = travelPhraseDic[firstTravelPhrase]
        turkishTextField.text = i?.turkishWord
        englishTextField.text = i?.englishWord
        tipTextView.text = i?.tip
        speechKit.speakText(turkishTextField.text)
    }
    
    //repeats sound using OSSSpeechKit
    @IBAction func repeatButton(_ sender: UIButton) {
        speechKit.voice = OSSVoice(quality: .enhanced, language: .Turkish)
        speechKit.speakText(turkishTextField.text)
    }
    //Button to go to next flashcard 
    @IBAction func nextButton(_ sender: UIButton) {
        if firstTravelPhrase == travelPhraseDic.count{
            message += "\n Well done! You've completed the travel flashcards."
            showMessageReturnToTravelMenu(value: message, controller: self)
            firstTravelPhrase = 1
        }
        else{
            firstTravelPhrase += 1
            let i = travelPhraseDic[firstTravelPhrase]
            turkishTextField.text = i?.turkishWord
            englishTextField.text = i?.englishWord
            tipTextView.text = i?.tip
            speechKit.speakText(turkishTextField.text)
        }
    }
    //Button to go to previous flashcard 
    @IBAction func previousButton(_ sender: UIButton) {
        if firstTravelPhrase > 1 {
            firstTravelPhrase -= 1
            let i = travelPhraseDic[firstTravelPhrase]
            turkishTextField.text = i?.turkishWord
            englishTextField.text = i?.englishWord
            tipTextView.text = i?.tip
        }
        else{
            showMessage(value: "This is the first card. Please click next.", controller: self)
        }
        
    }
}
