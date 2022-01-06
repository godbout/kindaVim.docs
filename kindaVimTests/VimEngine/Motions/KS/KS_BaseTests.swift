@testable import kindaVim
import KeyCombination
import XCTest


class KS_BaseTests: XCTestCase {
    
    let kindaVimEngine = KindaVimEngine()

    let ksNormalModeMock = KeyboardStrategyNormalModeMock()
    let ksVisualModeMock = KeyboardStrategyVisualModeMock()

    override func setUp() {
        kindaVimEngine.ksNormalMode = ksNormalModeMock
        kindaVimEngine.ksVisualMode = ksVisualModeMock
        // TODO: failing? keymapping?
        // answer: failing. KeyMapping will ALWAYS reach. but failing may not, if we forgot to add
        // it in AS. but we will have to add tests for the Modes. planned.
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategyFailingMock()
        kindaVimEngine.asNormalMode = AccessibilityStrategyNormalModeMock()
        kindaVimEngine.asVisualMode = AccessibilityStrategyVisualModeMock()
    }

}
