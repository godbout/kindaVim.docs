@testable import kindaVim
import XCTest


class EnforcingKSNM_BaseTests: EnforcingKS_BaseTests {

    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.enterNormalMode()
    }

}
