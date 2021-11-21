//
//  LanguageSelectionViewModel.swift
//  YukonVaccinationVerifier
//
//  Created by Mohamed Afsar on 17/11/21.
//

import Foundation

internal protocol LanguageSelectionViewPresentable {
    var selectedLanguageCode: ReactiveVarBox<Constants.SupportedLanguageCode?> { get }
    var goToNextScreen: ReactiveVarBox<Bool> { get }
    
    func handleSelection(languageCode: Constants.SupportedLanguageCode)
}

internal final class LanguageSelectionViewModel: LanguageSelectionViewPresentable {
    internal var selectedLanguageCode = ReactiveVarBox<Constants.SupportedLanguageCode?>(nil)
    internal var goToNextScreen = ReactiveVarBox<Bool>(false)
}

// MARK: Functions
internal extension LanguageSelectionViewModel {
    func handleSelection(languageCode: Constants.SupportedLanguageCode) {
        selectedLanguageCode.value = languageCode
        LanguageService.switchTo(languageCode)
        goToNextScreen.value = true
    }
}
