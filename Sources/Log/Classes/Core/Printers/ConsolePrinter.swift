//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

// MARK: - ConsolePrinter

/// A log printer that outputs formatted messages to the standard console.
///
/// `ConsolePrinter` transforms raw log messages through a chain of formatters
/// and sends the final string to a `IConsoleWriter`.
public final class ConsolePrinter {
    // MARK: - Properties

    /// A collection of formatters applied sequentially to customize the log message string.
    ///
    /// Each formatter can add metadata like timestamps, log levels, or emojis before the message is printed.
    public let formatters: [ILogFormatter]

    /// The underlying writer responsible for the actual delivery of the message to the console output.
    private let consoleWriter: IConsoleWriter

    // MARK: - Initialization

    /// Creates a new `ConsolePrinter` instance with a default console writer.
    ///
    /// - Parameter formatters: An array of log formatters used to process and style the log messages.
    public init(formatters: [ILogFormatter] = []) {
        self.formatters = formatters
        consoleWriter = ConsoleWriter()
    }

    /// Creates a new `ConsolePrinter` instance with a custom console writer.
    ///
    /// This initializer is primarily used for dependency injection in unit tests to verify output
    /// without printing to the real system console.
    ///
    /// - Parameters:
    ///   - formatters: An array of log formatters for customizing log messages.
    ///   - consoleWriter: An object conforming to `IConsoleWriter` to handle message output.
    init(formatters: [ILogFormatter] = [], consoleWriter: IConsoleWriter = ConsoleWriter()) {
        self.formatters = formatters
        self.consoleWriter = consoleWriter
    }
}

// MARK: IStyleLogStrategy

extension ConsolePrinter: IStyleLogStrategy {
    /// Processes and prints a log message to the console.
    ///
    /// The message is first passed through all registered `formatters` before being
    /// sent to the `consoleWriter`.
    ///
    /// - Parameters:
    ///   - message: The raw string content to be logged.
    ///   - logLevel: The severity level of the log, used by formatters for styling or prefixing.
    public func log(_ message: String, logLevel: LogLevel) {
        let message = formatMessage(message, logLevel: logLevel)
        consoleWriter.print(message)
    }
}
