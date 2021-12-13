//
//  TravelPhrase.swift
//  TalkyTurkey_V1
//
//  Created by Ilgin Bedir on 23/11/21.
//

import Foundation
class TravelPhrase {
    var turkishWord : String
    var englishWord : String
    var tip : String
    
    //Constructor
    init(turkishWord: String, englishWord: String, tip: String){
        self.turkishWord = turkishWord
        self.englishWord = englishWord
        self.tip = tip
    }
    
    //Retrieves travelphrases from pList
    static func getTravelPhrases() -> Dictionary<Int, TravelPhrase>{
        var travelPhraseDictionary : Dictionary<Int, TravelPhrase> = [:]
        let travelPhrases = DataRetrieval.ImportPList(fileName: "TravelPhrases") as! Dictionary<String, Dictionary<String, String>>
        for (currentKey, currentValue) in travelPhrases{
            travelPhraseDictionary[Int(currentKey)!] = TravelPhrase(turkishWord: currentValue["turkishWord"]!, englishWord: currentValue["englishWord"]!, tip: currentValue["tip"]!)
        }
        return travelPhraseDictionary
    }
}
