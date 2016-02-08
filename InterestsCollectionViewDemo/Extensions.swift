//
//  Extensions.swift
//  InterestsCollectionViewDemo
//
//  Created by Parker Rushton on 2/5/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class BorderView: UIView {
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            configureFrame()
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.darkGrayColor() {
        didSet {
            configureColor()
        }
    }
    
    func configureFrame() {
        frame = CGRectInset(self.frame, -borderWidth, -borderWidth)
        layer.borderColor = borderColor.CGColor
        layer.borderWidth = borderWidth
    }
    
    func configureColor() {
        layer.borderColor = borderColor.CGColor
    }
    
}

extension UIColor {
    
    class func welbeBlue() -> UIColor {
        return UIColor(hex: 0x4A90E2)
    }
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex >> 16) & 0xFF)/255.0
        let green = CGFloat((hex >> 8) & 0xFF)/255.0
        let blue = CGFloat((hex) & 0xFF)/255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
