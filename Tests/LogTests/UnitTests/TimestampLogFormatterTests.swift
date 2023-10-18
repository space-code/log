//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Log
import XCTest

// MARK: - TimestampLogFormatterTests

final class TimestampLogFormatterTests: XCTestCase {
    // MARK: Properties

    private var sut: TimestampLogFormatter!

    // MARK: XCTestCase

    override func setUp() {
        super.setUp()
        sut = TimestampLogFormatter(dateFormat: .dateFormat)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests

    func test_thatTimestampFormaterFormatsLogMessage() {
        // given
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = .dateFormat
        let date = dateFormatter.string(from: Date())

        // when
        let message = sut.format(message: .message, with: .all)

        // then
        XCTAssertEqual(message, "\(date) \(String.message)")
    }
}

// MARK: - Constants

private extension String {
    static let message = "message"
    static let dateFormat = "dd.MM.yyyy"
}
