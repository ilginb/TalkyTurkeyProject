//
//  CommonPhrase.swift
//  TalkyTurkey_V1
//
//  Created by Holden on 22/11/21.
//

import Foundation

class CommonPhrase {
    var turkishWord : String
    var englishWord : String
    var tip : String
    
    //Constructor
    init(turkishWord: String, englishWord: String, tip: String){
        self.turkishWord = turkishWord
        self.englishWord = englishWord
        self.tip = tip
    }
    //Retrieves CommonPhrase objects from pList
    static func getCommonPhrases() -> Dictionary<Int, CommonPhrase>{
        var phraseDictionary : Dictionary<Int, CommonPhrase> = [:]
        let commonPhrases = DataRetrieval.ImportPList(fileName: "CommonPhrases") as! Dictionary<String, Dictionary<String, String>>
        for (currentKey, currentValue) in commonPhrases{
            phraseDictionary[Int(currentKey)!] = CommonPhrase(turkishWord: currentValue["turkishWord"]!, englishWord: currentValue["englishWord"]!, tip: currentValue["tip"]!)
        }
        return phraseDictionary
    }
}
