//
// log
// Copyright © 2024 Space Code. All rights reserved.
//

import Log
import XCTest

// MARK: - LogIntegrationTests

final class LogIntegrationTests: XCTestCase {
    // MARK: Properties

    private var sut: Logger!

    // MARK: XCTestCase

    override func setUp() {
        super.setUp()
        let formatters: [ILogFormatter] = [
            TimestampLogFormatter(dateFormat: "dd/MM/yyyy"),
            PrefixLogFormatter(name: "LogIntegrationTests"),
        ]

        sut = Logger(
            printers: [
                ConsolePrinter(
                    formatters: formatters
                ),
                OSPrinter(
                    subsystem: .subsystem,
                    category: .category,
                    formatters: formatters
                ),
            ],
            logLevel: .all
        )
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests

    // The test just checks that the methods don't cause a crash
    // when printing a message to different outputs.
    func test_logDoesNotThrowUnexpectedBehavior_whenLogMessages() {
        // 1. Print an info message
        sut.info(message: .message)

        // 2. Print a debug message
        sut.debug(message: .message)

        // 3. Print an error message
        sut.error(message: .message)

        // 4. Print a fault message
        sut.fault(message: .message)
    }
}

// MARK: - Constants

private extension String {
    static let subsystem = "subsystem"
    static let category = "category"
    static let message = "text"
}
