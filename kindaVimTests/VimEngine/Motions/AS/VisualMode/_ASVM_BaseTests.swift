@testable import kindaVim
import KeyCombination
import XCTest


class ASVM_BaseTests: AS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.enterVisualMode()
    }
    
}
