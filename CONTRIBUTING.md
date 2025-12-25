# Contributing to Log

First off, thank you for considering contributing to Log! It's people like you that make Log such a great tool.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
  - [Development Setup](#development-setup)
  - [Project Structure](#project-structure)
- [How Can I Contribute?](#how-can-i-contribute)
  - [Reporting Bugs](#reporting-bugs)
  - [Suggesting Features](#suggesting-features)
  - [Improving Documentation](#improving-documentation)
  - [Submitting Code](#submitting-code)
- [Development Workflow](#development-workflow)
  - [Branching Strategy](#branching-strategy)
  - [Commit Guidelines](#commit-guidelines)
  - [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
  - [Swift Style Guide](#swift-style-guide)
  - [Code Quality](#code-quality)
  - [Testing Requirements](#testing-requirements)
- [Community](#community)

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code. Please report unacceptable behavior to nv3212@gmail.com.

See [CODE_OF_CONDUCT.md](https://github.com/space-code/log/blob/main/CODE_OF_CONDUCT.md) for details.

## Getting Started

### Development Setup

1. **Fork the repository**
   ```bash
   # Click the "Fork" button on GitHub
   ```

2. **Clone your fork**
   ```bash
   git clone https://github.com/YOUR_USERNAME/log.git
   cd log
   ```

3. **Set up the development environment**
   ```bash
   # Bootstrap the project
   make bootstrap
   ```

4. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

5. **Open the project in Xcode**
   ```bash
   open Package.swift
   ```

## How Can I Contribute?

### Reporting Bugs

Before creating a bug report, please check the [existing issues](https://github.com/space-code/log/issues) to avoid duplicates.

When creating a bug report, include:

- **Clear title** - Describe the issue concisely
- **Reproduction steps** - Detailed steps to reproduce the bug
- **Expected behavior** - What you expected to happen
- **Actual behavior** - What actually happened
- **Environment** - OS, Xcode version, Swift version
- **Code samples** - Minimal reproducible example
- **Error messages** - Complete error output if applicable

**Example:**
```markdown
**Title:** TimestampLogFormatter produces incorrect date format

**Steps to reproduce:**
1. Create TimestampLogFormatter with custom date format
2. Log a message with the formatter
3. Observe the timestamp output

**Expected:** Timestamp should use the specified format "yyyy-MM-dd"
**Actual:** Timestamp uses default format "HH:mm:ss"

**Environment:**
- iOS 16.0
- Xcode 14.3
- Swift 5.7

**Code:**
\`\`\`swift
let formatter = TimestampLogFormatter(dateFormat: "yyyy-MM-dd")
let printer = ConsolePrinter(formatters: [formatter])
let log = Logger(printers: [printer], logLevel: .all)
log.info(message: "Test")
// Expected: ℹ️ 2024-01-15 => Test
// Actual: ℹ️ 14:30:45 => Test
\`\`\`
```

### Suggesting Features

We love feature suggestions! When proposing a new feature, include:

- **Problem statement** - What problem does this solve?
- **Proposed solution** - How should it work?
- **Alternatives** - What alternatives did you consider?
- **Use cases** - Real-world scenarios
- **API design** - Example code showing usage
- **Breaking changes** - Will this break existing code?

**Example:**
```markdown
**Feature:** Add JSON formatter for structured logging

**Problem:** Current formatters produce plain text, making it difficult to parse logs programmatically or integrate with log aggregation services.

**Solution:** Add JSONLogFormatter that outputs logs in structured JSON format.

**API:**
\`\`\`swift
let formatter = JSONLogFormatter(
    includeTimestamp: true,
    includeLevel: true,
    additionalFields: ["environment": "production"]
)

let printer = ConsolePrinter(formatters: [formatter])
let log = Logger(printers: [printer], logLevel: .all)
log.info(message: "User logged in")

// Output: {"level":"info","timestamp":"2024-01-15T14:30:45Z","message":"User logged in","environment":"production"}
\`\`\`

**Use case:** Mobile apps that send logs to centralized logging services like Elasticsearch or Splunk.
```

### Improving Documentation

Documentation improvements are always welcome:

- **Code comments** - Add/improve inline documentation
- **DocC documentation** - Enhance documentation articles
- **README** - Fix typos, add examples
- **Guides** - Write tutorials or how-to guides
- **API documentation** - Document public APIs

### Submitting Code

1. **Check existing work** - Look for related issues or PRs
2. **Discuss major changes** - Open an issue for large features
3. **Follow coding standards** - See [Coding Standards](#coding-standards)
4. **Write tests** - All code changes require tests
5. **Update documentation** - Keep docs in sync with code
6. **Create a pull request** - Use clear description

## Development Workflow

### Branching Strategy

We use a simplified branching model:

- **`main`** - Main development branch (all PRs target this)
- **`feature/*`** - New features
- **`fix/*`** - Bug fixes
- **`docs/*`** - Documentation updates
- **`refactor/*`** - Code refactoring
- **`test/*`** - Test improvements

**Branch naming examples:**
```bash
feature/json-formatter
fix/timestamp-formatter-timezone
docs/update-formatter-guide
refactor/simplify-printer-protocol
test/add-logger-edge-cases
```

### Commit Guidelines

We use [Conventional Commits](https://www.conventionalcommits.org/) for clear, structured commit history.

**Format:**
```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation changes
- `style` - Code style (formatting, no logic changes)
- `refactor` - Code refactoring
- `test` - Adding or updating tests
- `chore` - Maintenance tasks
- `perf` - Performance improvements

**Scopes:**
- `logger` - Core logger
- `printer` - Printer implementations
- `formatter` - Message formatters
- `protocol` - Protocols and interfaces
- `deps` - Dependencies

**Examples:**
```bash
feat(formatter): add JSON formatter for structured logging

Implement JSONLogFormatter that outputs logs in JSON format with
configurable fields including timestamp, level, and custom metadata.
Supports both pretty-printed and compact output modes.

Closes #34

---

fix(formatter): correct timezone handling in TimestampLogFormatter

TimestampLogFormatter was using device timezone instead of UTC.
Now properly respects the specified timezone parameter.

Fixes #56

---

docs(readme): add examples for custom formatters

Add practical examples showing how to create custom formatters
for different use cases including contextual logging and
environment-specific formatting.

---

test(printer): increase coverage for OSPrinter edge cases

Add tests for:
- Nil formatter arrays
- Empty message strings
- Special characters in log messages
- Unicode support
```

**Commit message rules:**
- Use imperative mood ("add" not "added")
- Don't capitalize first letter
- No period at the end
- Keep subject line under 72 characters
- Separate subject from body with blank line
- Reference issues in footer

### Pull Request Process

1. **Update your branch**
   ```bash
   git checkout main
   git pull upstream main
   git checkout feature/your-feature
   git rebase main
   ```

2. **Run tests and checks**
   ```bash
   # Run all tests
   swift test
   
   # Check test coverage
   swift test --enable-code-coverage
   ```

3. **Push to your fork**
   ```bash
   git push origin feature/your-feature
   ```

4. **Create pull request**
   - Target the `main` branch
   - Provide clear description
   - Link related issues
   - Include examples if applicable
   - Request review from maintainers

5. **Review process**
   - Address review comments
   - Keep PR up to date with main
   - Squash commits if requested
   - Wait for CI to pass

6. **After merge**
   ```bash
   # Clean up local branch
   git checkout main
   git pull upstream main
   git branch -d feature/your-feature
   
   # Clean up remote branch
   git push origin --delete feature/your-feature
   ```

## Coding Standards

### Swift Style Guide

We follow the [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/) and [Ray Wenderlich Swift Style Guide](https://github.com/raywenderlich/swift-style-guide).

**Key points:**

1. **Naming**
   ```swift
   // ✅ Good
   protocol ILogFormatter {
       func format(message: String, with logLevel: LogLevel) -> String
   }
   
   // ❌ Bad
   protocol Formatter {
       func fmt(_ msg: String, _ lvl: Int) -> String
   }
   ```

2. **Protocols**
   ```swift
   // ✅ Good - Use "I" prefix for protocols
   protocol IPrinter {
       var formatters: [ILogFormatter] { get }
       func print(_ message: String, logLevel: LogLevel)
   }
   
   // ❌ Bad
   protocol Printer { }
   ```

3. **Access Control**
   ```swift
   // ✅ Good - Explicit access control
   public final class Logger {
       private let printers: [IPrinter]
       private let logLevel: LogLevel
       
       public init(printers: [IPrinter], logLevel: LogLevel) {
           self.printers = printers
           self.logLevel = logLevel
       }
       
       public func info(message: String) {
           log(message: message, logLevel: .info)
       }
       
       private func log(message: String, logLevel: LogLevel) {
           // Implementation
       }
   }
   ```

4. **Documentation**
   ```swift
   /// A formatter that adds a timestamp to log messages.
   ///
   /// The timestamp is formatted according to the specified date format string.
   /// If no format is provided, defaults to "HH:mm:ss".
   ///
   /// - Example:
   /// ```swift
   /// let formatter = TimestampLogFormatter(dateFormat: "yyyy-MM-dd HH:mm:ss")
   /// let formattedMessage = formatter.format(
   ///     message: "User logged in",
   ///     with: .info
   /// )
   /// // Result: "2024-01-15 14:30:45 => User logged in"
   /// ```
   public struct TimestampLogFormatter: ILogFormatter {
       private let dateFormat: String
       
       public init(dateFormat: String = "HH:mm:ss") {
           self.dateFormat = dateFormat
       }
       
       public func format(message: String, with logLevel: LogLevel) -> String {
           // Implementation
       }
   }
   ```

### Code Quality

- **No force unwrapping** - Use optional binding or guards
- **No force casting** - Use conditional casting
- **No magic numbers** - Use named constants
- **Single responsibility** - One class, one purpose
- **DRY principle** - Don't repeat yourself
- **SOLID principles** - Follow SOLID design

**Example:**
```swift
// ✅ Good
private enum LogConstants {
    static let defaultDateFormat = "HH:mm:ss"
    static let messagePrefix = " => "
}

public func format(message: String, with logLevel: LogLevel) -> String {
    let timestamp = formatTimestamp()
    return "\(timestamp)\(LogConstants.messagePrefix)\(message)"
}

// ❌ Bad
public func format(message: String, with logLevel: LogLevel) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss"  // Magic string
    let timestamp = formatter.string(from: Date())
    return "\(timestamp) => \(message)"  // Hardcoded separator
}
```

### Testing Requirements

All code changes must include tests following the `test_that<Action>_when<Condition>` naming convention:

1. **Unit tests** - Test individual components
2. **Integration tests** - Test component interactions
3. **Edge cases** - Test boundary conditions
4. **Error handling** - Test failure scenarios

**Coverage requirements:**
- New code: minimum 80% coverage
- Modified code: maintain or improve existing coverage
- Critical paths: 100% coverage

**Test naming convention:**
```swift
// Pattern: test_that<Action>_when<Condition>

test_thatLoggerPrintsMessage_whenLogLevelMatches()
test_thatLoggerIgnoresMessage_whenLogLevelTooLow()
test_thatFormatterAddsPrefix_whenPrefixIsProvided()
test_thatFormatterReturnsOriginalMessage_whenNoFormattersExist()
test_thatPrinterAppliesAllFormatters_whenMultipleFormattersExist()
```

**Test structure:**
```swift
import XCTest
@testable import Log

final class LoggerTests: XCTestCase {
    var sut: Logger!
    var mockPrinter: MockPrinter!
    
    override func setUp() {
        super.setUp()
        mockPrinter = MockPrinter()
        sut = Logger(
            printers: [mockPrinter],
            logLevel: .all
        )
    }
    
    override func tearDown() {
        mockPrinter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Success Tests
    
    func test_thatLoggerPrintsMessage_whenLogLevelMatches() {
        // Given
        let expectedMessage = "Test message"
        
        // When
        sut.info(message: expectedMessage)
        
        // Then
        XCTAssertEqual(mockPrinter.printedMessages.count, 1)
        XCTAssertEqual(mockPrinter.printedMessages.first, expectedMessage)
        XCTAssertEqual(mockPrinter.lastLogLevel, .info)
    }
    
    // MARK: - Filtering Tests
    
    func test_thatLoggerIgnoresMessage_whenLogLevelTooLow() {
        // Given
        sut = Logger(printers: [mockPrinter], logLevel: .error)
        
        // When
        sut.debug(message: "Debug message")
        sut.info(message: "Info message")
        
        // Then
        XCTAssertTrue(mockPrinter.printedMessages.isEmpty)
    }
    
    func test_thatLoggerPrintsMessage_whenLogLevelIsHigherOrEqual() {
        // Given
        sut = Logger(printers: [mockPrinter], logLevel: .warning)
        
        // When
        sut.warning(message: "Warning message")
        sut.error(message: "Error message")
        
        // Then
        XCTAssertEqual(mockPrinter.printedMessages.count, 2)
    }
    
    // MARK: - Edge Cases
    
    func test_thatLoggerHandlesEmptyMessage_whenMessageIsEmpty() {
        // Given
        let emptyMessage = ""
        
        // When
        sut.info(message: emptyMessage)
        
        // Then
        XCTAssertEqual(mockPrinter.printedMessages.count, 1)
        XCTAssertEqual(mockPrinter.printedMessages.first, emptyMessage)
    }
    
    func test_thatLoggerHandlesMultiplePrinters_whenPrintersArrayIsNotEmpty() {
        // Given
        let printer1 = MockPrinter()
        let printer2 = MockPrinter()
        sut = Logger(printers: [printer1, printer2], logLevel: .all)
        let message = "Test message"
        
        // When
        sut.info(message: message)
        
        // Then
        XCTAssertEqual(printer1.printedMessages.count, 1)
        XCTAssertEqual(printer2.printedMessages.count, 1)
    }
}

// MARK: - Mock Objects

final class MockPrinter: IPrinter {
    var formatters: [ILogFormatter] = []
    var printedMessages: [String] = []
    var lastLogLevel: LogLevel?
    
    func print(_ message: String, logLevel: LogLevel) {
        printedMessages.append(message)
        lastLogLevel = logLevel
    }
}
```

**Formatter Tests Example:**
```swift
final class PrefixLogFormatterTests: XCTestCase {
    var sut: PrefixLogFormatter!
    
    override func setUp() {
        super.setUp()
        sut = PrefixLogFormatter(name: "TestPrefix")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_thatFormatterAddsPrefix_whenMessageIsProvided() {
        // Given
        let message = "Test message"
        let logLevel = LogLevel.info
        
        // When
        let result = sut.format(message: message, with: logLevel)
        
        // Then
        XCTAssertTrue(result.contains("[TestPrefix]"))
        XCTAssertTrue(result.contains(message))
    }
    
    func test_thatFormatterHandlesEmptyMessage_whenMessageIsEmpty() {
        // Given
        let emptyMessage = ""
        
        // When
        let result = sut.format(message: emptyMessage, with: .info)
        
        // Then
        XCTAssertTrue(result.contains("[TestPrefix]"))
    }
    
    func test_thatFormatterPreservesMessageContent_whenSpecialCharactersExist() {
        // Given
        let specialMessage = "Test 🚀 message with émojis and spëcial çharacters"
        
        // When
        let result = sut.format(message: specialMessage, with: .info)
        
        // Then
        XCTAssertTrue(result.contains(specialMessage))
    }
}
```

## Community

- **Discussions** - Join [GitHub Discussions](https://github.com/space-code/log/discussions)
- **Issues** - Track [open issues](https://github.com/space-code/log/issues)
- **Pull Requests** - Review [open PRs](https://github.com/space-code/log/pulls)

## Recognition

Contributors are recognized in:
- GitHub contributors page
- Release notes
- Project README (for significant contributions)

## Questions?

- Check [existing issues](https://github.com/space-code/log/issues)
- Search [discussions](https://github.com/space-code/log/discussions)
- Ask in [Q&A discussions](https://github.com/space-code/log/discussions/categories/q-a)
- Email the maintainer: nv3212@gmail.com

---

Thank you for contributing to Log! 🎉

Your efforts help make this project better for everyone.
