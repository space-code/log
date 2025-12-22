//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

/// A protocol that defines a strategy for processing and delivering log messages.
///
/// `IPrinterStrategy` combines the responsibilities of message formatting and
/// final output delivery. Types conforming to this protocol use an array of
/// `ILogFormatter` objects to transform raw messages before writing them
/// to their respective destinations (e.g., Console, System Logs, or Files).
public protocol IPrinterStrategy {
    /// A collection of formatters used to process and style the log message content.
    ///
    /// The formatters are typically applied in sequence to add metadata such as
    /// timestamps, emojis, or thread information.
    var formatters: [ILogFormatter] { get }

    /// Processes and dispatches a log message.
    ///
    /// Implementation should first pass the raw message through the `formatters`
    /// chain and then transmit the resulting string to the specific output target.
    ///
    /// - Parameters:
    ///   - message: The raw string content provided by the logger.
    ///   - logLevel: The severity level used for both formatting decisions and
    ///     target-specific severity mapping.
    func log(_ message: String, logLevel: LogLevel)
}
