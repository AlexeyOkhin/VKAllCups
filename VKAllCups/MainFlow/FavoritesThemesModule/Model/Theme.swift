//
//  Theme.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 04.12.2022.
//

import Foundation

struct Theme: Decodable {
    let themeName: String
    let rating: Int
    var isFavorite: Bool?
}
