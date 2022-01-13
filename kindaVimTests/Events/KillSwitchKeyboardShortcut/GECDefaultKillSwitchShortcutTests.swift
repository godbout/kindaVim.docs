@testable import kindaVim
import KeyCombination
import XCTest
import KeyboardShortcuts


class GCEDefaultKillSwitchShortcutTests: XCTestCase {

    let defaultKillSwitchShortcut = KeyCombination(key: .j, control: true, option: true, command: true)

}


// Insert Mode
extension GCEDefaultKillSwitchShortcutTests {
    
    func test_that_in_InsertMode_the_Default_KillSwitch_Shortcut_is_just_passed_back_to_macOS() {
        AppCore.shared.vimEngine.enterInsertMode()
                
        let handled = GlobalEventsController.handle(keyCombination: defaultKillSwitchShortcut)
        
        XCTAssertFalse(handled)
    }
        
}


// Normal Mode
extension GCEDefaultKillSwitchShortcutTests {
    
    func test_that_when_in_NormalMode_the_Default_KillSwitch_Shortcut_press_switches_Vim_to_InsertMode() {
        AppCore.shared.vimEngine.enterNormalMode()

        _ = GlobalEventsController.handle(keyCombination: defaultKillSwitchShortcut)        

        XCTAssertEqual(AppCore.shared.vimEngine.currentMode, .insert)
    }

    func test_that_when_in_NormalMode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterNormalMode()

        let captured = GlobalEventsController.handle(keyCombination: defaultKillSwitchShortcut)

        XCTAssertTrue(captured)
    }
    
}


// Visual Mode
extension GCEDefaultKillSwitchShortcutTests {
    
    func test_that_when_in_VisualMode_the_Default_KillSwitch_Shortcut_press_switches_Vim_to_InsertMode() {
        AppCore.shared.vimEngine.enterVisualMode()

        _ = GlobalEventsController.handle(keyCombination: defaultKillSwitchShortcut)        

        XCTAssertEqual(AppCore.shared.vimEngine.currentMode, .insert)
    }

    func test_that_when_in_VisualMode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterVisualMode()

        let captured = GlobalEventsController.handle(keyCombination: defaultKillSwitchShortcut)

        XCTAssertTrue(captured)
    }

}
