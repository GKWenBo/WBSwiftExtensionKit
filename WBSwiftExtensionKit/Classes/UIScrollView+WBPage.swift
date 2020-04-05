//
//  UIScrollView+WBPage.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/4.
//  Copyright © 2019 文波. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    /// All pages
    public var wb_pages: Int {
        get {
            let pages = Int(self.contentSize.width / self.frame.size.width)
            return pages
        }
    }
    
    public var wb_currentPage: Int {
        get {
            let pages = Float(self.contentSize.width / self.frame.size.width);
            let scrollPercent = Float(self.wb_scrollPercent)
            let currentPage = roundf((pages - 1)*scrollPercent)
            return Int(currentPage)
        }
    }
    
    public var wb_scrollPercent: CGFloat {
        get {
            let width = self.contentSize.width - self.frame.size.width
            let scrollPercent = self.contentOffset.x / width
            return scrollPercent
        }
    }
    
    /**
     Set the horizontal UIScrollView to specified page
     
     - parameter page:     Page number
     - parameter animated: Animated
     */
    public func wb_setPageX(_ page: Int, animated: Bool? = nil) {
        let pageWidth = self.frame.size.width;
        let offsetY = self.contentOffset.y;
        let offsetX = CGFloat(page) * pageWidth;
        let offset = CGPoint(x: offsetX, y: offsetY);
        if animated == nil {
            self.setContentOffset(offset, animated: false)
        } else {
            self.setContentOffset(offset, animated: animated!)
        }
    }
    
    /**
     Set the vertical UIScrollView to specified page
     
     - parameter page:     Page number
     - parameter animated: Animated
     */
    public func wb_setPageY(_ page: Int, animated: Bool? = nil) {
        let pageHeight = self.frame.size.height;
        let offsetX = self.contentOffset.x;
        let offsetY = CGFloat(page) * pageHeight;
        let offset = CGPoint(x: offsetX, y: offsetY);
        if animated == nil {
            self.setContentOffset(offset, animated: false)
        } else {
            self.setContentOffset(offset, animated: animated!)
        }
    }
}
