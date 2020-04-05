//
//  UIApplication+WBExtension.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/4.
//  Copyright © 2019 文波. All rights reserved.
//

import UIKit

extension UIApplication {
    public class func wb_sharedApplication() -> UIApplication? {
        let selector = NSSelectorFromString("sharedApplication")
        guard UIApplication.responds(to: selector) else {
            return nil
        }
        return UIApplication.perform(selector)?.takeUnretainedValue() as? UIApplication
    }
}
