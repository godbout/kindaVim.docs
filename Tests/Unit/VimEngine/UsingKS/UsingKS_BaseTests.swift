@testable import kindaVim
import XCTest

class UsingKS_BaseTests: XCTestCase {

    let ksNormalModeMock = KeyboardStrategyNormalModeMock()
    let ksVisualModeMock = KeyboardStrategyVisualModeMock()

    override func setUp() {
        KindaVimEngine.shared.ksNormalMode = ksNormalModeMock
        KindaVimEngine.shared.ksVisualMode = ksVisualModeMock
        KindaVimEngine.shared.asNormalMode = FailingAccessibilityStrategyNormalModeStub()
        KindaVimEngine.shared.asVisualMode = FailingAccessibilityStrategyVisualModeStub()
        KindaVimEngine.shared.enterNormalMode()
    }

}
