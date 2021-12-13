//
//  TravelPhraseAnswer.swift
//  TalkyTurkey_V1
//
//  Created by Holden on 23/11/21.
//

import Foundation

class TravelPhraseAnswer {
    var question : Int
    var answerText : String
    var isCorrect : Bool
    
    //Constructor
    init(question: Int, answerText: String, isCorrect: Bool){
        self.question = question
        self.answerText = answerText
        self.isCorrect = isCorrect
    }
    //Retrieves travelPhraseAnswers from pList
    static func getTravelPhraseAnswers() -> Dictionary<Int, TravelPhraseAnswer>{
        var answerDictionary : Dictionary<Int, TravelPhraseAnswer> = [:]
        let answers = DataRetrieval.ImportPList(fileName: "TravelPhrasesAnswers") as! Dictionary<String, Dictionary<String, Any>>
        for (currentKey, currentValue) in answers{
            var answerBool : Bool? = nil
            if (currentValue["isCorrect"] as! Int) == 0{
                answerBool = false
            }
            else if (currentValue["isCorrect"] as! Int) == 1 {
                answerBool = true
            }
            answerDictionary[Int(currentKey)!] = TravelPhraseAnswer(question: currentValue["question"] as! Int, answerText: currentValue["answerText"] as! String, isCorrect: answerBool!)
        }
        return answerDictionary
    }
}
