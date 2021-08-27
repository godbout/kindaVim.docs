@testable import kindaVim
import XCTest


class SucceedingASVM_BaseTests: SucceedingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.enterVisualMode()
    }
    
}
