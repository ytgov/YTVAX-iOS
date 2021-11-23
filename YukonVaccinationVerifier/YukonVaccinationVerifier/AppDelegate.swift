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
        BCVaccineValidator.shared.setup(mode: .Test)
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
}
