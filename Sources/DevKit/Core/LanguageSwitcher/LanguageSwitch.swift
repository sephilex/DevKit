//
//  LanguageSwitch.swift
//  Project
//
//  Created by sephilex on 2022/6/30.
//

import Foundation

class BundleEx: Bundle {
    
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundle = languageBundle() {
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        } else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}

extension Bundle {
    //代替dispatch_once
    private static var onLanguageDispatchOnce: ()->Void = {
        object_setClass(Bundle.main, BundleEx.self)
    }
    func onLanguage() {
        //替换NSBundle.mainBundle()的class为自定义的BundleEx，这样一来我们就可以重写方法
        Bundle.onLanguageDispatchOnce()
    }
    //当前语言的bundle
    func languageBundle() -> Bundle? {
        return LanguageSwitcher.shared.currentLanguageBundle
    }
}

private let kSystemLanguage = "AppleLanguages"
let systemLanguage = (UserDefaults.standard.value(forKey: kSystemLanguage) as! Array<String>)[0]

open class LanguageSwitcher: NSObject {
    
    public static let shared = LanguageSwitcher()
    internal var currentLanguage:String?
    
    //当前语言Bundle
    internal var currentLanguageBundle:Bundle?
    
    public func resetDefault() {
        setLanguage(language: "jwiofwoj")
    }
    
    public func setLanguage(language: String) {
        if(self.currentLanguage == language){
            return
        }
        if let path = Bundle.main.path(forResource: language, ofType: "lproj" ),let bundel = Bundle(path:path) {
            // 加载指定语言
            self.currentLanguageBundle = bundel
            self.currentLanguage = language
        }else if let path = Bundle.main.path(forResource: systemLanguage, ofType: "lproj" ),let bundel = Bundle(path:path) {
            // 如果无法加载指定语言，则加载系统语言
            self.currentLanguageBundle = bundel
            self.currentLanguage = language
        } else if systemLanguage.contains("zh") {
            // zh-Hans-CN zh-Hant-HK zh-Hant-MO zh-Hant-TW
            // 适配中文，港澳台、大陆一律加载简体中文
            let chineseLanguage = "zh-Hans"
            self.currentLanguageBundle =  Bundle(path:Bundle.main.path(forResource: chineseLanguage, ofType: "lproj" )!)
            self.currentLanguage = chineseLanguage
        }else {
            //如果不支持当前语言则加载info中Localization native development region中的值的lporj
            let defaultLanguage = (Bundle.main.infoDictionary! as NSDictionary).value(forKey: kCFBundleDevelopmentRegionKey as String) as! String
            self.currentLanguageBundle =  Bundle(path:Bundle.main.path(forResource: defaultLanguage, ofType: "lproj" )!)
            self.currentLanguage = defaultLanguage
        }
        Bundle.main.onLanguage()
    }
}
