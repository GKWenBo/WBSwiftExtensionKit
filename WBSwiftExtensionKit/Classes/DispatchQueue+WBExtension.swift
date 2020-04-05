//
//  DispatchQueue+WBExtension.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/4.
//  Copyright © 2019 文波. All rights reserved.
//

#if canImport(Dispatch)
import Dispatch

// MARK: - Methods
public extension DispatchQueue {
    // This method will dispatch the `block` to self.
    // If `self` is the main queue, and current threxad is main thread, the block
    // will be invoked immediately instead of being dispatched.
    func wb_safeAsync(_ block: @escaping ()->()) {
        if self === DispatchQueue.main && Thread.isMainThread {
            block()
        } else {
            async { block() }
        }
    }
    
    static func wb_isCurrent(_ queue: DispatchQueue) -> Bool {
        let key = DispatchSpecificKey<Void>()
        queue.setSpecific(key: key, value: ())
        defer {
            queue.setSpecific(key: key, value: nil)
        }
        return DispatchQueue.getSpecific(key: key) != nil
    }
    
}

// MARK: - Properties
public extension DispatchQueue {
    /// A Boolean value indicating whether the current dispatch queue is the main queue.
    static var wb_isMainQueue: Bool {
        enum Static {
            static var key: DispatchSpecificKey<Void> = {
                let key = DispatchSpecificKey<Void>()
                DispatchQueue.main.setSpecific(key: key, value: ())
                return key
            }()
        }
        return DispatchQueue.getSpecific(key: Static.key) != nil
    }
}

#endif
