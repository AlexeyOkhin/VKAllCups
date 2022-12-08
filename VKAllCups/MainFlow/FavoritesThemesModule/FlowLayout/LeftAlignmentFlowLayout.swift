//
//  LeftAlignmentFlowLayout.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 04.12.2022.
//

import UIKit

class LeftAlignmentFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        guard let systemAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
        let maximumSpacing = super.minimumInteritemSpacing

        systemAttributes.enumerated().forEach({ (arguments) in
            let (offset, attribute) = arguments
            if offset == 0 { return }
            
            let previewLayoutAttributes = systemAttributes[offset - 1]
            let currentLayoutAttributes = attribute

            let previewX = previewLayoutAttributes.frame.maxX
            let previewY = previewLayoutAttributes.frame.maxY
            let currentY = currentLayoutAttributes.frame.maxY
            
            var frame = currentLayoutAttributes.frame
            frame.origin.x = previewY == currentY ? previewX + maximumSpacing : 0
            currentLayoutAttributes.frame = frame
        })
        return systemAttributes
    }

}
