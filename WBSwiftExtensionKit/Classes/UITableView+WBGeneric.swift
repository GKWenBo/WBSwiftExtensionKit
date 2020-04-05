//
//  UITableView+WBGeneric.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/4.
//  Copyright © 2019 文波. All rights reserved.
//

import UIKit

public extension UITableView {
    // MARK: - Cell register and reuse
    /**
     Register cell nib
     
     - parameter aClass: class
     */
    func wb_registerCellNib<T: UITableViewCell>(_ aClass: T.Type) {
        let name = String(describing: aClass)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forCellReuseIdentifier: name)
    }
    
    /**
     Register cell class
     
     - parameter aClass: class
     */
    func wb_registerCellClass<T: UITableViewCell>(_ aClass: T.Type) {
        let name = String(describing: aClass)
        self.register(aClass, forCellReuseIdentifier: name)
    }
    
    /**
     Reusable Cell
     
     - parameter aClass: class
     
     - returns: cell
     */
    func wb_dequeueReusableCell<T: UITableViewCell>(_ aClass: T.Type, indexPath: IndexPath) -> T! {
        let name = String(describing: aClass)
        guard let cell = dequeueReusableCell(withIdentifier: name, for: indexPath) as? T else {
            fatalError("\(name) is not registed")
        }
        return cell
    }
    
    // MARK: - HeaderFooter register and reuse
    /**
     Register cell nib
     
     - parameter aClass: class
     */
    func wb_registerHeaderFooterNib<T: UIView>(_ aClass: T.Type) {
        let name = String(describing: aClass)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: name)
    }
    
    /**
     Register cell class
     
     - parameter aClass: class
     */
    func wb_registerHeaderFooterClass<T: UIView>(_ aClass: T.Type) {
        let name = String(describing: aClass)
        self.register(aClass, forHeaderFooterViewReuseIdentifier: name)
    }
    
    /**
     Reusable Cell
     
     - parameter aClass:    class
     
     - returns: cell
     */
    func wb_dequeueReusableHeaderFooter<T: UIView>(_ aClass: T.Type) -> T! {
        let name = String(describing: aClass)
        guard let hf = dequeueReusableHeaderFooterView(withIdentifier: name) as? T else {
            fatalError("\(name) is not registed")
        }
        return hf
    }
    
}

