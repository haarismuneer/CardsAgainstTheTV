//
//  HexColor.swift
//  CardsAgainstTheTV
//
//  Created by Haaris Muneer on 8/6/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

extension UIColor {
    class func colorWithHex(hex: String, alpha: CGFloat) -> UIColor? {
        
        if hex.characters.count != 6 {
            print("invalid hex color")
            return nil
        }
        
        let redString = hex.substringToIndex(hex.startIndex.advancedBy(2))
        let greenString = hex.substringWithRange((hex.startIndex.advancedBy(2)..<hex.startIndex.advancedBy(4)))
        let blueString = hex.substringWithRange(hex.startIndex.advancedBy(4)..<hex.endIndex)
        
        guard let
            red = Int(redString, radix: 16),
            green = Int(greenString, radix: 16),
            blue = Int(blueString, radix: 16)
            else { print("error converting hex string to integer value"); return nil }
        
        return UIColor(red: CGFloat(Float(red)/255.0), green: CGFloat(Float(green)/255.0), blue: CGFloat(Float(blue)/255.0), alpha: alpha)
        
    }
}
