//
//  GlobalEventsController.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 25/04/2021.
//

import Foundation

struct GlobalEventsController {
    
    static func handle(_ implementedKeyCombination: KeyCombination?) -> Bool {
        if VimEngineController.shared.currentMode != .insert {
            guard implementedKeyCombination != nil else { return true }

            return VimEngineController.shared.transform(from: implementedKeyCombination!)
        }

        guard implementedKeyCombination != nil else { return false }

        if globalVimEngineHotkeyIsPressed(implementedKeyCombination!) {
            VimEngineController.shared.enterCommandMode()
            
            print("enter command mode")
            
            return true
        }

        return false
    }
    
    static func globalVimEngineHotkeyIsPressed(_ keyCombination: KeyCombination) -> Bool {
        return keyCombination.key == .escape && keyCombination.command == true
    }
    
}
