@testable import kindaVim
import KeyCombination
import XCTest


class ASNM_BaseTests: AS_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.enterNormalMode()
        
        asNormalModeMock.functionCalled = ""
        ksNormalModeMock.functionCalled = ""
    }

}
