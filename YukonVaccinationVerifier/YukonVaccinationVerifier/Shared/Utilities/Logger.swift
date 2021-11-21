//
//  Logger.swift
//  Mindshift
//
//  Created by Mohamed Afsar on 27/05/21.
//  Copyright © 2021 Freshworks Studio Inc. All rights reserved.
//

import Foundation

internal final class Logger {
    // MARK: Internal Static Vars
    internal static var shouldForceLog = false
    internal private(set) static var shouldLog = true
    
    // MARK: Private Static Cons
    private static let dFrmtr: DateFormatter = {
        let fmtr = DateFormatter()
        fmtr.dateFormat = "yyyy-MM-dd HH:mm:ss" // NO I18N
        return fmtr
    }()
        
    private static let sQueue = DispatchQueue(label: "Logger" + String.YV_DOT + "serial", qos: .utility) // NO I18N
    
    // MARK: Static Functions
    public static func logSuccess(_ messages: Any..., fileName: String = #file, function: String = #function, line: Int = #line, shouldLog: Bool = Logger.shouldLog, date: Date = Date()) {
        self.sQueue.async {
            self.log("✅", date: date, messages: messages, fileName: fileName, function: function, line: line, shouldLog: shouldLog) // NO I18N
        }
    }
    
    public static func logFailure(_ messages: Any..., fileName: String = #file, function: String = #function, line: Int = #line, shouldLog: Bool = Logger.shouldLog, date: Date = Date()) {
        self.sQueue.async {
            self.log("❌", date: date, messages: messages, fileName: fileName, function: function, line: line, shouldLog: shouldLog) // NO I18N
        }
    }
    
    public static func logWarning(_ messages: Any..., fileName: String = #file, function: String = #function, line:Int = #line, shouldLog: Bool = Logger.shouldLog, date: Date = Date()) {
        self.sQueue.async {
            self.log("⚠️", date: date, messages: messages, fileName: fileName, function: function, line: line, shouldLog: shouldLog) // NO I18N
        }
    }

    public static func logInfo(_ messages: Any..., fileName: String = #file, function: String = #function, line: Int = #line, shouldLog: Bool = Logger.shouldLog, date: Date = Date()) {
        self.sQueue.async {
            self.log("ℹ️", date: date, messages: messages, fileName: fileName, function: function, line: line, shouldLog: shouldLog) // NO I18N
        }
    }
    
    deinit {
        Logger.logInfo("deinit")
    }
    
    // Blocking Class Initialization by using `private`
    private init() { }
}

// MARK: Helper Functions Extension
private extension Logger {
    private static func log(_ type: String = "🖌", date: Date = Date(), messages: Any..., fileName: String = String.YV_SPACE, function: String = #function, line: Int = #line, shouldLog: Bool) { //NO I18N
        
        #if !DEBUG
        
        return
        
        #else
        
        guard (shouldLog || Logger.shouldForceLog) else {
            return
        }
        let fileName = fileName.components(separatedBy: String.YV_FORWARD_SLASH).last ?? String.YV_EMPTY
        
        print("㏒", type, self.dFrmtr.yv_microsecondPrecisionString(from: date), fileName, String.YV_COLON, function, "in line:", line, String.YV_HYPHEN, separator: String.YV_SPACE, terminator: String.YV_SPACE) //NO I18N
        printArrayOfMessages(messages: messages)

        #endif
    }
    
    private static func printArrayOfMessages(messages: Array<Any>) {
        for message in messages {
            if message is Array<Any> {
                self.printArrayOfMessages(messages: message as! Array)
                continue
            }
            print(message, separator: String.YV_SPACE, terminator: String.YV_SPACE)
        }
        print(String.YV_EMPTY, separator: String.YV_EMPTY, terminator: String.YV_NEW_LINE)
    }
}
