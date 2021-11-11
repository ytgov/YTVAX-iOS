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
        // Override point for customization after application launch.
        BCVaccineValidator.shared.setup(mode: .Test)
        return true
    }
}

