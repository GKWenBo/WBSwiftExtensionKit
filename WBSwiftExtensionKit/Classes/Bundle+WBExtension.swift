//
//  Bundle+WBExtension.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/4.
//  Copyright © 2019 文波. All rights reserved.
//

import Foundation
import UIKit

public extension Bundle {
    /// The app's name
    static var wb_appDisplayName: String? {
        return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
    }
    
    /// The app's bundle name
    static var wb_bundleName: String {
        return Bundle.main.infoDictionary!["CFBundleName"] as! String
    }
    
    /// The app's version
    static var wb_appVersion: String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
    /// The app's build number
    static var wb_appBuild: String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    }
    
    /// The app's bundle identifier
    static var wb_bundleIdentifier: String {
        return Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
    }
    
    /// The app's version and build number
    static var wb_appVersionAndBuild: String {
        let version = wb_appVersion, build = wb_appBuild
        return version == build ? "v\(version)" : "v\(version)(\(build))"
    }
    
    /// App's icon file path
    class var wb_iconFilePath: String {
        let iconFilename = Bundle.main.object(forInfoDictionaryKey: "CFBundleIconFile")
        let iconBasename = (iconFilename as! NSString).deletingPathExtension
        let iconExtension = (iconFilename as! NSString).pathExtension
        return Bundle.main.path(forResource: iconBasename, ofType: iconExtension)!
    }
    
    /// App's icon image
    class func wb_iconImage() -> UIImage? {
        guard let image = UIImage(contentsOfFile:self.wb_iconFilePath) else {
            return nil
        }
        return image
    }
}

