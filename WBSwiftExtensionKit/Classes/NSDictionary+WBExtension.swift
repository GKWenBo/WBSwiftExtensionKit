//
//  NSDictionary+WBExtension.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/4.
//  Copyright © 2019 文波. All rights reserved.
//

import Foundation

public extension NSDictionary {
    /**
     Init from json string
     
     - parameter ts_JSONString: json string
     
     - returns: NSDictionary or nil
     */
    convenience init? (wb_JSONString: String) {
        if let data = (try? JSONSerialization.jsonObject(with: wb_JSONString.data(using: String.Encoding.utf8, allowLossyConversion: true)!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? NSDictionary {
            self.init(dictionary: data)
        } else {
            self.init()
            return nil
        }
    }
    
    /**
     Make the NSDictionary to json string
     
     - returns: string or nil
     */
    func wb_formatJSON() -> String? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions()) {
            let jsonStr = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
            return String(jsonStr ?? "")
        }
        return nil
    }
}
