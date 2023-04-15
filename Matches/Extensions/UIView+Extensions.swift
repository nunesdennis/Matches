//
//  UIView+Extensions.swift
//  Matches
//
//  Created by Dennis Nunes on 15/04/23.
//

import UIKit

extension UIView {
    func fadeIn(_ duration: TimeInterval = 1.0,
                delay: TimeInterval = 0.0,
                completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: { [unowned self] in
                            alpha = 1.0
                        }, completion: completion)
    }
 
    func fadeOut(_ duration: TimeInterval = 1.0,
                 delay: TimeInterval = 0.0,
                 completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: { [unowned self] in
                            alpha = 0.0
                        }, completion: completion)
    }
}
