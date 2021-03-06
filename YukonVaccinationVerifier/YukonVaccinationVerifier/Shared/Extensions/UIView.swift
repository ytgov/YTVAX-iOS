//
//  UIView.swift
//  VaccineCard
//
//  Created by Amir Shayegh on 2021-08-25.
//

import Foundation
import UIKit

extension UIView {
    func startLoadingIndicator() {
        if let existing = self.viewWithTag(Constants.UI.LoadingIndicator.backdropTag) {
            existing.removeFromSuperview()
        }
        
        let backdrop = UIView(frame: .zero)
        backdrop.tag = Constants.UI.LoadingIndicator.backdropTag
        let indicator = UIActivityIndicatorView(frame: .zero)
        let loadingContainer = UIView(frame:.zero)
        
        self.addSubview(backdrop)
        backdrop.addSubview(loadingContainer)
        loadingContainer.addSubview(indicator)
        
        backdrop.backgroundColor = Constants.UI.LoadingIndicator.backdropColor
        loadingContainer.backgroundColor = Constants.UI.LoadingIndicator.containerColor
        loadingContainer.layer.cornerRadius = Constants.UI.Theme.cornerRadius
        
        backdrop.addEqualSizeContraints(to: self)
        
        loadingContainer.center(in: backdrop, width: Constants.UI.LoadingIndicator.containerSize, height: Constants.UI.LoadingIndicator.containerSize)
        indicator.center(in: loadingContainer, width: Constants.UI.LoadingIndicator.size, height: Constants.UI.LoadingIndicator.size)
        
        indicator.startAnimating()
    }
    
    func endLoadingIndicator() {
        if let existing = self.viewWithTag(Constants.UI.LoadingIndicator.backdropTag) {
            existing.removeFromSuperview()
        }
    }
    
    public func addEqualSizeContraints(to toView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: toView.heightAnchor, constant: 0).isActive = true
        self.widthAnchor.constraint(equalTo: toView.widthAnchor, constant: 0).isActive = true
        self.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: 0).isActive = true
    }
    
    public func center(in view: UIView, width: CGFloat, height: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
    
    // Load a nib
    public class func fromNib<T: UIView>(bundle: Bundle? = Bundle.main) -> T {
        return bundle!.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    public func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

extension UIView {
    func addDashedBorder(color: CGColor, width: CGFloat) {
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = width
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
//        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.lineDashPattern = [10, 10]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath
        shapeLayer.name = "dashed"
        if let subs = self.layer.sublayers {
            for sub in subs where sub.name == shapeLayer.name {
                sub.removeFromSuperlayer()
            }
        }
        self.layer.addSublayer(shapeLayer)
    }
}

extension UIView {
    
    func allignTo(containerView: UIView, topMargin: CGFloat? = 0, leadingMargin: CGFloat? = 0, bottomMargin: CGFloat? = 0, trailingMargin: CGFloat? = 0, height: CGFloat? = nil) {
        if let topMargin = topMargin {
            NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1, constant: topMargin).isActive = true
        }
        if let leadingMargin = leadingMargin {
            NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: containerView, attribute: .leading, multiplier: 1, constant: leadingMargin).isActive = true
        }
        if let leadingMargin = leadingMargin {
            NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: containerView, attribute: .trailing, multiplier: 1, constant: leadingMargin).isActive = true
        }
        if let bottomMargin = bottomMargin {
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: bottomMargin).isActive = true
        }
        if let height = height {
            let height = height + containerView.safeAreaInsets.bottom
            NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height).isActive = true
        }
    }
    
}
