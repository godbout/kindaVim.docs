@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_BaseTests: XCTestCase {
    
    let kindaVimEngine = KindaVimEngine()

    let ksNormalModeMock = KeyboardStrategyNormalModeMock()
    let ksVisualModeMock = KeyboardStrategyVisualModeMock()

    override func setUp() {
        kindaVimEngine.ksNormalMode = ksNormalModeMock
        kindaVimEngine.ksVisualMode = ksVisualModeMock
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategyMock()
        kindaVimEngine.asNormalMode = AccessibilityStrategyNormalModeMock()
        kindaVimEngine.asVisualMode = AccessibilityStrategyVisualModeMock()
    }

}
