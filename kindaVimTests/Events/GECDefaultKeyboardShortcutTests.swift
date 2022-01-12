@testable import kindaVim
import KeyCombination
import XCTest
import KeyboardShortcuts


class GCEDefaultKeyboardShortcutTests: XCTestCase {

    let globalHotkeyCombination = KeyCombination(key: .escape)

}


// insert mode
extension GCEDefaultKeyboardShortcutTests {
    
    func test_that_when_in_insert_mode_the_global_hotkey_press_sets_Vim_in_normal_mode() {
        AppCore.shared.vimEngine.enterInsertMode()

        _ = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)        

        XCTAssertEqual(AppCore.shared.vimEngine.currentMode, .normal)
    }

    func test_that_when_in_insert_mode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterInsertMode()

        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)

        XCTAssertTrue(captured)
    }
    
}


// normal mode
extension GCEDefaultKeyboardShortcutTests {
    
    func test_that_when_in_Normal_Mode_the_global_hotkey_press_switches_Vim_to_Insert_Mode() {
        AppCore.shared.vimEngine.enterNormalMode()

        _ = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)        

        XCTAssertEqual(AppCore.shared.vimEngine.currentMode, .insert)
    }

    func test_that_when_in_normal_mode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterNormalMode()

        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)

        XCTAssertTrue(captured)
    }
    
}


// visual mode
extension GCEDefaultKeyboardShortcutTests {
    
    func test_that_when_in_Visual_Mode_the_global_hotkey_press_switches_Vim_to_NormalMode() {
        AppCore.shared.vimEngine.enterVisualMode()

        _ = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)        

        XCTAssertEqual(AppCore.shared.vimEngine.currentMode, .normal)
    }
    
    func test_that_when_in_visual_mode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterVisualMode()
        
        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)
        
        XCTAssertTrue(captured)
    }

}
