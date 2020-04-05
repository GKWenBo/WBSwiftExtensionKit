//
//  UICollectionView+WBExtension.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/4.
//  Copyright © 2019 文波. All rights reserved.
//

import UIKit

public extension UICollectionView {
    /**
     Last indexPath in section
     
     - parameter section: section
     
     - returns: NSIndexPath
     */
    func wb_lastIndexPathInSection(_ section: Int) -> IndexPath? {
        return IndexPath(row: self.numberOfItems(inSection: section)-1, section: section)
    }
    
    /// Last indexPath in UICollectionView
    var wb_lastIndexPath: IndexPath? {
        if (self.wb_totalItems - 1) > 0 {
            return IndexPath(row: self.wb_totalItems-1, section: self.numberOfSections)
        } else {
            return nil
        }
    }
    
    /// Total items in UICollectionView
    var wb_totalItems: Int {
        var i = 0
        var rowCount = 0
        while i < self.numberOfSections {
            rowCount += self.numberOfItems(inSection: i)
            i += 1
        }
        return rowCount
    }
    
    /**
     Scroll to the bottom
     
     - parameter animated: animated
     */
    func wb_scrollToBottom(_ animated: Bool) {
        let section = self.numberOfSections - 1
        let row = self.numberOfItems(inSection: section) - 1
        if section < 0 || row < 0 {
            return
        }
        let path = IndexPath(row: row, section: section)
        let offset = contentOffset.y
        self.scrollToItem(at: path, at: .top, animated: animated)
        let delay = (animated ? 0.1 : 0.0) * Double(NSEC_PER_SEC)
        let time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time, execute: { () -> Void in
            if self.contentOffset.y != offset {
                self.wb_scrollToBottom(false)
            }
        })
    }
    
    /**
     Reload data without flashing
     */
    func wb_reloadWithoutFlashing() {
        UIView.setAnimationsEnabled(false)
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.reloadData()
        CATransaction.commit()
        UIView.setAnimationsEnabled(true)
    }
    
    /**
     Fetch indexPaths of UICollectionView's visibleCells
     
     - returns: NSIndexPath Array
     */
    func wb_visibleIndexPaths() -> [IndexPath] {
        var list = [IndexPath]()
        for cell in self.visibleCells {
            if let indexPath = self.indexPath(for: cell) {
                list.append(indexPath)
            }
        }
        return list
    }
    
    /**
     Fetch indexPaths of UICollectionView's rect
     
     - returns: NSIndexPath Array
     */
    func wb_indexPathsForElementsInRect(_ rect: CGRect) -> [IndexPath] {
        let allLayoutAttributes = self.collectionViewLayout.layoutAttributesForElements(in: rect)
        if (allLayoutAttributes?.count ?? 0) == 0 {return []}
        var indexPaths: [IndexPath] = []
        indexPaths.reserveCapacity(allLayoutAttributes!.count)
        for layoutAttributes in allLayoutAttributes! {
            let indexPath = layoutAttributes.indexPath
            indexPaths.append(indexPath)
        }
        return indexPaths
    }
    
    /**
     Reload data with completion block
     
     - parameter completion: completion block
     */
    func wb_reloadData(_ completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() }, completion: { _ in completion() })
        
    }
}
