//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

/// A protocol for writing messages to the console.
public protocol IConsoleWriter {
    /// Prints a message to the console output.
    ///
    /// - Parameter message: The message to be printed as a String.
    func print(_ message: String)
}
