//
//  UIApplication+Ex.swift
//  zthh
//
//  Created by sephilex on 2021/10/14.
//

import UIKit
import RxSwift
import RxCocoa

public extension UIApplication {
    
    var team: String {
        let query = [
            kSecClass as NSString: kSecClassGenericPassword as NSString,
            kSecAttrAccount as NSString: "bundleSeedID" as NSString,
            kSecAttrService as NSString: "" as NSString,
            kSecReturnAttributes as NSString: kCFBooleanTrue as NSNumber
        ] as NSDictionary
        
        var result: CFTypeRef?
        var status = Int(SecItemCopyMatching(query, &result))
        if status == Int(errSecItemNotFound) {
            status = Int(SecItemAdd(query, &result))
        }
        if status == Int(errSecSuccess),
            let attributes = result as? NSDictionary,
            let accessGroup = attributes[kSecAttrAccessGroup as NSString] as? NSString,
            let bundleSeedID = (accessGroup.components(separatedBy: ".") as NSArray).objectEnumerator().nextObject() as? String {
            return bundleSeedID
        }
        
        return ""
    }
    
    var name: String {
        self.displayName ?? self.bundleName
    }
    
    var bundleName: String {
        Bundle.main.infoDictionary?[kCFBundleNameKey as String] as! String
    }
    
    var bundleIdentifier: String {
        Bundle.main.infoDictionary?[kCFBundleIdentifierKey as String] as! String
    }
    
    var appIcon: UIImage? {
        guard let info = (Bundle.main.infoDictionary as NSDictionary?) else { return nil }
        guard let name = (info.value(forKeyPath: "CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles") as? Array<String>)?.last else { return nil }
        return UIImage(named: name)
    }
    
//    var urlScheme: String {
//        self.urlScheme(name: "app") ?? ""
//    }
    
//    @objc var pageStart: Int { 1 }
//
//    @objc var pageSize: Int { 20 }
    
//    @objc var baseApiUrl: String {
//        return "https://\(self.urlScheme).com"
//    }
//
//    @objc var baseWebUrl: String {
//        return "https://\(self.urlScheme).com"
//    }
    
//    func urlScheme(name: String) -> String? {
//        var scheme: String? = nil
//        if let types = Bundle.main.infoDictionary?["CFBundleURLTypes"] as? Array<Dictionary<String, Any>> {
//            for info in types {
//                if let urlName = info["CFBundleURLName"] as? String,
//                   urlName == name {
//                    if let urlSchemes = info["CFBundleURLSchemes"] as? [String] {
//                        scheme = urlSchemes.first
//                    }
//                }
//            }
//        }
//        return scheme
//    }

}

//extension Reactive where Base: UIApplication {
//
//    var statusBarStyle: Binder<UIStatusBarStyle> {
//        return Binder(self.base) { _, attr in
//            statusBarService.accept(attr)
//        }
//    }
//}
