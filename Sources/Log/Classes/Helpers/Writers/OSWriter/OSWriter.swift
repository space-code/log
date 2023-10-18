//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation
import OSLog

// MARK: - OSWriter

/// A class that conforms to the IOSWriter protocol and writes log messages to the Apple OSLog system.
public final class OSWriter: IOSWriter {
    // MARK: Initialization

    /// Creates a new `OSWriter` instance.
    public init() {}

    // MARK: IOSWriter

    public func log(_ message: StaticString, log: OSLog, type: OSLogType, _ args: CVarArg...) {
        os_log(message, log: log, type: type, args)
    }
}
