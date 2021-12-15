//
//  ScanResultViewController.swift
//  VaccineCard
//
//  Created by Amir Shayegh on 2021-08-25.
//

import UIKit
import BCVaccineValidator

/// Shows the result of the scanned QR code(Fully/Partically/Not vaccinated). 
internal final class ScanResultViewController: BaseViewController {
    // MARK: Outlets
    @IBOutlet weak var scanButton: UIButton!
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var divider: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var statusContainer: UIView!
    @IBOutlet weak var statusCardContainer: UIView!
    
    @IBOutlet weak var cardIcon: UIImageView!
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var cardSubtitle: UILabel!
    
    // MARK: Variables
    private var onClose: (()->(Void))? = nil
    private var model: ScanResultModel? = nil
    
    private var timer: Timer?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        updateTextsAndAccessibilityTags()
        setupAccessibility()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateVaccinationData()
        beginAutoDismissTimer()
    }
    
    override func localizeUI() {
        updateTextsAndAccessibilityTags()
    }
    
    // MARK: Outlet Actions
    @IBAction func scanButtonAction(_ sender: Any) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        dimissPage()
    }
    
    private func dimissPage() {
        timer?.invalidate()
        guard let onClose = self.onClose else {return}
        onClose()
    }
    
    // MARK: Setup
    public func setup(model: ScanResultModel, onClose: @escaping()->Void) {
        self.onClose = onClose
        self.model = model
    }
    
    private func updateVaccinationData() {
        guard let model = self.model else {return}
        nameLabel.text = model.name.uppercased()
        switch model.status {
        case .Fully, .Exempt:
            styleMeetsRequirementCard()
        case .None:
            styleNotVaxinatedCard()
        case .Partially:
            stylePartiallyMeetsRequirementCard()
        }
    }
    
    func beginAutoDismissTimer() {
        if let t = timer {
            t.invalidate()
        }
        timer = Timer.scheduledTimer(withTimeInterval: Constants.dismissResultsAfterSeconds, repeats: false) {[weak self] timer in
            guard let `self` = self else {return}
            self.dimissPage()
        }
    }
    
    // MARK: Style
    private func style() {
        // Colours
        view.backgroundColor = Constants.UI.Theme.primaryColor
        titleLabel.textColor = Constants.UI.Theme.primaryConstractColor
        nameLabel.textColor = Constants.UI.Theme.primaryConstractColor
        divider.backgroundColor = Constants.UI.Theme.secondaryColor
        
        scanButton.backgroundColor = Constants.UI.Theme.primaryConstractColor
        scanButton.layer.cornerRadius = Constants.UI.ScanResult.cornerRadius
        scanButton.setTitleColor(Constants.UI.Theme.primaryColor, for: .normal)
        
        // Fonts
        titleLabel.font = Constants.UI.ScanResult.titleFont
        
        let nameFont = Constants.UI.ScanResult.nameFont
        nameLabel.font = nameFont
        nameLabel.font = UIFontMetrics.default.scaledFont(for: nameFont)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.adjustsFontSizeToFitWidth = true
        
        if let btnLabel = scanButton.titleLabel {
            btnLabel.font = Constants.UI.ScanResult.buttonFont
        }
    }
    
    private func updateTextsAndAccessibilityTags() {
        scanButton.setTitle(Constants.Strings.scanAgain, for: .normal)
        titleLabel.text = Constants.Strings.vaccinationStatusHeader
        
        view.accessibilityLabel = Accessibility.ScanResultView.view
        titleLabel.accessibilityLabel = Accessibility.ScanResultView.titleLabel
        scanButton.accessibilityLabel = Accessibility.ScanResultView.scanButton
        
        updateVaccinationData()
    }
    
    private func styleStatusCard(foregroundColor: UIColor) {
        cardTitle.font = Constants.UI.ScanResult.cardTitleFont
        cardTitle.numberOfLines = 0
        cardSubtitle.font = Constants.UI.ScanResult.cardSubtitleFont
        statusCardContainer.backgroundColor = .clear
        statusCardContainer.layer.borderColor = foregroundColor.cgColor
        statusCardContainer.layer.borderWidth = 6
        statusCardContainer.layer.cornerRadius = Constants.UI.ScanResult.cornerRadius
        
        cardTitle.textColor = foregroundColor
        cardSubtitle.textColor = foregroundColor
    }
    
    private func styleMeetsRequirementCard() {
        statusContainer.backgroundColor = Constants.UI.Status.meetsRequirement.color
        styleStatusCard(foregroundColor: .white)
        cardIcon.image = UIImage(named: "checkmark")
        cardTitle.text = Constants.UI.Status.meetsRequirement.cardTitle
        cardSubtitle.text = Constants.UI.Status.meetsRequirement.cardSubtitle
        cardTitle.textAlignment = .center
    }
    
    private func styleNotVaxinatedCard() {
        statusContainer.backgroundColor = Constants.UI.Status.notVaccinated.color
        styleStatusCard(foregroundColor: .white)
        cardIcon.isHidden = true
        let resultTitle = Constants.UI.Status.notVaccinated.cardTitle
        cardTitle.text = resultTitle
        cardTitle.accessibilityLabel = resultTitle
        cardSubtitle.text = Constants.UI.Status.notVaccinated.cardSubtitle
        cardTitle.textAlignment = .center
    }
    
    private func stylePartiallyMeetsRequirementCard() {
        statusContainer.backgroundColor = Constants.UI.Status.partiallyMeetsRequirement.color
        styleStatusCard(foregroundColor: .black)
        cardIcon.isHidden = true
        let resultTitle = Constants.UI.Status.partiallyMeetsRequirement.cardTitle
        cardTitle.text = resultTitle
        cardTitle.accessibilityLabel = resultTitle
        cardSubtitle.text = Constants.UI.Status.partiallyMeetsRequirement.cardSubtitle
        cardTitle.textAlignment = .center
        statusCardContainer.layer.borderWidth = 0
        view.layoutIfNeeded()
        statusContainer.layoutIfNeeded()
        statusCardContainer.addDashedBorder(color: UIColor.black.cgColor, width: 6)
    }
    
    func setupAccessibility() {
        view.accessibilityTraits = .allowsDirectInteraction
        
        cardTitle.accessibilityTraits = .allowsDirectInteraction
        scanButton.accessibilityTraits = .allowsDirectInteraction
        nameLabel.accessibilityTraits = .allowsDirectInteraction
        
        cardIcon.isAccessibilityElement = false
        cardIcon.accessibilityTraits = .notEnabled
        
        logo.isAccessibilityElement = false
        logo.accessibilityTraits = .notEnabled
        
        divider.isAccessibilityElement = false
        divider.accessibilityTraits = .notEnabled
    }
}
