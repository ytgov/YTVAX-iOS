//
//  UserDefault.swift
//  SnowMappyShared
//
//  Created by Skyler Smith on 2020-11-19.
//  Copyright © 2020 Mappy, LLC. All rights reserved.
//

import Foundation

/// Persists the property to UserDefaults
@propertyWrapper
internal struct UserDefault<T> {
    public let key: String
    public let defaultValue: T?
    
    public init(key: String, defaultValue: T?) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    public var wrappedValue: T? {
        get { UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
}
