//
//  VimEngineController.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 23/04/2021.
//

import Foundation

class VimEngineController {
    
    static var shared = VimEngineController.init()
    
    private init() {
        _ = EventTapController.init()
        
        print("engine started")
    }
    
    func transform(from original: KeyCombination) -> KeyCombination {
        switch original.key {
        case .j:
            return KeyCombination(key: .down)
        case .k:
            return KeyCombination(key: .up)
        default:
            return original
        }
    }
    
}
