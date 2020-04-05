//
//  UILabel+Extension.swift
//  WBSwiftExtension
//
//  Created by 文波 on 2019/8/4.
//  Copyright © 2019 文波. All rights reserved.
//

import UIKit

public extension UILabel {
    /**
     The content size of UILabel
     
     - returns: CGSize
     */
    func wb_contentSize() -> CGSize {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = self.lineBreakMode
        paragraphStyle.alignment = self.textAlignment
        let attributes: [NSAttributedString.Key : AnyObject] = [
            .font: self.font,
            .paragraphStyle: paragraphStyle]
        let contentSize: CGSize = self.text!.boundingRect(
            with: self.frame.size,
            options: ([.usesLineFragmentOrigin, .usesFontLeading]),
            attributes: attributes,
            context: nil
            ).size
        return contentSize
    }
    
    /**
     Set UILabel's frame with the string, and limit the width.
     
     - parameter string: text
     - parameter width:  your limit width
     */
    func wb_setFrameWithString(_ string: String, width: CGFloat) {
        self.numberOfLines = 0
        let attributes: [NSAttributedString.Key : AnyObject] = [
            .font: self.font,
        ]
        let resultSize: CGSize = string.boundingRect(
            with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
            options: NSStringDrawingOptions.usesLineFragmentOrigin,
            attributes: attributes,
            context: nil
            ).size
        let resultHeight: CGFloat = resultSize.height
        let resultWidth: CGFloat = resultSize.width
        var frame: CGRect = self.frame
        frame.size.height = resultHeight
        frame.size.width = resultWidth
        self.frame = frame
    }
}
