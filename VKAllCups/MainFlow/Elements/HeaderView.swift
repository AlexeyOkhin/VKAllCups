//
//  HeaderView.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 03.12.2022.
//

import UIKit

class HeaderView: UIView {
    init(label: UILabel, button: UIButton) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .headerTextColor
        addSubview(label)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.leftAnchor.constraint(equalTo: label.rightAnchor, constant: 10),
            button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        self.heightAnchor.constraint(equalTo: button.heightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
