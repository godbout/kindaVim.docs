@testable import kindaVim
import KeyCombination


class ASCL_BaseTests: Commands_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingMock()
        kindaVimEngine.enterNormalMode()
    }

}
