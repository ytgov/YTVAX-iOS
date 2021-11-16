//
//  BusinessGuidanceView.swift
//  YukonVaccinationVerifier
//
//  Created by Mohamed Fawzy on 16/11/2021.
//

import Foundation
import UIKit
import SafariServices

class BusinessGuidance {
    
    static func setupView(in presenter: UIViewController, links: [BusinessGuidanceLink]) {
        guard let view = presenter.view else {
            return
        }
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(hexString: "#244C5A")
        view.addSubview(backgroundView)
        allignView(backgroundView,containerView: view, topMargin: nil, height: 85)
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        backgroundView.addSubview(stackView)
        allignView(stackView, containerView: backgroundView, topMargin: 10, bottomMargin: nil)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        for link in links {
            let button  = buttonLink(title: link.title)
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
    
    private static func allignView(_ view: UIView, containerView: UIView, topMargin: CGFloat? = 0, leadingMargin: CGFloat? = 0, bottomMargin: CGFloat? = 0, trailingMargin: CGFloat? = 0, height: CGFloat? = nil) {
        if let topMargin = topMargin {
            NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1, constant: topMargin).isActive = true
        }
        if let leadingMargin = leadingMargin {
            NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: containerView, attribute: .leading, multiplier: 1, constant: leadingMargin).isActive = true
        }
        if let leadingMargin = leadingMargin {
            NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: containerView, attribute: .trailing, multiplier: 1, constant: leadingMargin).isActive = true
        }
        if let bottomMargin = bottomMargin {
            NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: bottomMargin).isActive = true
        }
        if let height = height {
            let height = height + containerView.safeAreaInsets.bottom
            NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height).isActive = true
        }
    }
    
    private static func buttonLink(title: String) -> UIButton {
        let range = (title as NSString).range(of: title)
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: range)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSNumber(value: NSUnderlineStyle.single.rawValue), range: range)
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor.white, range: range)
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setAttributedTitle(attributedString, for: .normal)
        return button
    }
    
}

struct BusinessGuidanceLink {
    var title: String
    var url: String?
}
