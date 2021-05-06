@testable import kindaVim
import XCTest

class BaseTests: XCTestCase {

    let keyboardStrategyMock = KeyboardStrategyMock()

    override func setUp() {
        VimEngineController.shared.keyboardStrategy = keyboardStrategyMock
        VimEngineController.shared.accessibilityStrategy = FailingAccessibilityStrategyStub()
        VimEngineController.shared.enterCommandMode()
    }

}
