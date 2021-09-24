@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_BaseTests: XCTestCase {

    let ksNormalModeMock = KeyboardStrategyNormalModeMock()
    let ksVisualModeMock = KeyboardStrategyVisualModeMock()

    override func setUp() {
        KindaVimEngine.shared.ksNormalMode = ksNormalModeMock
        KindaVimEngine.shared.ksVisualMode = ksVisualModeMock
        KindaVimEngine.shared.accessibilityStrategy = AccessibilityStrategyMock()
        KindaVimEngine.shared.asNormalMode = AccessibilityStrategyNormalModeMock()
        KindaVimEngine.shared.asVisualMode = AccessibilityStrategyVisualModeMock()
        KindaVimEngine.shared.enterNormalMode()
    }

}
