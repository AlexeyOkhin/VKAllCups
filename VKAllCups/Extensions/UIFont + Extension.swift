//
//  UIFont + Extension.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 03.12.2022.
//

import UIKit

extension UIFont {
    static func sfPro16(weight: CGFloat) -> UIFont? {
        return UIFont.systemFont(ofSize: 16, weight: .init(weight))
    }
    
    static func sfPro18(weight: CGFloat) -> UIFont? {
        return UIFont.systemFont(ofSize: 18, weight: .init(weight))
    }
}
