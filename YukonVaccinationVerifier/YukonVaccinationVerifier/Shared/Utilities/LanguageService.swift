//
//  LanguageService.swift
//  YukonVaccinationVerifier
//
//  Created by Mohamed Afsar on 18/11/21.
//

import Foundation
 
internal final class LanguageService {
    // MARK: Internal Static Vars
    static var languageCode: Constants.SupportedLanguageCode {
        get {
            if let codeStr = defaultsLanguageCodeStr,
               let code = Constants.SupportedLanguageCode(rawValue: codeStr) {
                return code
            } else {
                return Constants.SupportedLanguageCode.en
            }
        }
        set {
            defaultsLanguageCodeStr = newValue.rawValue
            UserDefaults.standard.synchronize()
            setLocaleWithLanguage(newValue)
        }
    }
    
    // MARK: Private IVars
    @UserDefault(key: Constants.Key.chosenLanguageCode, defaultValue: nil)
    private static var defaultsLanguageCodeStr: String?
    
    private static var localeBundle: Bundle?
    
    static func prepareDefaultLocaleBundle() {
        setLocaleWithLanguage(languageCode)
    }
    
    static func dynamicLocalizedString(_ key: String) -> String {
        let localizedString: String
        if let bundle = localeBundle {
            localizedString = NSLocalizedString(key, bundle: bundle, comment: "")
        } else {
            localizedString = NSLocalizedString(key, comment: "")
        }
        return localizedString
    }
    
    static func dynamicLocalizedString(_ key: String, code: Constants.SupportedLanguageCode) -> String {
        if let bundle = bundle(code: code) {
            return NSLocalizedString(key, bundle: bundle, comment: "")
        } else {
            return dynamicLocalizedString(key)
        }
    }
    
    static func switchTo(_ code: Constants.SupportedLanguageCode) {
        languageCode = code
        NotificationCenter.default.post(name: .languageServiceDidDetectLanguageSwitch, object: nil)
    }
    
    private static func setLocaleWithLanguage(_ code: Constants.SupportedLanguageCode) {
        if let bundle = bundle(code: code) {
            localeBundle = bundle
        } else {
            localeBundle = bundle(code: Constants.SupportedLanguageCode.en)
        }
    }
    
    private static func bundle(code: Constants.SupportedLanguageCode) -> Bundle? {
        guard let pathSelected = Bundle.main.path(forResource: code.rawValue, ofType: "lproj") else {
            return nil
        }
        return Bundle(path: pathSelected)
    }
}
