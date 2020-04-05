//
//  Bool+WBExtension.swift
//  Pods
//
//  Created by 文波 on 2019/12/17.
//

// MARK: - Properties
public extension Bool {
    
    /// Return 1 if true, or 0 if false.
    ///
    ///        false.int -> 0
    ///        true.int -> 1
    ///
    var wb_int: Int {
        return self ? 1 : 0
    }
    
    /// Return "true" if true, or "false" if false.
    ///
    ///        false.string -> "false"
    ///        true.string -> "true"
    ///
    var wb_string: String {
        return self ? "true" : "false"
    }
}
