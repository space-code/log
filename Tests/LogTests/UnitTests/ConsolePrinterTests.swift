//
// log
// Copyright © 2024 Space Code. All rights reserved.
//

@testable import Log
import XCTest

// MARK: - ConsolePrinterTests

final class ConsolePrinterTests: XCTestCase {
    // MARK: Properties

    private var formatterMock: LogFormatterMock!
    private var consoleWriterMock: ConsoleWriterMock!

    private var sut: ConsolePrinter!

    // MARK: XCTestCase

    override func setUp() {
        super.setUp()
        formatterMock = LogFormatterMock()
        consoleWriterMock = ConsoleWriterMock()
        sut = ConsolePrinter(formatters: [formatterMock], consoleWriter: consoleWriterMock)
    }

    override func tearDown() {
        formatterMock = nil
        consoleWriterMock = nil
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
        XCTAssertEqual(consoleWriterMock.invokedPrintParameters?.message, .message)
    }
}

// MARK: - Constants

private extension String {
    static let message = "message"
}
