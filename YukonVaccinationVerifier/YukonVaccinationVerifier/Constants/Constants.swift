//
//  Constants.swift
//  VaccineCard
//
//  Created by Amir Shayegh on 2021-08-25.
//

import Foundation
import UIKit

struct Constants {
    static let dismissResultsAfterSeconds: Double = 10
    static let launchScreenExtension: Double = 2
    
    struct JWKSPublic {
        static let urlExtension = ".well-known/jwks.json"
    }
    
    struct CVX {
        static let janssen = "212"
    }
    
    struct Strings {
        static var vaccinationStatusHeader: String { .yukonVaccinationVerifier }
        static var scanAgain: String { .scanNext }
        
        struct shouldUpdate {
            static var title: String { .pleaseUpdate }
            static var message: String { .aNewVersion_AppStore }
        }
        
        struct Errors {
            struct CameraAccessIsNecessary {
                static var title: String { .noCameraAccess }
                static var message: String { .camera_UseThisApp }
            }
            struct MultipleQRCodes {
                static var message: String { .there_codesInView }
            }
            struct InvalidCode {
                static var message: String { .invalidQRCode }
            }
            struct VideoNotSupported {
                static var title: String { .unsupportedDevice }
                static var message: String { .please_supportsVideoCapture }
            }
            struct QRScanningNotSupported {
                static var title: String { .unsupportedDevice }
                static var message: String { .yourDevice_scanning }
            }
        }
    }
    
    struct UI {
        struct Theme {
            static let primaryColor = UIColor(hexString: "#244C5A")
            static let secondaryColor = UIColor(hexString: "#eea73b")
            static let primaryConstractColor = UIColor.white
            static let cornerRadius: CGFloat = 4
            static let animationDuration = 0.3
        }
        
        struct TorchButton {
            static let tag = 92133
            static let buttonSize: CGFloat = 42
        }
        
        struct LanguageControlView {
            static let tag = 98765
        }
                
        struct CameraView {
            struct CameraCutout {
                static let fillLayerName = "cutout-fill-layer"
                static let bornerLayerName = "border-layer"
                static let imageTag = 978142
                
                static let colour = UIColor(hexString: "313132").cgColor
                static let opacity: Float = 0.7
                static let cornerRadius: CGFloat = 10
                
                static let logoSize: CGFloat = 60
                static let paddingBetweenLogoAndBox: CGFloat = 12
                
                static var width: CGFloat {
                    switch (UIScreen.main.traitCollection.userInterfaceIdiom) {
                    case .pad:
                        return 506
                    default:
                        return 247
                    } 
                }
                
                static var height: CGFloat {
                    switch (UIScreen.main.traitCollection.userInterfaceIdiom) {
                    case .pad:
                        return 469
                    default:
                        return 293
                    }
                }
            }
        }
        
        struct QRCodeHighlighter {
            static let tag = 72192376
            static let cornerRadius: CGFloat = Constants.UI.Theme.cornerRadius
            static let borderWidth: CGFloat = 6
            static let borderColor = Constants.UI.Theme.secondaryColor.cgColor
            static let borderColorInvalid = UIColor.red.cgColor
        }
        
        struct LoadingIndicator {
            static let backdropTag = 45645676
            static let backdropColor = UIColor.black.withAlphaComponent(0.5)
            static let containerColor = UIColor.white
            static let containerSize: CGFloat = 70
            static let size: CGFloat = 30
        }
        
        struct onBoarding {
            static let tag = 3124145
            static var title: String { .yukonVaccinationVerifier }
            static var subtitle: String { .weNeedPermission_QRcode }
            static var buttonTitle: String { .startScanning }
            
            static let titleFont: UIFont = .themeFont(size: 20, style: .bold)
            static let subtitleFont: UIFont = .themeFont(size: 16, style: .regular)
            static let buttonFont: UIFont = .themeFont(size: 16, style: .regular)
            
            static let titleColor = UIColor(named: "titleColor")
            static let subtitleColor = UIColor(named: "subtitleColor")
            static let buttonBgColor = UIColor(hexString: "#0097A9")
        }
        
        struct ScanResult {
            static let cornerRadius: CGFloat = Constants.UI.Theme.cornerRadius
            
            static var titleFont: UIFont {
                switch (UIScreen.main.traitCollection.userInterfaceIdiom) {
                case .pad:
                    return .themeFont(size: 27, style: .bold)
                default:
                    return .themeFont(size: 18, style: .bold)
                }
            }
           
            static var nameFont: UIFont {
                switch (UIScreen.main.traitCollection.userInterfaceIdiom) {
                case .pad:
                    
                    return .themeFont(size: 24, style: .bold)
                default:
                    return .themeFont(size: 20, style: .bold)
                }
            }
            
            static var buttonFont: UIFont {
                switch (UIScreen.main.traitCollection.userInterfaceIdiom) {
                case .pad:
                    return .themeFont(size: 22, style: .medium)
                default:
                    return .themeFont(size: 16, style: .medium)
                }
            }
            
            static var cardTitleFont: UIFont {
                switch (UIScreen.main.traitCollection.userInterfaceIdiom) {
                case .pad:
                    return .themeFont(size: 36, style: .bold)
                default:
                    return .themeFont(size: 32, style: .bold)
                }
            }
            
            static var cardSubtitleFont: UIFont {
                switch (UIScreen.main.traitCollection.userInterfaceIdiom) {
                case .pad:
                    return .themeFont(size: 16, style: .regular)
                default:
                    return .themeFont(size: 12, style: .regular)
                }
            }
        }
        struct Status {
            static var font: UIFont {
                switch (UIScreen.main.traitCollection.userInterfaceIdiom) {
                case .pad:
                    return .themeFont(size: 22, style: .regular)
                default:
                    return .themeFont(size: 22, style: .regular)
                }
            }
            static let textColor = UIColor.white
            
            // MARK: Status Colours
            struct fullyVaccinated {
                static let color = UIColor(hexString: "#244402")
                static var cardTitle: String { .fullyVaccinated }
                static var cardSubtitle: String { .officialGovernmentOfYukonResult }
            }
            struct partiallyVaccinated {
                static let color = UIColor(hexString: "#F2A900")
                static var cardTitle: String { .partiallyVaccinated }
                static var cardSubtitle: String { .officialGovernmentOfYukonResult }
            }
            
            struct notVaccinated {
                static let color = UIColor(hexString: "#b6b6b6")
                static var cardTitle: String { .noRecordsFound }
                static var cardSubtitle: String { .officialGovernmentOfYukonResult }
            }
        }
        
        struct Banner {
            static let tag = 232213
            static let displayDuration: Double = 2.0 // seconds
            static let backgroundColor = Constants.UI.Theme.primaryColor
            static let labelColor = Constants.UI.Theme.primaryConstractColor
            static let labelFont: UIFont = .themeFont(size: 14, style: .regular)
            static let labelPadding: CGFloat = 8
            static let containerPadding: CGFloat = 16
        }
    }
    
    enum SupportedLanguageCode: String {
        case en
        case fr_CA = "fr-CA" // NO I18N
    }
    
    struct Key {
        static let chosenLanguageCode = "chosenLanguageCode" // NO I18N
    }
}
