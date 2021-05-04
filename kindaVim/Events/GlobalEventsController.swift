//
//  GlobalEventsController.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 25/04/2021.
//

import Foundation

struct GlobalEventsController {
    
    static func stole(keyCombination: KeyCombination?) -> Bool {
        if VimEngineController.shared.currentMode != .insert {
            guard let implementedKeyCombination = keyCombination else { return true }

            VimEngineController.shared.handle(keyCombination: implementedKeyCombination)

            return true
        }

        guard let implementedKeyCombination = keyCombination else { return false }

        if globalVimEngineHotkeyIsPressed(implementedKeyCombination) {
            VimEngineController.shared.enterCommandMode()
            
            print("enter command mode")
            
            return true
        }

        return false
    }
    
    private static func globalVimEngineHotkeyIsPressed(_ keyCombination: KeyCombination) -> Bool {
        return keyCombination.key == .escape && keyCombination.command == true
    }
    
}
