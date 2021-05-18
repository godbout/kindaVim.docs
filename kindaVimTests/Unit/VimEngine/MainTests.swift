@testable import kindaVim
import XCTest

class MainTests: XCTestCase {

    let accessibilityStrategyMock = AccessibilityStrategyMock()

    override func setUp() {
        VimEngine.shared.keyboardStrategy = KeyboardStrategyMock()
        VimEngine.shared.accessibilityStrategy = accessibilityStrategyMock
    }

}

extension MainTests {

    func test_that_when_entering_normal_mode_from_insert_mode_the_caret_goes_left_one_character_if_AXUIElement_is_type_text() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "")

        VimEngine.shared.enterInsertMode()
        VimEngine.shared.enterNormalMode()

        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "h(on:)")
    }

    func test_that_when_entering_normal_mode_from_operator_pending_mode_the_caret_does_not_go_left() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "")

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
        VimEngine.shared.enterNormalMode()

        XCTAssertNotEqual(accessibilityStrategyMock.functionCalled, "h(on:)")
    }

}
