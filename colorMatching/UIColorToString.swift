//
//  UIColorToString.swift
//  colorMatching
//
//  Created by Anika Morris on 12/2/19.
//  Copyright © 2019 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    var name: String? {
        switch self {
        case UIColor.black: return "black"
        case UIColor.red: return "red"
        case UIColor.green: return "green"
        case UIColor.blue: return "blue"
        case UIColor.yellow: return "yellow"
        case UIColor.orange: return "orange"
        case UIColor.purple: return "purple"
        case UIColor.brown: return "brown"
        default: return nil
        }
    }
}
