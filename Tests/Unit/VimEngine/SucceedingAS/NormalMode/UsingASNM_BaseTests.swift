@testable import kindaVim
import XCTest

class UsingASNM_BaseTests: UsingAS_BaseTests {

    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.enterNormalMode()
    }

}
