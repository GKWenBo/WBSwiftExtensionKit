//
//  UISearchBar+WBExtension.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/4.
//  Copyright © 2019 文波. All rights reserved.
//

import UIKit

public extension UISearchBar {
    /// Get the canlcel button
    var wb_cancelButton: UIButton {
        get {
            var button = UIButton()
            for view in self.subviews {
                for subView in view.subviews {
                    if subView.isKind(of: UIButton.self) {
                        button = subView as! UIButton
                        return button
                    }
                }
            }
            return button
        }
    }
}
