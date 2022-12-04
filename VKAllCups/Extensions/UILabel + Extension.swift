//
//  UILabel + Extension.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 03.12.2022.
//

import UIKit

extension UILabel {
    convenience init(name: String, font: UIFont? = .sfPro16(weight: 0.4)) {
        self.init()
        self.text = name
        self.font = font
    }
}
