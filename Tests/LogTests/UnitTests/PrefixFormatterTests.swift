//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Log
import XCTest

// MARK: - PrefixFormatterTests

final class PrefixFormatterTests: XCTestCase {
    // MARK: Properties

    private var sut: PrefixLogFormatter!

    // MARK: XCTestCase

    override func setUp() {
        super.setUp()
        sut = PrefixLogFormatter(name: .name)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests

    func test_thatPrefixFormatterFormatsMessage_whenLogLevelIsFault() {
        // when
        let message = sut.format(message: .message, with: .fault)

        // then
        XCTAssertEqual(message, "🚨🚨🚨 [name] => message")
    }

    func test_thatPrefixFormatterFormatsMessage_whenLogLevelIsError() {
        // when
        let message = sut.format(message: .message, with: .error)

        // then
        XCTAssertEqual(message, "💣💥💣💥 [name] => message")
    }

    func test_thatPrefixFormatterFormatsMessage_whenLogLevelIsDebug() {
        // when
        let message = sut.format(message: .message, with: .debug)

        // then
        XCTAssertEqual(message, "[name] => message")
    }

    func test_thatPrefixFormatterFormatsMessage_whenLogLevelIsInfo() {
        // when
        let message = sut.format(message: .message, with: .info)

        // then
        XCTAssertEqual(message, "[name] => message")
    }

    func test_thatPrefixFormatterFormatsMessage_whenLogLevelIsAll() {
        // when
        let message = sut.format(message: .message, with: .all)

        // then
        XCTAssertEqual(message, "[name] => message")
    }
}

// MARK: - Constants

private extension String {
    static let message = "message"
    static let name = "name"
}
