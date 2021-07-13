@testable import kindaVim
import XCTest

class UsingASVM_BaseTests: UsingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.enterVisualMode()
    }
    
}
