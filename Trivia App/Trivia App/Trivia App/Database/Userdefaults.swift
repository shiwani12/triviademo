//
//  Userdefaults.swift
//  Trivia App
//
//  Created by Shiwani manhas on 13/10/20.
//  Copyright © 2020 Shiwani manhas. All rights reserved.
//

import Foundation
extension UserDefaults
{
    func saveDtaQuestion(_ data : (saveArrDta)) {

             let encoder = JSONEncoder()
               if let encoded = try? encoder.encode(data) {

                   self.set(encoded, forKey: "saveDtaArray")
               }

               self.synchronize()
         }
    func getDta() -> (saveArrDta){
        var dtaInstrSave = saveArrDta()
            if let savedPerson = self.object(forKey: "saveDtaArray") as? Data {
                let decoder = JSONDecoder()
                if let loadedPerson = try? decoder.decode(saveArrDta.self, from: savedPerson) {
                   dtaInstrSave = loadedPerson
            }

        }
        if dtaInstrSave.arrSave.count == 0{

            return saveArrDta(arrSave: [])
        }else{
            return dtaInstrSave
        }
    }
}

