@testable import kindaVim
import KeyCombination


class KSCL_BaseTests: Commands_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategyFailingMock()
        kindaVimEngine.enterNormalMode()
    }

}
