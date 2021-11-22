//
//  AccessibilityConstants.swift
//  VaccineCard
//
//  Created by Amir Shayegh on 2021-09-14.
//

import Foundation

struct AccessibilityLabels {
    
    struct OnBoarding {
        static let onboardingView = "On Boarding View"
        static let startScanningButton = "Allow Camera Access" // Constants.Strings.onBoarding.buttonTitle
        static let title = "Yukon Vaccination Verifier" // Constants.Strings.onBoarding.title
        static let subtitle = "We need permission to access your camera to be able to use this service to scan an official government-issued QR code" // Constants.Strings.onBoarding.subtitle
        static let phoneImage = "Phone Image"
    }
    
    struct scannerView {
        static let cameraView = "Camera Screen"
        static let turnOnFlash = "Turn on torch light"
        static let turnOffFlash = "Turn off torch light"
    }
    
    struct ScanResultView {
        static let view = "Immunization staus"
        static let titleLabel = "Yukon Vaccination Verifier" // Constants.Strings.vaccinationStatusHeader
        static let scanButton = "Scan next" // Constants.Strings.scanAgain
    }
}
