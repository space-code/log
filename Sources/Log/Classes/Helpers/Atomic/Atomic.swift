//
// log
// Copyright © 2024 Space Code. All rights reserved.
//

import Foundation

// MARK: - Atomic

/// The Atomic class is designed to provide thread-safe access to a mutable value.
final class Atomic<Value> {
    // MARK: Properties

    /// NSLock instance for synchronization.
    private let lock = NSLock()
    /// The actual mutable value.
    private var _value: Value

    /// Computed property to get and set the value atomically
    var value: Value {
        get { lock.synchronized { _value } }
        set { lock.synchronized { _value = newValue }}
    }

    // MARK: Initialization

    /// Initializes the Atomic instance with an initial value.
    init(value: Value) {
        _value = value
    }
}

// MARK: - Extensions

private extension NSLock {
    /// Synchronizes a code block using the NSLock instance.
    /// This helps ensure that only one thread can access the critical section at a time.
    func synchronized<T>(block: () throws -> T) rethrows -> T {
        lock()
        defer { unlock() }
        return try block()
    }
}
