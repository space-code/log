//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

// MARK: - LogLevel

/// A set that includes all log levels.
public struct LogLevel: OptionSet {
    // MARK: Initialization

    /// Creates a new log level.
    ///
    /// - Parameter rawValue: The value that indicates a log level.
    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }

    // MARK: Types

    public typealias RawValue = UInt

    /// Creates a new default `.off` instance with a bitmask of `1 << 0`.
    public static let off = LogLevel(rawValue: offBitmask)
    /// Creates a new default `.debug` instance with a bitmask of `1 << 1`.
    public static let debug = LogLevel(rawValue: debugBitmask)
    /// Creates a new default `.info` instance with a bitmask of `1 << 2`.
    public static let info = LogLevel(rawValue: infoBitmask)
    /// Creates a new default `.error` instance with a bitmask of `1 << 3`.
    public static let error = LogLevel(rawValue: errorBitmask)
    /// Creates a new default `.fault` instance with a bitmask of `1 << 4`.
    public static let fault = LogLevel(rawValue: faultBitmask)
    /// Creates a new default `.error` instance.
    public static let all = LogLevel(rawValue: allBitmask)

    /// Returns the raw bitmask value of the LogLevel and satisfies the `RawRepresentable` protocol.
    public let rawValue: RawValue

    // MARK: Private

    private static let offBitmask: RawValue = 1 << 0
    private static let debugBitmask: RawValue = 1 << 1
    private static let infoBitmask: RawValue = 1 << 2
    private static let errorBitmask: RawValue = 1 << 3
    private static let faultBitmask: RawValue = 1 << 4
    private static let allBitmask: RawValue = 0b1111_1111_1111_1111_1111_1111_1111_1111
}
