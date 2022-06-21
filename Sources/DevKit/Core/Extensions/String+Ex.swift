//
//  String+ex.swift
//  zthh
//
//  Created by sephilex on 2021/10/14.
//

import UIKit
import SwifterSwift

extension String {
    init<Subject>(fullname subject: Subject) {
        self.init(reflecting: subject)
        if let displayName = UIApplication.shared.displayName {
            self = self.replacingOccurrences(of: "\(displayName).", with: "")
        }
        self = self.replacingOccurrences(of: UIApplication.shared.bundleName + ".", with: "")
    }
    
    func decimal() -> String {
        let number = NSNumber(value: Double(self) ?? 0)
        let decimal = NumberFormatter.localizedString(from: number, number: .decimal)
        return decimal
    }
}
