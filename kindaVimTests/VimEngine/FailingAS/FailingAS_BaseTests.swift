@testable import kindaVim
import KeyCombination
import XCTest


class FailingAS_BaseTests: XCTestCase {
    
    let ksNormalModeMock = KeyboardStrategyNormalModeMock()
    let ksVisualModeMock = KeyboardStrategyVisualModeMock()
    
    override func setUp() {
        KindaVimEngine.shared.ksNormalMode = ksNormalModeMock
        KindaVimEngine.shared.ksVisualMode = ksVisualModeMock
        KindaVimEngine.shared.accessibilityStrategy = AccessibilityStrategyMock()
        KindaVimEngine.shared.asNormalMode = FailingAccessibilityStrategyNormalModeStub()
        KindaVimEngine.shared.asVisualMode = FailingAccessibilityStrategyVisualModeStub()
        KindaVimEngine.shared.enterNormalMode()        
    }
    
}
