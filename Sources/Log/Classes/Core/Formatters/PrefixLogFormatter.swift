//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

/// A log formatter that adds a custom prefix to log messages.
public struct PrefixLogFormatter: ILogFormatter {
    // MARK: Properties

    /// The custom prefix to be added to log messages.
    private let name: String

    // MARK: Initialization

    /// Creates a new `PrefixLogFormatter` instance with the specified prefix.
    ///
    /// - Parameter name: The custom prefix to be added to log messages.
    public init(name: String) {
        self.name = name
    }

    // MARK: ILogFormatter

    public func format(message: String, with logLevel: LogLevel) -> String {
        switch logLevel {
        case .fault:
            return "🚨🚨🚨 [\(name)] => \(message)"
        case .error:
            return "💣💥💣💥 [\(name)] => \(message)"
        default:
            return "[\(name)] => \(message)"
        }
    }
}
