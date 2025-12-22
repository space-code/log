//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

// MARK: - LogLevel

/// A set of options representing different levels of logging severity.
///
/// Since `LogLevel` conforms to `OptionSet`, you can use it to specify a single
/// level or a combination of levels (e.g., `[.info, .error]`).
public struct LogLevel: OptionSet, Sendable {
    // MARK: - Initialization

    /// Creates a new log level from a raw bitmask value.
    ///
    /// - Parameter rawValue: The bitmask value representing the desired log levels.
    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }

    // MARK: - Types

    /// The type of the value used to represent the bitmask.
    public typealias RawValue = UInt

    /// No logging. Usually used to disable all log output.
    public static let off = LogLevel(rawValue: offBitmask)

    /// Designates fine-grained informational events that are most useful to debug an application.
    public static let debug = LogLevel(rawValue: debugBitmask)

    /// Designates informational messages that highlight the progress of the application at a high level.
    public static let info = LogLevel(rawValue: infoBitmask)

    /// Designates error events that might still allow the application to continue running.
    public static let error = LogLevel(rawValue: errorBitmask)

    /// Designates severe error events that lead the application to abort or fail critically.
    public static let fault = LogLevel(rawValue: faultBitmask)

    /// A set containing all possible log levels.
    public static let all = LogLevel(rawValue: allBitmask)

    /// The corresponding value of the raw type used to create this instance.
    public let rawValue: RawValue

    // MARK: - Private Constants

    private static let offBitmask: RawValue = 1 << 0
    private static let debugBitmask: RawValue = 1 << 1
    private static let infoBitmask: RawValue = 1 << 2
    private static let errorBitmask: RawValue = 1 << 3
    private static let faultBitmask: RawValue = 1 << 4
    private static let allBitmask: RawValue = 0b1111_1111_1111_1111_1111_1111_1111_1111
}
