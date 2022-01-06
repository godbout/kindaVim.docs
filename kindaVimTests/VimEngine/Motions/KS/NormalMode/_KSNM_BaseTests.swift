@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_BaseTests: KS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.enterNormalMode()
        
        ksNormalModeMock.functionCalled = ""
        ksVisualModeMock.functionCalled = ""
    }

}
