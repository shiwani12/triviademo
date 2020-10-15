//
//  SaveLocalDataModal.swift
//  Trivia App
//
//  Created by Shiwani manhas on 13/10/20.
//  Copyright © 2020 Shiwani manhas. All rights reserved.
//

import Foundation
struct saveArrDta: Codable {
    var arrSave = [saveData]()
}
struct saveData : Codable{
    var date : String
    var name : String
    var dtaquestion : [dtaQuestion]
}
struct dtaQuestion : Codable{
    var question : String
    var answer : String
}
