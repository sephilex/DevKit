//
//  UIImage+Ex.swift
//  Project
//
//  Created by sephilex on 2022/3/8.
//

import UIKit

public extension UIImage {
    
//    fileprivate class func image(name: String) -> UIImage {
//        var image = UIImage(named: name, in: Bundle.main, compatibleWith: nil)
//        if image == nil {
//            let bundle = Bundle(path: Bundle(module: "SWFrame")!.path(forResource: "SWFrame", ofType: "bundle")!)
//            image = UIImage(named: name, in: bundle, compatibleWith: nil)
//        }
//        return image!
//    }
    fileprivate class func image(name: String) -> UIImage {
        return UIImage(named: name)!
    }
    
//    static var back: UIImage {
//        return self.image(name: "back")
//    }
//
//    static var close: UIImage {
//        return self.image(name: "close")
//    }
//
//    static var indicator: UIImage {
//        return self.image(name: "indicator")
//    }
//
//    static var loading: UIImage {
//        return self.image(name: "loading")
//    }
//
//    static var waiting: UIImage {
//        return self.image(name: "waiting")
//    }
//
//    static var networkError: UIImage {
//        return self.image(name: "errorNetwork")
//    }
//
//    static var serverError: UIImage {
//        return self.image(name: "errorServer")
//    }
//
//    static var emptyError: UIImage {
//        return self.image(name: "errorEmpty")
//    }
//
//    static var expireError: UIImage {
//        return self.image(name: "errorExpire")
//    }
    
}
