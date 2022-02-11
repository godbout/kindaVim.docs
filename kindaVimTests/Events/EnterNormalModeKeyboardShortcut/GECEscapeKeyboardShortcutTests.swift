@testable import kindaVim
import KeyCombination
import XCTest
import KeyboardShortcuts
import Sauce


class GCEEscapeKeyboardShortcutTests: XCTestCase {
    
    var useCustomShortcutToEnterNormalModeProductionValue: Bool!
    var globalHotkeyCombination: KeyCombination!
    
    override func setUp() {
        useCustomShortcutToEnterNormalModeProductionValue = GlobalEventsController.useCustomShortcutToEnterNormalMode
        GlobalEventsController.useCustomShortcutToEnterNormalMode = false
        
        globalHotkeyCombination = KeyCombination(key: .escape)
    }
    
    override func tearDown() {
        GlobalEventsController.useCustomShortcutToEnterNormalMode = useCustomShortcutToEnterNormalModeProductionValue
    }
    
}


// insert mode
extension GCEEscapeKeyboardShortcutTests {
    
    func test_that_when_in_InsertMode_the_global_hotkey_press_sets_Vim_in_normal_mode() {
        AppCore.shared.vimEngine.enterInsertMode()

        _ = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)        

        XCTAssertEqual(AppCore.shared.vimEngine.currentMode, .normal)
    }

    func test_that_when_in_InsertMode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterInsertMode()

        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)

        XCTAssertTrue(captured)
    }
    
}


// Normal Mode
extension GCEEscapeKeyboardShortcutTests {
    
    func test_that_when_in_NormalMode_the_global_hotkey_press_switches_Vim_to_InsertMode() {
        AppCore.shared.vimEngine.enterNormalMode()

        _ = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)        

        XCTAssertEqual(AppCore.shared.vimEngine.currentMode, .insert)
    }

    func test_that_when_in_NormalMode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterNormalMode()

        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)

        XCTAssertTrue(captured)
    }
    
}


// visual mode
extension GCEEscapeKeyboardShortcutTests {
    
    // this is normal `esc` behavior in Visual Mode. not the same as Custom Keyboard Shortcut
    func test_that_when_in_VisualMode_the_global_hotkey_press_switches_Vim_to_NormalMode() {
        AppCore.shared.vimEngine.enterVisualMode()

        _ = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)        

        XCTAssertEqual(AppCore.shared.vimEngine.currentMode, .normal)
    }
    
    func test_that_when_in_VisualMode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterVisualMode()
        
        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)
        
        XCTAssertTrue(captured)
    }

}
