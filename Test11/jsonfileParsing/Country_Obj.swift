//
//  Country_Obj.swift
//  Test11
//
//  Created by apple on 11/23/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation

typealias Welcome1 = [country_obj]

struct country_obj : Codable {
    let stateId : Int?
    let stateName : String?
}
