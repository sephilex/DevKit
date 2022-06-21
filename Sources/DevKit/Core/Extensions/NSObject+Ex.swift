//
//  NSObject+Ex.swift
//  TransHelper
//
//  Created by sephilex on 2021/10/17.
//

import UIKit

public extension NSObject {
    
    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    var className: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
    
}
