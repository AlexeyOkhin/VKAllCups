//
//  UIColor + Extension.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 03.12.2022.
//

import UIKit

//MARK: - HEX Color

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

    convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
    
    static let headerTextColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.45)
    static let headerButtonColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.12)
    static let headerTitleButtonColor = UIColor(rgb: 0xFFFFFF)
    static let themeTitleColor = UIColor(rgb: 0xFFFFFF)
    static let themeCellColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.17)
    static let themeCellColorIsSelected = UIColor(rgb: 0xFF5317)
    static let deviderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.27)
    
    
}

