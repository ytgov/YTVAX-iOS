//
//  LandingViewController.swift
//  YukonVaccinationVerifier
//
//  Created by Mohamed Afsar on 19/11/21.
//

import UIKit

/// The view-controller which determines the initial screen of the app.
internal final class LandingViewController: UIViewController {
    // MARK: Private ICons
    private let viewModel = LandingViewModel()
    
    // MARK: Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switch viewModel.initialScreen {
        case .homeVC:
            performSegue(withIdentifier: Segues.toHomeVC, sender: nil)
        case .languageSelectionVC:
            performSegue(withIdentifier: Segues.toLanguageSelectionVC, sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let langVC = segue.destination as? LanguageSelectionVC {
            langVC.viewModel = LanguageSelectionViewModel()
        }
    }
}

// MARK: - Private Types
private extension LandingViewController {
    enum Segues {
        static let toHomeVC = "ToHomeVC" // NO I18N
        static let toLanguageSelectionVC = "ToLanguageSelectionVC" // NO I18N
    }
}
