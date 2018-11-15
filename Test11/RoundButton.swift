//
//  RoundButton.swift
//  Test11
//
//  Created by apple on 11/13/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
  
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = self.frame.height/2
        clipsToBounds = true
        layer.borderColor = UIColor(red: 231.0/255.0, green: 60.0/255.0, blue: 60.0/255.0, alpha: 1.0).cgColor
        layer.borderWidth = 2
    }
   

}
