//
//  OnBoarding.swift
//  VaccineCard
//
//  Created by Amir Shayegh on 2021-09-16.
//

import UIKit

/// Shows basic info of the app and asks for Camera permisions
internal final class OnBoardingView: UIView {
    
    var buttonCallback: (()->Void)?

    // MARK: Outlets
    @IBOutlet weak var phoneImgVw: UIImageView!
    @IBOutlet weak var onBoardTitle: UILabel!
    @IBOutlet weak var onBoardSubtitle: UILabel!
    @IBOutlet weak var onBoardContainer: UIView!
    @IBOutlet weak var onBoardButton: UIButton!
    @IBOutlet weak var onBoardImage: UIStackView!
    
    func setup(in container: UIView, onButtonTap: @escaping()->Void) {
        if let existing = container.viewWithTag(Constants.UI.onBoarding.tag) {
            existing.removeFromSuperview()
        }
        self.frame = .zero
        self.alpha = 0
        container.addSubview(self)
        self.tag = Constants.UI.onBoarding.tag
        self.addEqualSizeContraints(to: container)
        self.buttonCallback = onButtonTap
        style()
        updateTexts()
        updateAccessibilityLabels()
        container.layoutIfNeeded()
        UIView.animate(withDuration: 0.4, delay: 1, options: .curveEaseIn) {[weak self] in
            guard let `self` = self else {return}
            self.alpha = 1
            self.layoutIfNeeded()
        }
    }
    
    @IBAction func ButtonTapped(_ sender: Any) {
        guard let callback = buttonCallback else {return}
        callback()
    }
    
    func updateAccessibilityLabels() {
        onBoardContainer.accessibilityLabel = Accessibility.OnBoarding.onboardingView
        
        phoneImgVw.isAccessibilityElement = true
        onBoardButton.isAccessibilityElement = true
        onBoardTitle.isAccessibilityElement = true
        onBoardSubtitle.isAccessibilityElement = true
        
        onBoardButton.accessibilityLabel = Accessibility.OnBoarding.startScanningButton
        onBoardTitle.accessibilityLabel = Accessibility.OnBoarding.title
        onBoardSubtitle.accessibilityLabel = Accessibility.OnBoarding.subtitle
        phoneImgVw.accessibilityLabel = Accessibility.OnBoarding.phoneImage
        
        phoneImgVw.accessibilityTraits = .none
    }
    
    func style() {
        onBoardTitle.font = Constants.UI.onBoarding.titleFont
        onBoardTitle.textColor = Constants.UI.onBoarding.titleColor
        onBoardSubtitle.textColor = Constants.UI.onBoarding.subtitleColor
        onBoardSubtitle.font = Constants.UI.onBoarding.subtitleFont
        onBoardButton.backgroundColor = Constants.UI.onBoarding.buttonBgColor
        onBoardButton.setTitleColor(Constants.UI.Theme.primaryConstractColor, for: .normal)
        onBoardButton.layer.cornerRadius = Constants.UI.Theme.cornerRadius
        if let titleLabel = onBoardButton.titleLabel {
            titleLabel.font = Constants.UI.onBoarding.buttonFont
        }
    }
    
    func updateTexts() {
        onBoardTitle.text = Constants.UI.onBoarding.title
        onBoardSubtitle.text = Constants.UI.onBoarding.subtitle
        onBoardButton.setTitle(Constants.UI.onBoarding.buttonTitle, for: .normal)
    }
}
