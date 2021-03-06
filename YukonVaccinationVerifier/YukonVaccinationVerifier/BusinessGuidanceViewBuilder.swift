//
//  BusinessGuidanceViewBuilder.swift
//  YukonVaccinationVerifier
//
//  Created by Mohamed Fawzy on 16/11/2021.
//

import Foundation
import UIKit
import SafariServices

/**
 This class builds the view required as a business guidance and insert it at the bottom of its presenter view
 */
final class BusinessGuidanceViewBuilder {
    
    static func setupView(in presenter: UIViewController, links: [BusinessGuidanceLink]) {
        guard let view = presenter.view else {
            return
        }
        let tag = Constants.UI.BusinessGuidanceView.tag
        if let existingView = view.viewWithTag(tag) {
            existingView.removeFromSuperview()
        }
        let backgroundView = UIView()
        backgroundView.tag = tag
        backgroundView.backgroundColor = Constants.UI.Theme.primaryColor
        view.addSubview(backgroundView)
        backgroundView.allignTo(containerView: view, topMargin: nil, height: Constants.UI.BusinessGuidanceView.height)
        let stackView = UIStackView()
        stackView.axis = .vertical
        let spacing = Constants.UI.BusinessGuidanceView.spacing
        stackView.spacing = spacing
        backgroundView.addSubview(stackView)
        stackView.allignTo(containerView: backgroundView, topMargin: spacing, bottomMargin: nil)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        for link in links {
            let button  = newLinkButton(title: link.title)
            button.addAction {
                guard let url = URL(string: link.url) else {
                    return
                }
                let safariViewController = SFSafariViewController(url: url)
                presenter.present(safariViewController, animated: true)
            }
            stackView.addArrangedSubview(button)
        }
    }
    
    private static func newLinkButton(title: String) -> UIButton {
        let range = (title as NSString).range(of: title)
        let attributedString = NSMutableAttributedString(string: title)
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white, .underlineStyle: NSNumber(value: NSUnderlineStyle.single.rawValue), .underlineColor: UIColor.white, .font: UIFont.secondaryThemeFont(size: 13, style: .regular)]
        attributedString.addAttributes(attributes, range: range)
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setAttributedTitle(attributedString, for: .normal)
        return button
    }
    
    struct BusinessGuidanceLink {
        var title: String
        var url: String
    }
    
}

