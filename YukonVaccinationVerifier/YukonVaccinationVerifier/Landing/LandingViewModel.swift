//
//  LandingViewModel.swift
//  YukonVaccinationVerifier
//
//  Created by Mohamed Afsar on 19/11/21.
//

import Foundation

internal final class LandingViewModel {
    // MARK: Internal ICons
    internal let initialScreen: InitialScreen
    
    // MARK: Private Static Vars
    @UserDefault(key: Constants.Key.chosenLanguageCode, defaultValue: nil)
    private static var languageCodeStr: String?
    
    init() {
        initialScreen = Self.determineInitialScreen()
    }
}

// MARK: - Helper Functions
private extension LandingViewModel {
    static func determineInitialScreen() -> InitialScreen {
        if languageCodeStr == nil {
            return .languageSelectionVC
        } else {
            return .homeVC
        }
    }
}

// MARK: - Internal Types
internal extension LandingViewModel {
    enum InitialScreen {
        case languageSelectionVC
        case homeVC
    }
}
