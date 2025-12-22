//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

// MARK: - Logger

/// A high-level logging coordinator responsible for filtering and dispatching log messages.
///
/// `Logger` acts as the central entry point for the logging system. It evaluates whether a message
/// should be logged based on the current `logLevel` and then broadcasts allowed messages
/// to a collection of `IPrinterStrategy` implementations.
open class Logger {
    // MARK: Properties

    /// A recursive lock used to synchronize access to the logger's mutable state.
    private let lock = NSRecursiveLock()

    /// Internal storage for the log level, protected by a lock.
    private var _logLevel: LogLevel

    /// The active log level configuration for this logger.
    ///
    /// This property uses a lock to ensure thread-safe read and write access.
    public var logLevel: LogLevel {
        lock.lock()
        defer { lock.unlock() }
        return _logLevel
    }

    /// The collection of output strategies (printers) that handle the actual delivery of log messages.
    let printers: [IPrinterStrategy]

    // MARK: - Initialization

    /// Initializes a new `Logger` instance.
    ///
    /// - Parameters:
    ///   - printers: An array of strategies defining where logs should be sent (e.g., Console, OSLog, File).
    ///   - logLevel: The initial set of allowed log levels. Defaults to specific levels if not provided.
    public init(
        printers: [IPrinterStrategy],
        logLevel: LogLevel
    ) {
        self.printers = printers
        _logLevel = logLevel
    }

    /// Atomically updates the current log level using a transformation closure.
    ///
    /// This method prevents race conditions that can occur when multiple threads try to
    /// modify the `logLevel` simultaneously (e.g., two threads trying to add different flags at once).
    ///
    /// - Parameter transform: A closure that receives the current `LogLevel` and returns the new desired value.
    public func updateLogLevel(_ transform: (LogLevel) -> LogLevel) {
        lock.lock()
        defer { lock.unlock() }
        _logLevel = transform(_logLevel)
    }

    // MARK: - Private Methods

    /// Dispatches a message to all registered printers if the log level is enabled.
    ///
    /// - Parameters:
    ///   - message: The string content to log.
    ///   - logLevel: The severity level associated with this message.
    private func log(_ message: String, logLevel: LogLevel) {
        guard isLoggerEnabled(for: logLevel) else { return }
        printers.forEach { $0.log(message, logLevel: logLevel) }
    }

    /// Evaluates whether the current logger configuration allows a specific log level.
    ///
    /// - Parameter logLevel: The level to validate against the current settings.
    /// - Returns: `true` if the level is included in the active `logLevel` set.
    private func isLoggerEnabled(for logLevel: LogLevel) -> Bool {
        self.logLevel.contains(logLevel)
    }
}

// MARK: ILogger

extension Logger: ILogger {
    /// Logs a message for debugging purposes.
    /// - Parameter message: A closure returning the string to log, evaluated only if `.debug` is enabled.
    public func debug(message: @autoclosure () -> String) {
        log(message(), logLevel: .debug)
    }

    /// Logs an informational message highlighting application progress.
    /// - Parameter message: A closure returning the string to log, evaluated only if `.info` is enabled.
    public func info(message: @autoclosure () -> String) {
        log(message(), logLevel: .info)
    }

    /// Logs a critical fault that may require system-level attention.
    /// - Parameter message: A closure returning the string to log, evaluated only if `.fault` is enabled.
    public func fault(message: @autoclosure () -> String) {
        log(message(), logLevel: .fault)
    }

    /// Logs an error that occurred during execution.
    /// - Parameter message: A closure returning the string to log, evaluated only if `.error` is enabled.
    public func error(message: @autoclosure () -> String) {
        log(message(), logLevel: .error)
    }
}
