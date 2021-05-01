//
//  GlobalEventsController.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 25/04/2021.
//

import Foundation

struct GlobalEventsController {
    
    static func handle(_ originalKeyCombination: KeyCombination) -> [KeyCombination]? {
        if globalVimEngineHotkeyIsPressed(originalKeyCombination) {
            VimEngineController.shared.enterCommandMode()
            
            print("enter command mode")
            
            return []
        }
        
        if VimEngineController.shared.currentMode != .insert {
            return VimEngineController.shared.transform(from: originalKeyCombination)
        }
        
        return [originalKeyCombination]
    }
    
    static func globalVimEngineHotkeyIsPressed(_ keyCombination: KeyCombination) -> Bool {
        return keyCombination.key == .escape && keyCombination.command == true
    }
    
}
