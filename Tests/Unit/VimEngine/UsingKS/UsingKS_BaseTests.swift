@testable import kindaVim
import XCTest

class UsingKS_BaseTests: XCTestCase {

    let ksNormalModeMock = KeyboardStrategyNormalModeMock()

    override func setUp() {
        KindaVimEngine.shared.ksNormalMode = ksNormalModeMock
        KindaVimEngine.shared.asNormalMode = FailingAccessibilityStrategyNormalModeStub()
        KindaVimEngine.shared.enterNormalMode()
    }

}
