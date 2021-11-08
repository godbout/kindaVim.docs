@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_BaseTests: SucceedingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.enterVisualMode()
    }
    
}
