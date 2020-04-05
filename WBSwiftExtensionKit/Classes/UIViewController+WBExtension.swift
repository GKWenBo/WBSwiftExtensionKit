//
//  UIViewController+WBExtension.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/4.
//  Copyright © 2019 文波. All rights reserved.
//

import UIKit

public extension UIViewController {
    /**
     UIViewController init from a inb with same name of the class.
     
     - returns: UIViewController
     */
    class func wb_initFromeNib() -> UIViewController {
        let hasNib: Bool = Bundle.main.path(forResource: self.wb_className, ofType: "nib") != nil
        guard hasNib else {
            assert(!hasNib, "Invalid parameter") // here
            return UIViewController()
        }
        return self.init(nibName: self.wb_className, bundle: nil)
    }
    
    /**
     Back to previous, pop or dismiss
     */
    func wb_backToPrevious() -> Void {
        if let navigationController = self.navigationController {
            if navigationController.viewControllers.count > 1 {
                navigationController.popViewController(animated: true)
            } else if (self.presentingViewController != nil) {
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            assert(false, "Your target ViewController doesn't have a UINavigationController")
        }
    }
}
