//
//  DataRetrieval.swift
//  TalkyTurkey_V1
//
//  Created by Holden on 22/11/21.
//

import Foundation

class DataRetrieval{
    static func ImportPList(fileName: String) -> Dictionary<String, Any>{
        let path = Bundle.main.path(forResource: fileName, ofType: "plist")
        let xml = FileManager.default.contents(atPath: path!)
        let result : Dictionary<String, Any>!
        result = try? PropertyListSerialization.propertyList(from: xml!, options: .mutableContainersAndLeaves, format: nil) as? Dictionary<String, Any>
        return result
    }
}
