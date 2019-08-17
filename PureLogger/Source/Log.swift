//
//  Log.swift
//  PureLogger
//
//  Created by Mikhail Panfilov on 7/15/19.
//  Copyright © 2019 Lollipop. All rights reserved.
//

import Foundation

/// Maybe the best logger in the world :P :D
public class Log {
    
    // MARK: Public properties
    
    /// An array of level for the logger to print name.
    ///
    /// Default value is `Level.allCases`.
    public var shouldPrintDateFor = Level.allCases
    /// An array of levels for the logger to print an emoji.
    ///
    /// Default value is `Level.allCases`.
    public var shouldPrintEmojiFor = Level.allCases
    /// An array of levels for the logger to print Level name.
    ///
    /// Default value is `Level.allCases`.
    public var shouldPrintLevelNameFor = Level.allCases
    /// An array of levels for the logger to print extra info like file name, line number, etc.
    ///
    /// Default value is `[.warning, .error]`.
    public var shouldPrintSystemInfoFor: [Level] = [.warning, .error]
    /// A dictionary contains an emoji that overrides default emoji for the level.
    ///
    /// Default value is `[:]`.
    public var levelEmojis: [Level: String] = [:]
    /// Determines the format of printing time for each of the logs.
    ///
    /// Default value is `yyyy-MM-dd HH:mm:ss`
    public var dateFormat = "yyyy-MM-dd HH:mm:ss" {
        didSet {
            dateFormatter.dateFormat = dateFormat
        }
    }
    /// The global instance of the logger to use across the project.
    ///
    /// For local usage please create a separate instance of the logger.
    public static var shared = Log()
    
    // MARK: Private properties
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    // MARK: Public methods
    
    public init() { }
    
    /// To be able to print anything shortly
    @discardableResult
    public convenience init(_ items: Any) {
        self.init()
        none(items)
    }
    
    public enum Level: Int, CaseIterable {
        case debug, info, warning, error
        
        public var emoji: String {
            switch self {
            case .debug: return "✏️"
            case .info: return "ℹ️"
            case .warning: return "⚠️"
            case .error: return "❌"
            }
        }
        
        public var name: String {
            switch self {
            case .debug: return "DEBUG"
            case .info: return "INFO"
            case .warning: return "WARNING"
            case .error: return "ERROR"
            }
        }
    }
    
    /// Prints item with additional information for **Level.debug** type.
    public func debug(_ item: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        print(item, level: .debug, filename: filename, line: line, column: column, funcName: funcName)
    }
    
    /// Prints item with additional information for **Level.info** type.
    public func info(_ item: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        print(item, level: .info, filename: filename, line: line, column: column, funcName: funcName)
    }
    
    /// Prints item with additional information for **Level.warning** type.
    public func warning(_ item: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        print(item, level: .warning, filename: filename, line: line, column: column, funcName: funcName)
    }
    
    /// Prints item with additional information for **Level.error** type.
    public func error(_ item: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        print(item, level: .error, filename: filename, line: line, column: column, funcName: funcName)
    }
    
    /// Prints item itself without any additional information.
    public func none(_ item: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        print(item, level: nil, filename: filename, line: line, column: column, funcName: funcName)
    }
    
    // MARK: Private methods
    
    private func getDateDescription() -> String {
        return dateFormatter.string(from: Date())
    }
    
    private func getSourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.last ?? ""
    }
    
    private func getFormattedItem(_ item: Any, level: Level?, filename: String, line: Int, column: Int, funcName: String) -> String {
        var stringToPrint = ""
        if let level = level {
            if shouldPrintDateFor.contains(level) { stringToPrint.append(getDateDescription(), withSeparator: true) }
            if shouldPrintEmojiFor.contains(level) { stringToPrint.append(getEmojiFor(level), withSeparator: true) }
            if shouldPrintLevelNameFor.contains(level) { stringToPrint.append(level.name, withSeparator: true) }
            if shouldPrintSystemInfoFor.contains(level) {
                let systemInfo = "[\(getSourceFileName(filePath: filename))]:\(line) \(funcName) ->"
                stringToPrint.append(systemInfo, withSeparator: true)
            }
        }
        stringToPrint.append("\(item)", withSeparator: true)
        return stringToPrint
    }
    
    private func getEmojiFor(_ level: Level) -> String {
        return levelEmojis[level] ?? level.emoji
    }
}

extension Log {
    func print(_ item: Any, level: Level?, filename: String, line: Int, column: Int, funcName: String) {
        #if DEBUG || STAGING
        Swift.print(getFormattedItem(item, level: level, filename: filename, line: line, column: column, funcName: funcName))
        #endif
    }
}

extension String {
    mutating func append(_ other: String, withSeparator: Bool, separator: String = " ") {
        self.append(withSeparator ? (self.isEmpty ? other : separator + other) : other)
    }
}
