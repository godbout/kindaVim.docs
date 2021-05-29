@testable import kindaVim
import XCTest

class UsingAS_BlockCursorTests: XCTestCase {

    let accessibilityStrategyMock = AccessibilityStrategyMock()

    override func setUp() {
        VimEngine.shared.keyboardStrategy = KeyboardStrategyMock()
        VimEngine.shared.accessibilityStrategy = accessibilityStrategyMock
    }

}

// block cursor ON
extension UsingAS_BlockCursorTests {

    func test_that_the_block_cursor_function_is_called_when_entering_normal_mode_from_insert_mode() {
        VimEngine.shared.enterInsertMode()
        VimEngine.shared.enterNormalMode()
        
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "blockCursor(_:on:)")
    }

    func test_that_the_block_cursor_function_is_not_called_when_entering_normal_mode_from_operator_pending_mode() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "")

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
        VimEngine.shared.enterNormalMode()

        XCTAssertNotEqual(accessibilityStrategyMock.functionCalled, "blockCursor(_:on:)")
    }

}

// block cursor OFF
extension UsingAS_BlockCursorTests {

    func test_that_the_block_cursor_function_is_called_when_entering_insert_mode() {
        VimEngine.shared.enterInsertMode()

        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "blockCursor(_:on:)")
    }

}
