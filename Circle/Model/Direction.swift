//
//  Direction.swift
//  Circle
//
//  Created by Roman Levinzon on 12/11/2018.
//  Copyright © 2018 Roman Levinzon. All rights reserved.
//

import Foundation
import UIKit

enum  Direction {
    case up
    case down
    case left
    case right
   
    static func from(_ point: CGPoint) -> Direction {
        let x = point.x
        let y = point.y
        print("\(x) \(y)")
        // Check general direction
        
        // UP or Down
        if (abs(x) < abs(y)) {
            // up
            if (y < 0) {
                return .up
            } else {
                return .down
            }
        } else {
            if (x < 0) {
                return .left
            } else {
                return .right
            }
        }
        
        
    }
    
    static func diff(_ x: Int, _ y: Int) -> Bool {
        return abs(x) > abs(y)
    }
    

    
    
}
