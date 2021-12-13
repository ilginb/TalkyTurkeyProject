//
//  VocabularyViewController.swift
//  TalkyTurkey_V1
//
//  Created by Ilgin Bedir on 15/11/21.
//

import UIKit
import OSSSpeechKit
import CoreData
//this here. 
let commonPhraseDic = CommonPhrase.getCommonPhrases()
let speechKit = OSSSpeech.shared
var x = 1
class VocabularyViewController: UIViewController {

    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var tipTextView: UITextView!
    @IBOutlet weak var englishTextView: UILabel!
    @IBOutlet weak var vocabularyTextView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        speechKit.voice = OSSVoice(quality: .enhanced, language: .Turkish)
        let i = commonPhraseDic[x]
        vocabularyTextView.text = i?.turkishWord
        englishTextView.text = i?.englishWord
        tipTextView.text = i?.tip
        speechKit.speakText(vocabularyTextView.text)
      
        
    }
    
    //Button to repeat word - Ilgin
    @IBAction func repeatButton(_ sender: UIButton) {
        // Setting the text language - Ilgin
        speechKit.voice = OSSVoice(quality: .enhanced, language: .Turkish)
        //text-to-speech - repeating the word on the flashcard - Ilgin
        speechKit.speakText(vocabularyTextView.text)
    }
    //Button to go to next flashcard - Ilgin
    @IBAction func nextButton(_ sender: UIButton) {

        if x == commonPhraseDic.count{
            //send user back to basic phrases menu once flashcards are finished - Ilgin
            message += "\n Well done! You've completed the flashcards"
            showMessageReturnToMenu(value: message, controller: self)
            //setting it back to the first flashcard for if the user returns - Ilgin
            x = 1 
        }
        else{
            x += 1
            let i = commonPhraseDic[x]
            vocabularyTextView.text = i?.turkishWord
            englishTextView.text = i?.englishWord
            tipTextView.text = i?.tip
            speechKit.speakText(vocabularyTextView.text)
        }
      
    }
    //Button to go to previous flashcard - Ilgin 
    @IBAction func previousButton(_ sender: UIButton) {

        if x > 1 {
            x -= 1
            let i = commonPhraseDic[x]
            vocabularyTextView.text = i?.turkishWord
            englishTextView.text = i?.englishWord
            tipTextView.text = i?.tip
        }
        else{
            showMessage(value: "This is the first card. Please click next.", controller: self)
        }
           
       
    }
}
