//
//  UIView+Extension.swift
//  WBSwiftExtension
//
//  Created by WenBo on 2019/8/2.
//  Copyright © 2019 文波. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// 获取view所在控制器
    var wb_viewController: UIViewController? {
        get {
            var n = next
            while n != nil {
                if n is UIViewController {
                    return n as? UIViewController
                }
                n = n?.next
            }
            return nil
        }
    }
}
