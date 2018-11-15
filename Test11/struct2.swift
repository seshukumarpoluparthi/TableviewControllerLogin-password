//
//  struct2.swift
//  Test11
//
//  Created by apple on 10/31/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit

struct Employee: Codable {
    
    let name: String
    let age: Int
    let role: Role
    
    enum Role: String, Codable {
        case manager
        case developer
        case admin
    }
}

struct Company : Codable{
    
    let name: String
    let officeLocation: Location?
    let employees: [Employee]?
}

struct Location : Codable {
    let latitude: Double
    let longitude: Double
}
