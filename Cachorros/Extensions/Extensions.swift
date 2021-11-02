//
//  Extensions.swift
//  Cachorros
//
//  Created by Maria Eduarda Tupich on 29/10/21.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func coralRed() -> UIColor {
        return UIColor.rgb(red: 255, green: 64, blue: 64)
    }
}

