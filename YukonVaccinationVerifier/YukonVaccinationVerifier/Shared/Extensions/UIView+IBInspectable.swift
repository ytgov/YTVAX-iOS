//
//  UIView+IBInspectable.swift
//  Mindshift
//
//  Created by Mohamed Afsar on 02/06/21.
//  Copyright © 2021 Freshworks Studio Inc. All rights reserved.
//

import UIKit

internal extension UIView {
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let cgColor = self.layer.shadowColor {
                return UIColor(cgColor: cgColor)
            }
            return nil
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let cgColor = self.layer.borderColor {
                return UIColor(cgColor: cgColor)
            }
            return nil
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
}
