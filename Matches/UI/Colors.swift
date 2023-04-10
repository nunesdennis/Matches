//
//  Colors.swift
//  Matches
//
//  Created by Dennis Nunes on 06/04/23.
//

import UIKit


extension UIColor {
    static var nero: UIColor {
        Colors.nero.uiColor()
    }
    
    static var valhalla: UIColor {
        Colors.valhalla.uiColor()
    }
    
    static var torchRed: UIColor {
        Colors.torchRed.uiColor()
    }
    
    static var white20: UIColor {
        Colors.white20.uiColor()
    }
}

private enum Colors: String {
    case nero = "#252525ff"
    case valhalla = "#272639ff"
    case torchRed = "#F42A35ff"
    case white20 = "#FAFAFA33"
    
    func uiColor() -> UIColor {
        return UIColor(hex: self.rawValue) ?? .red
    }
}
