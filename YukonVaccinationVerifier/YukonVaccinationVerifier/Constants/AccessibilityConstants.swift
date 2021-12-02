//
//  AccessibilityConstants.swift
//  VaccineCard
//
//  Created by Amir Shayegh on 2021-09-14.
//

import Foundation

/// Contains info needed to configure accessibility
internal struct Accessibility {
    enum LanguageSelectionView: String {
        case languageSelectionView
        case yukonLogo
        case vaccinationVerifier
        case appIcon
        case selectALanguage
        case sélectionnezUneLangue
        case englishButton
        case frenchButton
        
        var identifier: String { self .rawValue }
        
        var label: String? {
            switch self {
            case .selectALanguage, .sélectionnezUneLangue:
                return nil
            default:
                let key = "Accessibility.Label.\(self.rawValue)" // NO I18N
                let label = LanguageService.dynamicLocalizedString(key)
                return key == label ? nil : label
            }
        }
        
        var value: String? {
            let key = "Accessibility.Value.\(self.rawValue)" // NO I18N
            let val: String
            switch self {
            case .englishButton:
                val = LanguageService.dynamicLocalizedString(key, code: .en)
            case .frenchButton:
                val = LanguageService.dynamicLocalizedString(key, code: .fr_CA)
            default:
                val = LanguageService.dynamicLocalizedString(key)
            }
            return key == val ? nil : val
        }
    }
    
    struct OnBoarding {
        static var onboardingView: String {
            LanguageService.dynamicLocalizedString("Accessibility.Label.onboardingView")
        }
        static var startScanningButton: String {
            LanguageService.dynamicLocalizedString("Accessibility.Label.allowCameraAccess")
        }
        static var title: String { .yukonVaccinationVerifier }
        static var subtitle: String { .weNeedPermission_QRcode }
        static var phoneImage: String {
            LanguageService.dynamicLocalizedString("Accessibility.Label.phoneImage")
        }
    }
    
    struct scannerView {
        static var cameraView: String {
            LanguageService.dynamicLocalizedString("Accessibility.Label.cameraScreen")
        }
        static var turnOnFlash: String {
            LanguageService.dynamicLocalizedString("Accessibility.Label.turnOnTorchLight")
        }
        static var turnOffFlash: String {
            LanguageService.dynamicLocalizedString("Accessibility.Label.turnOffTorchLight")
        }
        static var switchLanguage: String {
            LanguageService.dynamicLocalizedString("Accessibility.Label.switchLanguage")
        }
    }
    
    struct ScanResultView {
        static var view: String {
            LanguageService.dynamicLocalizedString("Accessibility.Label.immunizationStatus")
        }
        static var titleLabel: String { .yukonVaccinationVerifier }
        static var scanButton: String { .scanNext }
    }
}
