//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation
import OSLog

// MARK: - OSPrinter

/// A class for logging messages using the OSLog system.
public final class OSPrinter {
    // MARK: Properties

    /// An array of log formatters used to customize log message output.
    public let formatters: [ILogFormatter]
    /// The optional subsystem for categorizing log messages.
    public let subsystem: String
    /// The optional category for categorizing log messages.
    public let category: String
    /// The os writer.
    public let osWriter: IOSWriter

    /// An internal lazy property for initializing the OSLog instance.
    private lazy var osLog: OSLog = .init(subsystem: subsystem, category: category)

    // MARK: Initialization

    /// Creates a new `OSPrinter` instance.
    ///
    /// - Parameters:
    ///   - subsystem: An optional subsystem for categorizing log messages.
    ///   - category: An optional category for categorizing log messages.
    ///   - formatters: An array of log formatters for customizing log messages.
    ///   - osWriter: An os writer.
    public init(
        subsystem: String = "os_printer",
        category: String = "",
        formatters: [ILogFormatter],
        osWriter: IOSWriter = OSWriter()
    ) {
        self.subsystem = subsystem
        self.category = category
        self.formatters = formatters
        self.osWriter = osWriter
    }
}

// MARK: IStyleLogStrategy

extension OSPrinter: IStyleLogStrategy {
    public func log(_ message: String, logLevel: LogLevel) {
        let message = formatMessage(message, logLevel: logLevel)
        let type = sysLogPriority(logLevel)
        osWriter.log("%s", log: osLog, type: type, message)
    }
}

// MARK: - Extension

extension OSPrinter {
    private func sysLogPriority(_ logLevel: LogLevel) -> OSLogType {
        switch logLevel {
        case .debug:
            return .debug
        case .info:
            return .info
        case .fault:
            return .fault
        case .error:
            return .error
        default:
            return .default
        }
    }
}
