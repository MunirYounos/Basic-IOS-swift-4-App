//
//  CustomStylesExtensions.swift
//  iGroceryExamAssignment
//
//  Created by Munir Younos on 24/05/2018.
//  Copyright © 2018 Munir Younos. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

// found it from stack overflow and a website 

    func verticalGradientLayerforMainPage(topColor:UIColor, bottomColor:UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            topColor.cgColor,
            bottomColor.cgColor
        ]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
    }
}
