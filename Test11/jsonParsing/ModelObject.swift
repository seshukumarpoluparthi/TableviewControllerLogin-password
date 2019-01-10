//
//  ModelObject.swift
//  Test11
//
//  Created by apple on 11/24/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
struct ModelZones: Codable {
    let status: String
    let errorCode, errorMessage, exceptionType: String?
    let result: [farm_obj]
}

struct farm_obj: Codable {
   // let type : String
    let id : Int
    let farmName : String
    let fieldsList : [field_obj]
}
struct field_obj : Codable {
    let id : Int
   // let farmName : String
    let fieldName : String
}
