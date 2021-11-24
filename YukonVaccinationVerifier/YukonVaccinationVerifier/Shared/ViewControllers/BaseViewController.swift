//
//  BaseViewController.swift
//  YukonVaccinationVerifier
//
//  Created by Mohamed Afsar on 18/11/21.
//

import UIKit

/// Generic functionality of this app's ViewController is added here.
internal class BaseViewController: UIViewController {
    // MARK: - Internal IVars
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        switch (UIScreen.main.traitCollection.userInterfaceIdiom) {
        case .pad:
            return [.portrait, .portraitUpsideDown, .landscape]
        default:
            return .portrait
        }
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.localizeUI), name: .languageServiceDidDetectLanguageSwitch, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localizeUI()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

internal extension BaseViewController {
    @objc func localizeUI() {
        fatalError("Subclasses must override to provide in-App localization functionality")
    }
}
