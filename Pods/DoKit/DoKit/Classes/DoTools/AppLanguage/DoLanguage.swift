//
//  DoLanguage.swift
//  NoWhite
//
//  Created by deepin do on 2020/2/28.
//  Copyright © 2020 deepin do. All rights reserved.
//

// 语言对应的lproj文件
/*
 英语(en.lproj) ??? en-CN
 简体中文(zh-Hans.lproj)
 繁体中文(zh-Hant.lproj)
 繁体中文(香港)(zh-HK.lproj)
 繁体中文(台湾)(zh-Hant-TW.lproj)
 法语(fr.lproj)
 德语(de.lproj)
 意大利语(it.lproj)
 日语(ja.lproj)
 韩语(ko.lproj)
 葡萄牙语(葡萄牙)(pt-PT.lproj)
 俄语(ru.lproj)
 西班牙语(西班牙)(es.lproj)
 荷兰语(nl.lproj)
 泰语(th.lproj)
 阿拉伯语(ar-001.lproj)
*/

import Foundation


open class DoLanguage: NSObject {
    
    /// 单例管理
    public static let shared = DoLanguage()
    
    // MARK: - 设置当前国际化所显示语言
    
    public func setUserLanguage(_ key: String) {
        
        /// 系统语言库
        let languages = Bundle.main.localizations
        
        /** 重置系统语言
          * 设置语言值为空，或者设置值不在系统语言表中
         */
        if key == "" || !languages.contains(key) {
            resetToSystemLanguage()
            return
        }
        
        /// 存储用户自定义的language
        kUserDefaults.setValue(key, forKey: kUserLanguageKey)
        kUserDefaults.setValue([key], forKey: "AppleLanguages") // 系统语言key
        kUserDefaults.synchronize()
        
        /// 发通知-修改语言
        //NotificationCenter.default.post(name: NSNotification.Name(DDLanguageChangeNotification), object: nil, userInfo: nil)
    }
    
    
    // MARK: - 重置为系统语言
    
    private func resetToSystemLanguage() {
        kUserDefaults.removeObject(forKey: kUserLanguageKey)
        kUserDefaults.setValue(nil, forKey: "AppleLanguages") // 系统语言key
        kUserDefaults.synchronize()
    }
    
    
    // MARK: - 获取当前语言
    
    public func userLanguage() -> String {
        
        /// runtime先调用
        //Bundle.main.swizzledClass()
        Bundle.main.onLanguage()
        
        /// 判断有没有存储的key
        if let language = kUserDefaults.value(forKey: kUserLanguageKey) {
            return language as! String
        } else {
            return NSLocale.preferredLanguages.first!
        }
    }
}



// MARK: - 系统Bundle扩展

//extension Bundle {
//
//    // 替换Bundle.main为自定义的DDBundle
//    func swizzledClass() {
//        /**
//        *   动态继承、交换，方法类似KVO，通过修改Bundle.main对象的isa指针，使其指向它的子类DABundle，这样便可以调用子类的方法；
//        *   其实这里也可以使用method_swizzling来交换mainBundle的实现，来动态判断，可以同样实现。
//        */
//        object_setClass(Bundle.main, DDBundle.self)
//    }
//
//    // 替换后的bundle
//    func languageBundle() -> Bundle {
//
//        /// 获取替换后的languageCode
//        let languageCode = DDLanguage().userLanguage()
//
//        let path = Bundle.main.path(forResource: languageCode, ofType: "lproj")
////        guard path != nil else {
////            return nil
////        }
//
//        let bundle: Bundle = Bundle(path: path!)!
//
////        guard let <#constant#> = <#expression#> else { return <#return value#> }
//
//
//
//
//        return bundle
//    }
    
    
    
//    private static var languageDispatchOnce: ()->Void  = {
//        /** 替换Bundle.main为自定义的DDBundle
//         *   动态继承、交换，方法类似KVO，通过修改Bundle.main对象的isa指针，使其指向它的子类DABundle，这样便可以调用子类的方法；
//         *   其实这里也可以使用method_swizzling来交换mainBundle的实现，来动态判断，可以同样实现。
//         */
//        object_setClass(Bundle.main, DDBundle.self)
//    }
//
//    func currentLanguage() -> String {
//        return DDLanguage().userLanguage() != "" ? DDLanguage().userLanguage() : NSLocale.preferredLanguages.first!
//    }
//
//    func isChineseLanguage() -> Bool {
//        if currentLanguage().hasPrefix("zh-Hans") {
//            return true
//        } else {
//            return false
//        }
//    }
//}



// MARK: - 自定义bundle

//class DDBundle: Bundle {
//
//    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
//        if let bundle = Bundle.languageBundle(self) {
//            return bundle.localizedString(forKey: key, value: value, table: tableName)
//        } else {
//            super.localizedString(forKey: key, value: value, table: tableName)
//        }
//    }
//}




/**
 *  当调用onLanguage后替换掉mainBundle为当前语言的bundle
 */
class BundleEx: Bundle {
    
//    override class func initialize() {
//        super.initialize()
//        
//        
//    }
    
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundle = Bundle.getLanguageBundel() {
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        } else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}


extension Bundle {
    
    private static var onLanguageDispatchOnce: ()->Void = {
        //替换Bundle.main为自定义的BundleEx
        object_setClass(Bundle.main, BundleEx.self)
    }
    
    func onLanguage(){
        Bundle.onLanguageDispatchOnce()
    }
    
    class func getLanguageBundel() -> Bundle? {
        /// 获取替换后的languageCode
        let languageCode = DoLanguage().userLanguage()
        
        let languageBundlePath = Bundle.main.path(forResource: languageCode, ofType: "lproj")
//        print("path = \(languageBundlePath)")
        
        guard languageBundlePath != nil else {
            return nil
        }
        let languageBundle = Bundle.init(path: languageBundlePath!)
        guard languageBundle != nil else {
            return nil
        }
        return languageBundle!
    }
}
