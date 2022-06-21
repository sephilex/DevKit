//
//  Extension.swift
//  TransHelper
//
//  Created by sephilex on 2021/5/8.
//

import Foundation
import RxSwift
import RxCocoa

public extension Reactive where Base: UIWindow {
    var isDarkMode: Binder<Bool> {
        return Binder(self.base) { window, isOn in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                let currentMode = UITraitCollection.current.userInterfaceStyle
                if (currentMode == .dark) {
                    print("深色模式")
                } else if (currentMode == .light) {
                    print("浅色模式")
                } else {
                    print("未知模式")
                }
                UIView.animate(withDuration: 0.35) {
                    window.overrideUserInterfaceStyle = isOn ? .dark : .light
                }
            }
        }
    }
}
