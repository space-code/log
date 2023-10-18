//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

// MARK: - IStyleLogStrategy

/// Specifies the format to be used in the log message
protocol IStyleLogStrategy: IPrinterStrategy {
    /// An array of log formatters to customize log message output.
    var formatters: [ILogFormatter] { get }
}

extension IStyleLogStrategy {
    /// Format the message using formatting rules.
    ///
    /// - Parameters:
    ///   - message: A `String` value that contains the message.
    ///   - logLevel: A `LogLevel` value that contains the logging level.
    ///
    /// - Returns: Formatted message.
    func formatMessage(_ message: String, logLevel: LogLevel) -> String {
        var message = message
        formatters.forEach { message = $0.format(message: message, with: logLevel) }
        return message
    }
}
