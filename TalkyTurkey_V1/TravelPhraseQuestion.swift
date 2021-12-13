//
//  TravelPhraseQuestion.swift
//  TalkyTurkey_V1
//
//  Created by Holden on 23/11/21.
//

import Foundation

class TravelPhraseQuestion{
    // Only has one value; doesn't need attributes
    //Retrieves questions from pList
    static func getTravelPhrasesQuestions() -> Dictionary<Int, String>{
        var questionDictionary : Dictionary<Int, String> = [:]
        let travelPhraseQuestions = DataRetrieval.ImportPList(fileName: "TravelPhrasesQuestions") as! Dictionary<String, String>
        for (currentKey, currentValue) in travelPhraseQuestions{
            questionDictionary[Int(currentKey)!] = currentValue
        }
        return questionDictionary
    }
}
