//
//  Color.swift
//  Circle
//
//  Created by Roman Levinzon on 10/11/2018.
//  Copyright © 2018 Roman Levinzon. All rights reserved.
//

import Foundation
import UIKit
class Color {
    var red: Float = 100
    var green: Float = 150
    var blue: Float = 200
    
    func toUIColor() -> UIColor {
        return UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1.0)
    }
    
}
