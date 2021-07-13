@testable import kindaVim
import XCTest

class UsingKS_BaseTests: XCTestCase {

    let keyboardStrategyMock = KeyboardStrategyMock()

    override func setUp() {
        KindaVimEngine.shared.keyboardStrategy = keyboardStrategyMock
        KindaVimEngine.shared.asNormalMode = FailingAccessibilityStrategyNormalModeStub()
        KindaVimEngine.shared.enterNormalMode()
    }

}
