//
//  LeftAlignmentFlowLayout.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 04.12.2022.
//

import UIKit

class LeftAlignmentFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // 1. Получить атрибуты, рассчитанные системой
        guard let systemAttribues = super.layoutAttributesForElements(in: rect) else { return nil }
        let maximumSpacing = super.minimumInteritemSpacing
        // 2. Траверс
        systemAttribues.enumerated().forEach({ (arguments) in
            let (offset, attribute) = arguments
            if offset == 0 {return}
            // 2.1 Получить текущие атрибуты
            let previewLayoutAttributes = systemAttribues[offset - 1]
            let currentLayoutAttributes = attribute
            // 2.2 Получить местоположение
            let previewX = previewLayoutAttributes.frame.maxX
            let previewY = previewLayoutAttributes.frame.maxY
            let currentY = currentLayoutAttributes.frame.maxY
            // 2.3 Смена текущего кадра
            var frame = currentLayoutAttributes.frame
            frame.origin.x = previewY == currentY ? previewX + maximumSpacing : 0
            currentLayoutAttributes.frame = frame
        })
        return systemAttribues
    }

}
