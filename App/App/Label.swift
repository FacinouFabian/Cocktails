//
//  Label.swift
//  App
//
//  Created by Guillaume on 26/03/2021.
//

import UIKit

@IBDesignable class Label: UILabel {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

}
