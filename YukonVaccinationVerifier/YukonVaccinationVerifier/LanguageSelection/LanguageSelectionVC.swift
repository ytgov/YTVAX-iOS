//
//  LanguageSelectionVC.swift
//  YukonVaccinationVerifier
//
//  Created by Mohamed Afsar on 17/11/21.
//

import UIKit

/// Provides the interface to select the app language
internal final class LanguageSelectionVC: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var logoImgVw: UIImageView!
    @IBOutlet weak var appNameLbl: UILabel!
    @IBOutlet weak var appLogoImgVw: UIImageView!
    @IBOutlet weak var enSelectLangLbl: UILabel!
    @IBOutlet weak var frSelectLangLbl: UILabel!
    @IBOutlet weak var enCellVw: UIView!
    @IBOutlet weak var frCellVw: UIView!
    @IBOutlet weak var englishCheckMark: UIImageView!
    @IBOutlet weak var frenchCheckMark: UIImageView!
    
    // MARK: Internal IVars
    internal var viewModel: LanguageSelectionViewPresentable!
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        switch (UIScreen.main.traitCollection.userInterfaceIdiom) {
        case .pad:
            return [.portrait, .portraitUpsideDown, .landscape]
        default:
            return .portrait
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubscriptions()
        configireAccessibility()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == Segues.toHomeVC {
            (segue.destination as! ViewController).launchScreenExtension = 0
        }
    }
    
    // MARK: IBActions
    @IBAction func englishContainerTapped(_ sender: UITapGestureRecognizer) {
        viewModel.handleSelection(languageCode: .en)
    }
    
    @IBAction func frenchContainerTapped(_ sender: UITapGestureRecognizer) {
        viewModel.handleSelection(languageCode: .fr_CA)
    }
}

// MARK: Helper Functions
private extension LanguageSelectionVC {
    func configireAccessibility() {
        logoImgVw.isAccessibilityElement = true
        appNameLbl.isAccessibilityElement = true
        appLogoImgVw.isAccessibilityElement = true
        enSelectLangLbl.isAccessibilityElement = true
        frSelectLangLbl.isAccessibilityElement = true
        enCellVw.isAccessibilityElement = true
        frCellVw.isAccessibilityElement = true
        
        logoImgVw.accessibilityTraits = .none
        appNameLbl.accessibilityTraits = .staticText
        appLogoImgVw.accessibilityTraits = .none
        enSelectLangLbl.accessibilityTraits = .staticText
        frSelectLangLbl.accessibilityTraits = .staticText
        enCellVw.accessibilityTraits = .none
        frCellVw.accessibilityTraits = .none
        
        let acc_lang = Accessibility.LanguageSelectionView.self
        view.accessibilityIdentifier = acc_lang.languageSelectionView.identifier
        logoImgVw.accessibilityIdentifier = acc_lang.yukonLogo.identifier
        appNameLbl.accessibilityIdentifier = acc_lang.vaccinationVerifier.identifier
        appLogoImgVw.accessibilityIdentifier = acc_lang.appIcon.identifier
        enSelectLangLbl.accessibilityIdentifier = acc_lang.selectALanguage.identifier
        frSelectLangLbl.accessibilityIdentifier = acc_lang.sélectionnezUneLangue.identifier
        enCellVw.accessibilityIdentifier = acc_lang.englishButton.identifier
        frCellVw.accessibilityIdentifier = acc_lang.frenchButton.identifier
        
        view.accessibilityLabel = acc_lang.languageSelectionView.label
        logoImgVw.accessibilityLabel = acc_lang.yukonLogo.label
        appNameLbl.accessibilityLabel = acc_lang.vaccinationVerifier.label
        appLogoImgVw.accessibilityLabel = acc_lang.appIcon.label
        enSelectLangLbl.accessibilityLabel = acc_lang.selectALanguage.label
        frSelectLangLbl.accessibilityLabel = acc_lang.sélectionnezUneLangue.label
        enCellVw.accessibilityLabel = acc_lang.englishButton.label
        frCellVw.accessibilityLabel = acc_lang.frenchButton.label
        
        view.accessibilityValue = acc_lang.languageSelectionView.value
        logoImgVw.accessibilityValue = acc_lang.yukonLogo.value
        appNameLbl.accessibilityValue = acc_lang.vaccinationVerifier.value
        appLogoImgVw.accessibilityValue = acc_lang.appIcon.value
        enSelectLangLbl.accessibilityValue = acc_lang.selectALanguage.value
        frSelectLangLbl.accessibilityValue = acc_lang.sélectionnezUneLangue.value
        enCellVw.accessibilityValue = acc_lang.englishButton.value
        frCellVw.accessibilityValue = acc_lang.frenchButton.value
    }
    
    func setupSubscriptions() {
        viewModel.selectedLanguageCode.bind(listener: { [weak self] in
            guard let self = self else { return }
            self.updateUI(code: $0)
        })
        
        viewModel.goToNextScreen.bind(listener: { [weak self] in
            guard let self = self, $0 else { return }
            self.navigateToHomeVC()
        })
    }
    
    func updateUI(code: Constants.SupportedLanguageCode?) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { self.updateUI(code: code) }
            return
        }
        if let code = code {
            switch code {
            case .en:
                englishCheckMark.isHidden = false
                frenchCheckMark.isHidden = true
            case .fr_CA:
                englishCheckMark.isHidden = true
                frenchCheckMark.isHidden = false
            }
        } else {
            englishCheckMark.isHidden = true
            frenchCheckMark.isHidden = true
        }
    }
    
    func navigateToHomeVC() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in // Just delaying the transition.
            self?.performSegue(withIdentifier: Segues.toHomeVC, sender: nil)
        }
    }
}

// MARK: Private Types
private extension LanguageSelectionVC {
    enum Segues {
        static let toHomeVC = "ToHomeVC" // NO I18N
    }
}
