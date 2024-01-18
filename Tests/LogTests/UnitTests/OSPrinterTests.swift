//
// log
// Copyright © 2024 Space Code. All rights reserved.
//

@testable import Log
import XCTest

// MARK: - OSPrinterTests

final class OSPrinterTests: XCTestCase {
    // MARK: Properties

    private var formatterMock: LogFormatterMock!
    private var osWriterMock: OSWriterMock!

    private var sut: OSPrinter!

    // MARK: XCTestCase

    override func setUp() {
        super.setUp()
        formatterMock = LogFormatterMock()
        osWriterMock = OSWriterMock()
        sut = OSPrinter(
            formatters: [formatterMock],
            osWriter: osWriterMock
        )
    }

    override func tearDown() {
        formatterMock = nil
        osWriterMock = nil
        sut = nil
        super.tearDown()
    }

    // MARK: Tests

    func test_thatConsolePrinterLogsMessage() {
        // given
        formatterMock.stubbedFormatResult = .message

        // when
        sut.log(.message, logLevel: .all)

        // then
        XCTAssertEqual(osWriterMock.invokedLogParameters?.message, .message)
    }

    func test_thatConsolePrinterLogsMessage_whenLogLevelIsDebug() {
        // given
        formatterMock.stubbedFormatResult = .message

        // when
        sut.log(.message, logLevel: .debug)

        // then
        XCTAssertEqual(osWriterMock.invokedLogParameters?.message, .message)
    }

    func test_thatConsolePrinterLogsMessage_whenLogLevelIsInfo() {
        // given
        formatterMock.stubbedFormatResult = .message

        // when
        sut.log(.message, logLevel: .info)

        // then
        XCTAssertEqual(osWriterMock.invokedLogParameters?.message, .message)
    }

    func test_thatConsolePrinterLogsMessage_whenLogLevelIsError() {
        // given
        formatterMock.stubbedFormatResult = .message

        // when
        sut.log(.message, logLevel: .error)

        // then
        XCTAssertEqual(osWriterMock.invokedLogParameters?.message, .message)
    }

    func test_thatConsolePrinterLogsMessage_whenLogLevelIsFault() {
        // given
        formatterMock.stubbedFormatResult = .message

        // when
        sut.log(.message, logLevel: .fault)

        // then
        XCTAssertEqual(osWriterMock.invokedLogParameters?.message, .message)
    }
}

// MARK: - Constants

private extension String {
    static let subsystem = "subsystem"
    static let category = "category"
    static let message = "message"
}
