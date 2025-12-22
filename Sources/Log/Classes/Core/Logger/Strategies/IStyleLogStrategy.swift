//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

// MARK: - IStyleLogStrategy

/// A specialized printer strategy that focuses on styling log messages before output.
///
/// `IStyleLogStrategy` provides a default implementation for taking a raw log string
/// and passing it through a chain of formatters. This ensures consistency in how
/// logs look across different output targets (e.g., Console vs. OSLog).
protocol IStyleLogStrategy: IPrinterStrategy {
    /// A collection of formatters used to customize the visual representation of the log.
    var formatters: [ILogFormatter] { get }
}

extension IStyleLogStrategy {
    /// Transforms a raw message into a formatted string by applying all registered formatters.
    ///
    /// This method iterates through the `formatters` array in the order they were provided,
    /// allowing each formatter to append, prefix, or modify the string from the previous step.
    ///
    /// - Parameters:
    ///   - message: The original raw string content to be logged.
    ///   - logLevel: The severity level, which formatters use to determine styling
    ///     (e.g., adding a 🔴 emoji for errors).
    ///
    /// - Returns: A final, fully styled string ready for output.
    func formatMessage(_ message: String, logLevel: LogLevel) -> String {
        var message = message
        // Sequentially transform the message string using the pipeline of formatters.
        formatters.forEach { message = $0.format(message: message, with: logLevel) }
        return message
    }
}
