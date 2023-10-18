//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

// MARK: - ConsolePrinter

/// A class for logging messages to the console output.
public final class ConsolePrinter {
    // MARK: Properties

    /// An array of log formatters used to customize log message output.
    public let formatters: [ILogFormatter]

    /// The console writer.
    public let consoleWriter: IConsoleWriter

    // MARK: Initialization

    /// Creates a new `ConsolePrinter` instance.
    ///
    /// - Parameters:
    ///   - formatters: An array of log formatters for customizing log messages.
    ///   - consoleWriter: The console writer.
    public init(formatters: [ILogFormatter], consoleWriter: IConsoleWriter = ConsoleWriter()) {
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
