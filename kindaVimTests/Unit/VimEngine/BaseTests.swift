@testable import kindaVim
import XCTest

class BaseTests: XCTestCase {

    let keyboardStrategyMock = KeyboardStrategyMock()

    override func setUp() {
        VimEngine.shared.keyboardStrategy = keyboardStrategyMock
        VimEngine.shared.accessibilityStrategy = FailingAccessibilityStrategyStub()
        VimEngine.shared.enterNormalMode()
    }

}
