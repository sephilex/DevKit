//
//  Extension.swift
//  TransHelper
//
//  Created by sephilex on 2021/5/8.
//

import UIKit
import RxSwift
import RxCocoa

public extension Reactive where Base: UIWindow {
    var darkMode: Binder<Bool> {
        return Binder(self.base) { window, switchToDark in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                let currentMode = UITraitCollection.current.userInterfaceStyle
                Log.info("current userInterfaceStyle: \(currentMode)")
                UIView.animate(withDuration: 0.35) {
                    window.overrideUserInterfaceStyle = switchToDark ? .dark : .light
                }
            }
        }
    }
}
