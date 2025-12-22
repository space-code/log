//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

/// A protocol defining an interface for writing simple text messages to a console or standard output.
///
/// Implementations of `IConsoleWriter` are typically used for basic debugging or
/// environment-specific logging where the overhead of Apple's Unified Logging System
/// is not necessary.
protocol IConsoleWriter {
    /// Outputs a message string to the console.
    ///
    /// - Parameter message: The string content to be written to the output stream.
    func print(_ message: String)
}
