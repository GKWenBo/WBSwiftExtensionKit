//
//  UIScrollView+WBExtension.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/4.
//  Copyright © 2019 文波. All righwb reserved.
//

import UIKit

extension UIScrollView {
    fileprivate struct AssociatedKeys {
        static var kKeyScrollViewVerticalIndicator = "_verticalScrollIndicator"
        static var kKeyScrollViewHorizontalIndicator = "_horizontalScrollIndicator"
    }
    
    ///  YES if the scrollView's offset is at the very top.
    public var wb_isAtTop: Bool {
        get { return self.contentOffset.y == 0.0 ? true : false }
    }
    
    ///  YES if the scrollView's offset is at the very bottom.
    public var wb_isAtBottom: Bool {
        get {
            let bottomOffset = self.contentSize.height - self.bounds.size.height
            return self.contentOffset.y == bottomOffset ? true : false
        }
    }
    
    ///  YES if the scrollView can scroll from it's current offset position to the bottom.
    public var wb_canScrollToBottom: Bool {
        get { return self.contentSize.height > self.bounds.size.height ? true : false }
    }
    
    /// The vertical scroll indicator view.
    public var wb_verticalScroller: UIView {
        get {
            if (objc_getAssociatedObject(self, #function) == nil) {
                objc_setAssociatedObject(self, #function, self.wb_safeValueForKey(AssociatedKeys.kKeyScrollViewVerticalIndicator), objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN);
            }
            return objc_getAssociatedObject(self, #function) as! UIView
        }
    }
    
    /// The horizontal scroll indicator view.
    public var wb_horizontalScroller: UIView {
        get {
            if (objc_getAssociatedObject(self, #function) == nil) {
                objc_setAssociatedObject(self, #function, self.wb_safeValueForKey(AssociatedKeys.kKeyScrollViewHorizontalIndicator), objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN);
            }
            return objc_getAssociatedObject(self, #function) as! UIView
        }
    }
    
    fileprivate func wb_safeValueForKey(_ key: String) -> AnyObject{
        let instanceVariable: Ivar = class_getInstanceVariable(type(of: self), key.cString(using: String.Encoding.utf8)!)!
        return object_getIvar(self, instanceVariable) as AnyObject;
    }
    
    
    /**
     Sewb the content offset to the top.
     
     - parameter animated: animated YES to animate the transition at a constant velocity to the new offset, NO to make the transition immediate.
     */
    public func wb_scrollToTopAnimated(_ animated: Bool) {
        if !self.wb_isAtTop {
            let bottomOffset = CGPoint.zero;
            self.setContentOffset(bottomOffset, animated: animated)
        }
    }
    
    /**
     Sewb the content offset to the bottom.
     
     - parameter animated: animated YES to animate the transition at a constant velocity to the new offset, NO to make the transition immediate.
     */
    public func wb_scrollToBottomAnimated(_ animated: Bool) {
        if self.wb_canScrollToBottom && !self.wb_isAtBottom {
            let bottomOffset = CGPoint(x: 0.0, y: self.contentSize.height - self.bounds.size.height)
            self.setContentOffset(bottomOffset, animated: animated)
        }
    }
    
    /**
     Stops scrolling, if it was scrolling.
     */
    public func wb_stopScrolling() {
        guard self.isDragging else {
            return
        }
        var offset = self.contentOffset
        offset.y -= 1.0
        self.setContentOffset(offset, animated: false)
        
        offset.y += 1.0
        self.setContentOffset(offset, animated: false)
    }
}
