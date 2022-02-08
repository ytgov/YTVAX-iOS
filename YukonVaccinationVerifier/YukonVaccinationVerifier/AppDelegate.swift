//
//  AppDelegate.swift
//  YukonVaccinationVerifier
//
//  Created by Mohamed Afsar on 01/11/21.
//

import UIKit
import BCVaccineValidator

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        LanguageService.prepareDefaultLocaleBundle()
        setupVaccineValidator()
        return true
    }
    
    // Orientation supported only in iPad
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if let topViewController = UIViewController.topViewController() {
            return topViewController.supportedInterfaceOrientations
        } else {
            return .portrait
        }
    }
    
    private func setupVaccineValidator() {
        let mode: BCVaccineValidator.Config
        #if PROD
            mode = .Prod
        #elseif STG
            mode = .Test
        #elseif TST
            mode = .Test
        #elseif DEV
            mode = .Dev
        #else
            #if DEBUG
                mode = .Dev
            #else
                mode = .Prod
            #endif
        #endif
        BCVaccineValidator.shared.setup(mode: mode)
    }
}
