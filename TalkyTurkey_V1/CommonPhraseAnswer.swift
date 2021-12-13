//
//  CommonPhraseAnswer.swift
//  TalkyTurkey_V1
//
//  Created by Holden on 23/11/21.
//

import Foundation

class CommonPhraseAnswer {
    var question : Int
    var answerText : String
    var isCorrect : Bool
    //Constructor
    init(question: Int, answerText: String, isCorrect: Bool){
        self.question = question
        self.answerText = answerText
        self.isCorrect = isCorrect
    }
    //Retrieves CommonPhraseAnswer objects from pList
    static func getCommonPhraseAnswers() -> Dictionary<Int, CommonPhraseAnswer>{
        var answerDictionary : Dictionary<Int, CommonPhraseAnswer> = [:]
        let answers = DataRetrieval.ImportPList(fileName: "CommonPhrasesAnswers") as! Dictionary<String, Dictionary<String, Any>>
        for (currentKey, currentValue) in answers{
            var answerBool : Bool? = nil
            if (currentValue["isCorrect"] as! Int) == 0{
                answerBool = false
            }
            else if (currentValue["isCorrect"] as! Int) == 1 {
                answerBool = true
            }
            answerDictionary[Int(currentKey)!] = CommonPhraseAnswer(question: currentValue["question"] as! Int, answerText: currentValue["answerText"] as! String, isCorrect: answerBool!)
        }
        return answerDictionary
    }
}
