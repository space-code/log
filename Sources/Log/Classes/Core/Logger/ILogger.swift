//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

/// A type that provides logging functionality.
public protocol ILogger {
    /// Dispatches the given message using the logger if the debug log level is set.
    ///
    /// - Parameter message: An autoclosure returning the message to log.
    func debug(message: @autoclosure () -> String)

    /// Dispatches the given message using the logger if the info log level is set.
    ///
    /// - Parameter message: An autoclosure returning the message to log.
    func info(message: @autoclosure () -> String)

    /// Dispatches the given message using the logger if the fault log level is set.
    ///
    /// - Parameter message: An autoclosure returning the message to log.
    func fault(message: @autoclosure () -> String)

    /// Dispatches the given message using the logger if the error log level is set.
    ///
    /// - Parameter message: An autoclosure returning the message to log.
    func error(message: @autoclosure () -> String)
}
