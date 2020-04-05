//
//  UIScreen+WBExtension.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/4.
//  Copyright © 2019 文波. All rights reserved.
//

import UIKit

public extension UIScreen {
    class var wb_size: CGSize {
        return UIScreen.main.bounds.size
    }
    
    class var wb_width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    class var wb_height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    @available(iOS 8.0, *)
    class var wb_orientationSize: CGSize {
        guard let app = UIApplication.wb_sharedApplication() else {
            return CGSize.zero
        }
        let systemVersion = (UIDevice.current.systemVersion as NSString).floatValue
        let isLand: Bool = app.statusBarOrientation.isLandscape
        return (systemVersion > 8.0 && isLand) ? UIScreen.wb_swapSize(self.wb_size) : self.wb_size
    }
    
    class var wb_orientationWidth: CGFloat {
        return self.wb_orientationSize.width
    }
    
    class var wb_orientationHeight: CGFloat {
        return self.wb_orientationSize.height
    }
    
    /**
     Swap size
     
     - parameter size: The target size
     
     - returns: CGSize
     */
    class var wb_DPISize: CGSize {
        let size: CGSize = UIScreen.main.bounds.size
        let scale = UIScreen.main.scale
        return CGSize(width: scale * size.width, height: scale * size.height)
    }
    
    class func wb_swapSize(_ size: CGSize) -> CGSize {
        return CGSize(width: size.height, height: size.width)
    }
    
    /// The screen's height without status bar's height
    @available(iOS 8.0, *)
    class var wb_screenHeightWithOutStatusBar: CGFloat {
        guard let app = UIApplication.wb_sharedApplication() else {
            return 0
        }
        
        if app.statusBarOrientation.isLandscape {
            return UIScreen.main.bounds.size.height - app.statusBarFrame.size.height
        }else {
            return UIScreen.main.bounds.size.width - app.statusBarFrame.height
        }
    }
}
