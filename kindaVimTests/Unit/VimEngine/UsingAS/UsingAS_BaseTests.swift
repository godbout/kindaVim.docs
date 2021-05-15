@testable import kindaVim
import XCTest

class UsingAS_BaseTests: XCTestCase {

    let accessibilityStrategyMock = AccessibilityStrategyMock()

    override func setUp() {
        VimEngine.shared.keyboardStrategy = KeyboardStrategyMock()
        VimEngine.shared.accessibilityStrategy = accessibilityStrategyMock
        VimEngine.shared.enterNormalMode()
    }

}
