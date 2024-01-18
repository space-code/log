//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

// MARK: - Logger

/// A class responsible for logging functionality.
open class Logger {
    // MARK: Properties

    /// The current log level for this logger.
    let logLevel: LogLevel
    /// An array of printer strategies to handle the log output.
    let printers: [IPrinterStrategy]

    // MARK: Initialization

    /// Initializes a new Logger instance.
    ///
    /// - Parameters:
    ///   - printers: An array of printer strategies.
    ///   - logLevel: The initial log level.
    public init(
        printers: [IPrinterStrategy],
        logLevel: LogLevel
    ) {
        self.printers = printers
        self.logLevel = logLevel
    }

    // MARK: Private

    /// Passes the message to each receiver's printer.
    ///
    /// - Parameters:
    ///   - message: The message to dispatch.
    ///   - logLevel: The message's level.
    private func log(_ message: String, logLevel: LogLevel) {
        guard isLoggerEnabled(for: logLevel) else { return }
        printers.forEach { $0.log(message, logLevel: logLevel) }
    }

    /// Checks if the given `LogLevel` is allowed by the receiver.
    ///
    /// - Parameter logLevel: The log level to check.
    private func isLoggerEnabled(for logLevel: LogLevel) -> Bool {
        self.logLevel.contains(logLevel)
    }
}

// MARK: ILogger

extension Logger: ILogger {
    public func debug(message: @autoclosure () -> String) {
        log(message(), logLevel: .debug)
    }

    public func info(message: @autoclosure () -> String) {
        log(message(), logLevel: .info)
    }

    public func fault(message: @autoclosure () -> String) {
        log(message(), logLevel: .fault)
    }

    public func error(message: @autoclosure () -> String) {
        log(message(), logLevel: .error)
    }
}
