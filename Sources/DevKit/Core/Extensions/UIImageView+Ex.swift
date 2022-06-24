//
//  UIImageView+Ex.swift
//  Project
//
//  Created by sephilex on 2022/4/7.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

public protocol ImageSource {}

extension URL     : ImageSource {}
extension UIImage : ImageSource {}

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

public extension Reactive where Base: UIImageView {
        
    var imageSource: Binder<ImageSource?> {
        return Binder(self.base) { imageView, resource in
            imageView.isHidden = false
            if let image = resource as? UIImage {
                imageView.image = image
            } else if let url = resource as? URL {
                imageView.kf.setImage(with: url)
            } else {
                imageView.isHidden = true
            }
        }
    }
    
    func imageResource(
        placeholder: Placeholder? = nil,
        options: KingfisherOptionsInfo? = nil
    ) -> Binder<ImageSource?> {
        return Binder(self.base) { imageView, resource in
            imageView.isHidden = false
            if let image = resource as? UIImage {
                imageView.image = image
            } else if let url = resource as? URL {
                imageView.kf.setImage(with: url, placeholder: placeholder, options: options)
            } else {
                imageView.isHidden = true
            }
        }
    }
    
}
