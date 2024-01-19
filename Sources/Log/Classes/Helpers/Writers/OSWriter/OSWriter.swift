//
// log
// Copyright © 2024 Space Code. All rights reserved.
//

import Foundation
import OSLog

// MARK: - OSWriter

final class OSWriter: IOSWriter {
    // MARK: Properties

    /// The optional subsystem for categorizing log messages.
    private let subsystem: String
    /// The optional category for categorizing log messages.
    private let category: String

    /// An internal lazy property for initializing the OSLog instance.
    private var osLog: OSLog { OSLog(subsystem: subsystem, category: category) }

    /// An internal lazy property for initializing WriteStrategy instance.
    private lazy var writerStrategy: IOSWriterStrategy = {
        if #available(macOS 11.0, iOS 14.0, watchOS 7.0, tvOS 14.0, *) {
            return os.Logger(osLog)
        } else {
            return LegacyOSLogger(osLog: osLog)
        }
    }()

    // MARK: Initialization

    /// Creates a `OSWriter` instance.
    ///
    /// - Parameters:
    ///   - subsystem: An optional subsystem for categorizing log messages.
    ///   - category: An optional category for categorizing log messages.
    init(subsystem: String, category: String) {
        self.subsystem = subsystem
        self.category = category
    }

    // MARK: IOSWriter

    func log(type: OSLogType, _ message: String) {
        writerStrategy.log(type: type, message)
    }
}

// MARK: OSWriter.LegacyOSLogger

private extension OSWriter {
    struct LegacyOSLogger: IOSWriterStrategy {
        // MARK: Private

        private let osLog: OSLog

        // MARK: Initialization

        init(osLog: OSLog) {
            self.osLog = osLog
        }

        // MARK: IOSWriterStrategy

        func log(type: OSLogType, _ message: String) {
            os_log("%s", log: osLog, type: type, message)
        }
    }
}
