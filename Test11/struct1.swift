//
//  struct1.swift
//  Test11
//
//  Created by apple on 10/31/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit
struct User {
    private let firstName: String
    private let lastName: String
}

extension User: CustomStringConvertible {
    
    var description: String {
        
        return "User: \(firstName) \(lastName)"
    }
}
