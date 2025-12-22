//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

/// A protocol defining the public interface for a logging coordinator.
///
/// `ILogger` provides a set of methods for dispatching messages at various severity levels.
/// Implementations should handle filtering based on the current configuration and ensure
/// that log production has minimal impact on application performance.
public protocol ILogger {
    /// Dispatches a message for fine-grained informational events useful for debugging.
    ///
    /// - Parameter message: An autoclosure returning the string to log. The closure is
    ///   evaluated only if the `.debug` log level is active, preventing unnecessary
    ///   string construction.
    func debug(message: @autoclosure () -> String)

    /// Dispatches an informational message that highlights the progress of the application.
    ///
    /// - Parameter message: An autoclosure returning the string to log. The closure is
    ///   evaluated only if the `.info` log level is active.
    func info(message: @autoclosure () -> String)

    /// Dispatches a message about a severe error or system-level fault.
    ///
    /// Use this for critical issues that may require system-level attention or indicate
    /// a corruption of state.
    ///
    /// - Parameter message: An autoclosure returning the string to log. The closure is
    ///   evaluated only if the `.fault` is active.
    func fault(message: @autoclosure () -> String)

    /// Dispatches a message about an error event that might still allow the application to continue running.
    ///
    /// - Parameter message: An autoclosure returning the string to log. The closure is
    ///   evaluated only if the `.error` log level is active.
    func error(message: @autoclosure () -> String)
}
