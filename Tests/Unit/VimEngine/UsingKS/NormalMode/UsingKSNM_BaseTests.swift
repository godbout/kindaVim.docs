@testable import kindaVim
import XCTest


class UsingKSNM_BaseTests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.enterNormalMode()
    }

}
