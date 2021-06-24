@testable import kindaVim
import XCTest


class UsingAS_v_Tests: UsingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
    }
    
}


extension UsingAS_v_Tests {
        
    func test_that_it_switches_Vim_to_visual_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .visual)
    }
    
    func test_that_it_sets_the_visual_style_to_characterwise() {
        XCTAssertEqual(VimEngine.shared.visualStyle, .characterwise)
    }
    
    func test_that_a_second_call_to_v_switches_back_to_normal_mode() {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}
