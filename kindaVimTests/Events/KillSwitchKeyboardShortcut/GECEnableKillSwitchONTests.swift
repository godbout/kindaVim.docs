@testable import kindaVim
import KeyCombination
import XCTest
import KeyboardShortcuts


class GCEEnableKillSwitchONKeyboardShortcutTests: XCTestCase {
    
    var enableKillSwitchProductionValue: Bool!
    var killSwitchKeyboardShortcut: KeyCombination!
    
    override func setUp() {
        enableKillSwitchProductionValue = GlobalEventsController.enableKillSwitch
        GlobalEventsController.enableKillSwitch = true
        
        killSwitchKeyboardShortcut = KeyCombination(key: .j, control: true, option: true, command: true)
    }
    
    override func tearDown() {
        GlobalEventsController.enableKillSwitch = enableKillSwitchProductionValue
    }
    
}


// Insert Mode
extension GCEEnableKillSwitchONKeyboardShortcutTests {
    
    func test_that_when_ON_in_InsertMode_the_KillSwitch_Keyboard_Shortcut_stays_in_InsertMode() {
        AppCore.shared.vimEngine.enterInsertMode()
                
        _ = GlobalEventsController.handle(keyCombination: killSwitchKeyboardShortcut)
        
        XCTAssertEqual(AppCore.shared.vimEngine.currentMode, .insert)
    }
    
    func test_that_when_ON_in_InsertMode_the_KillSwitch_Keyboard_Shortcut_is_just_passed_back_to_macOS() {
        AppCore.shared.vimEngine.enterInsertMode()
                
        let handled = GlobalEventsController.handle(keyCombination: killSwitchKeyboardShortcut)
        
        XCTAssertFalse(handled)
    }
        
}


// Normal Mode
extension GCEEnableKillSwitchONKeyboardShortcutTests {
    
    func test_that_when_ON_in_NormalMode_the_KillSwitch_Keyboard_Shortcut_switches_kV_to_InsertMode() {
        AppCore.shared.vimEngine.enterNormalMode()
                
        _ = GlobalEventsController.handle(keyCombination: killSwitchKeyboardShortcut)
        
        XCTAssertEqual(AppCore.shared.vimEngine.currentMode, .insert)
    }
    
    func test_that_when_ON_in_NormalMode_the_KillSwitch_Keyboard_Shortcut_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterNormalMode()
                
        let captured = GlobalEventsController.handle(keyCombination: killSwitchKeyboardShortcut)
        
        XCTAssertTrue(captured)
    }
       
}


// Visual Mode
extension GCEEnableKillSwitchONKeyboardShortcutTests {
    
    func test_that_when_ON_in_VisualMode_the_KillSwitch_Keyboard_Shortcut_switches_kV_to_InsertMode() {
        AppCore.shared.vimEngine.enterVisualMode()
                
        _ = GlobalEventsController.handle(keyCombination: killSwitchKeyboardShortcut)
        
        XCTAssertEqual(AppCore.shared.vimEngine.currentMode, .insert)
    }
    
    func test_that_when_ON_in_VisualMode_the_KillSwitch_Keyboard_Shortcut_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterVisualMode()
                
        let captured = GlobalEventsController.handle(keyCombination: killSwitchKeyboardShortcut)
        
        XCTAssertTrue(captured)
    }
    
}
