//
// log
// Copyright © 2024 Space Code. All rights reserved.
//

import Foundation

// MARK: - ConsolePrinter

/// A class for logging messages to the console output.
public final class ConsolePrinter {
    // MARK: Properties

    /// An array of log formatters used to customize log message output.
    public let formatters: [ILogFormatter]

    /// The console writer.
    private let consoleWriter: IConsoleWriter

    // MARK: Initialization

    /// Creates a new `ConsolePrinter` instance.
    ///
    /// - Parameters:
    ///   - formatters: An array of log formatters for customizing log messages.
    public init(formatters: [ILogFormatter]) {
        self.formatters = formatters
        consoleWriter = ConsoleWriter()
    }

    /// Creates a new `ConsolePrinter` instance.
    ///
    /// - Parameters:
    ///   - formatters: An array of log formatters for customizing log messages.
    ///   - consoleWriter: The console writer.
    init(formatters: [ILogFormatter], consoleWriter: IConsoleWriter) {
        self.formatters = formatters
        self.consoleWriter = consoleWriter
    }
}

// MARK: IStyleLogStrategy

extension ConsolePrinter: IStyleLogStrategy {
    public func log(_ message: String, logLevel: LogLevel) {
        let message = formatMessage(message, logLevel: logLevel)
        consoleWriter.print(message)
    }
}
