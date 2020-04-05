//
//  UIControl+WBExtension.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/4.
//  Copyright © 2019 文波. All rights reserved.
//

import UIKit

fileprivate class WBClosureWrapper: NSObject {
    let _callback: () -> Void
    init(callback: @escaping () -> (Void)) {
        _callback = callback
    }
    
    @objc func invoke() {
        _callback()
    }
}

fileprivate var kWBAssociatedClosure: UInt8 = 0
public extension UIControl {
    func wb_addEventHandler(forControlEvent controlEvent: UIControl.Event, handler callback: @escaping () -> Void) {
        let wrapper = WBClosureWrapper(callback: callback)
        addTarget(wrapper, action: #selector(WBClosureWrapper.invoke), for: controlEvent)
        objc_setAssociatedObject(self, &kWBAssociatedClosure, wrapper, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}
