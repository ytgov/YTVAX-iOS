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
        let backgroundView = UIView()
        backgroundView.backgroundColor = Constants.UI.Theme.primaryColor
        view.addSubview(backgroundView)
        backgroundView.allignTo(containerView: view, topMargin: nil, height: 85)
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        backgroundView.addSubview(stackView)
        stackView.allignTo(containerView: backgroundView, topMargin: 10, bottomMargin: nil)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        for link in links {
            let button  = newLinkButton(title: link.title)
            button.addAction {
                guard let urlString = link.url, let url = URL(string: urlString) else {
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
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.underlineStyle: NSNumber(value: NSUnderlineStyle.single.rawValue), NSAttributedString.Key.underlineColor: UIColor.white]
        attributedString.addAttributes(attributes, range: range)
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setAttributedTitle(attributedString, for: .normal)
        return button
    }
    
    struct BusinessGuidanceLink {
        var title: String
        var url: String?
    }
    
}

