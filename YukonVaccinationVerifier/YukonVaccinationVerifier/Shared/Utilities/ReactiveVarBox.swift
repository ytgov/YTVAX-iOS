//
//  ReactiveVarBox.swift
//  YukonVaccinationVerifier
//
//  Created by Mohamed Afsar on 17/11/21.
//

import Foundation

/// A wrapper that fires a listener when the value changes. Acts similar to the 'CurrentValueSubject' of Apple's Combine framework API.
public final class ReactiveVarBox<T> {
    // MARK: Typealiases
    internal typealias Listener = (T) -> Void
    
    // MARK: Internal IVars
    internal var value: T {
        didSet {
            self.listener?(self.value)
        }
    }
    
    internal var listener: Listener?
    
    // MARK: Initialization
    init(_ value: T) {
        self.value = value
    }
    
    // MARK: Functions
    func bind(listener: Listener?) {
        self.listener = listener
        self.listener?(self.value)
    }
}
