//
//  NSObject+WBExtension.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/4.
//  Copyright © 2019 文波. All rights reserved.
//

import UIKit

public extension NSObject {
    /// The class's name
    class var wb_className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last! as String
    }
    
    class var wb_identifier: String {
        return String(format: "%@_identifier", self.wb_className)
    }
}
