@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_BaseTests: FailingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.enterVisualMode()
    }
    
}
