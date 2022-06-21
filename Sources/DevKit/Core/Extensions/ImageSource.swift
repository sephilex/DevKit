//
//  ImageSource.swift
//  Project
//
//  Created by sephilex on 2022/4/7.
//

import UIKit

public protocol ImageSource {

}

extension URL: ImageSource {}
extension UIImage: ImageSource {}

extension ImageSource {
    public static func compareImage(_ left: ImageSource?, _ right: ImageSource?) -> Bool {
        if let lImage = left as? UIImage,
           let rImage = right as? UIImage {
            return lImage == rImage
        }
        if let lURL = left as? URL,
           let rURL = right as? URL {
            return lURL == rURL
        }
        return false
    }
}
