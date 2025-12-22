//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

/// A protocol that defines the interface for transforming and styling log messages.
///
/// Types conforming to `ILogFormatter` act as individual steps in a formatting pipeline.
/// They are responsible for taking a message string and augmenting it with additional
/// information—such as timestamps, tags, or emojis—based on the message's severity.
public protocol ILogFormatter {
    /// Processes the input message and returns a decorated version of it.
    ///
    /// This method is called by a `Logger` or a `Printer` strategy to prepare the
    /// message for final output. Since formatters are often used in a chain,
    /// the `message` parameter might already contain modifications from previous formatters.
    ///
    /// - Parameters:
    ///   - message: The current string content of the log message.
    ///   - logLevel: The `LogLevel` associated with the message, used to determine
    ///     appropriate styling or metadata.
    /// - Returns: A transformed string containing the formatted log message.
    func format(message: String, with logLevel: LogLevel) -> String
}
