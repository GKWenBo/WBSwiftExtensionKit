//
//  UIButtton+WBExtension.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/1.
//  Copyright © 2019 文波. All rights reserved.
//

import UIKit

extension UIButton {
    
    /// Set UIButton's backgroundColor with a UIImage
    ///
    /// - Parameters:
    ///   - color: backgroud color
    ///   - forState: UIControlState
    func wb_setBackgroudColor(_ color: UIColor, forState: UIControl.State) -> Void {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(image, for: forState)
    }
    
    /// 添加点击事件
    /// - Parameters:
    ///   - target: target
    ///   - selector: 方法
    func wb_addTouchUpInside(_ target: Any, selector: Selector) {
        self.addTarget(target, action: selector, for: .touchUpInside)
    }
}
