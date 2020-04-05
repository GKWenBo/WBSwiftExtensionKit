//
//  UIButton+WBTouchArea.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/1.
//  Copyright © 2019 文波. All rights reserved.
//

#if canImport(UIKit)
import UIKit

private var wb_touchAreaEdgeInsets: UIEdgeInsets = .zero

// MARK: Properties
public extension UIButton {
    
    /// Increase your button touch area.
    /// If your button frame is (0,0,40,40). Then call button.ts_touchInsets = UIEdgeInsetsMake(-30, -30, -30, -30), it will Increase the touch area
        var wb_touchInsets: UIEdgeInsets {
        get {
            if let value = objc_getAssociatedObject(self, &wb_touchAreaEdgeInsets) as? NSValue {
                var edgeInsets: UIEdgeInsets = .zero
                value.getValue(&edgeInsets)
                return edgeInsets
            }else {
                return .zero
            }
        }
        set(newValue) {
            var newValueCopy = newValue
            let objcType = NSValue(uiEdgeInsets: .zero).objCType
            let value = NSValue(&newValueCopy, withObjCType: objcType)
            objc_setAssociatedObject(self, &wb_touchAreaEdgeInsets, value, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
        override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if self.wb_touchInsets == .zero || !self.isEnabled || self.isHidden {
            return super.point(inside: point, with: event)
        }
        
        let relativeFrame = self.bounds
        
        let hitFrame = relativeFrame.inset(by: self.wb_touchInsets)
        return hitFrame.contains(point)
    }
}

#endif
