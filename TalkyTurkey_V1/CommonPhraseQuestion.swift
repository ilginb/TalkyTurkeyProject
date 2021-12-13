//
//  CommonPhraseQuestion.swift
//  TalkyTurkey_V1
//
//  Created by Holden on 23/11/21.
//

import Foundation

class CommonPhraseQuestion{
    // Only has one value; doesn't need attributes
    //Retrieves questions from pList
    static func getCommonPhraseQuestions() -> Dictionary<Int, String>{
        var questionDictionary : Dictionary<Int, String> = [:]
        let commonPhraseQuestions = DataRetrieval.ImportPList(fileName: "CommonPhrasesQuestions") as! Dictionary<String, String>
        for (currentKey, currentValue) in commonPhraseQuestions{
            questionDictionary[Int(currentKey)!] = currentValue
        }
        return questionDictionary
    }
}
