//
//  KeyboardStrategy.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

import Foundation

struct KeyboardStrategy {
    
    static func h() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, action: .press),
            KeyCombination(key: .left, action: .release)
        ]
    }
    
    static func j() -> [KeyCombination] {
        return [
            KeyCombination(key: .down, action: .press),
            KeyCombination(key: .down, action: .release)
        ]
    }
    
    static func k() -> [KeyCombination] {
        return [
            KeyCombination(key: .up, action: .press),
            KeyCombination(key: .up, action: .release)
        ]
    }
    
    static func l() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, action: .press),
            KeyCombination(key: .right, action: .release)
        ]
    }
    
    static func I() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, command: true, action: .press),
            KeyCombination(key: .left, command: true, action: .release)
        ]
    }
    
    static func a() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, action: .press),
            KeyCombination(key: .right, action: .release)
        ]
    }
    
    static func A() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .press),
            KeyCombination(key: .right, command: true, action: .release)
        ]
    }
    
    static func o() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .press),
            KeyCombination(key: .right, command: true, action: .release),
            KeyCombination(key: .enter, action: .press),
            KeyCombination(key: .enter, action: .release)
        ]
    }
    
    // TODO: combination might be wrong. doesn't work well
    // if caret is on top of buffer
    static func O() -> [KeyCombination] {
        return [
            KeyCombination(key: .up, action: .press),
            KeyCombination(key: .up, action: .release),
            KeyCombination(key: .right, command: true, action: .press),
            KeyCombination(key: .right, command: true, action: .release),
            KeyCombination(key: .enter, action: .press),
            KeyCombination(key: .enter, action: .release)
        ]
    }
    
    static func u() -> [KeyCombination] {
        return [
            KeyCombination(key: .z, command: true, action: .press),
            KeyCombination(key: .z, command: true, action: .release),
        ]
    }
    
    static func controlR() -> [KeyCombination] {
        return [
            KeyCombination(key: .z, command: true, shift: true, action: .press),
            KeyCombination(key: .z, command: true, shift: true, action: .release),
        ]
    }
    
    static func x() -> [KeyCombination] {
        // using right and delete because maskSecondaryFn does not seem
        // to work when posting CGEvents. will fill a Radar bug with Apple
        return [
            KeyCombination(key: .right, action: .press),
            KeyCombination(key: .right, action: .release),
            KeyCombination(key: .delete, action: .press),
            KeyCombination(key: .delete, action: .release)
        ]
    }
    
    static func X() -> [KeyCombination] {
        return [
            KeyCombination(key: .delete, action: .press),
            KeyCombination(key: .delete, action: .release)
        ]
    }
    
    static func b() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, option: true, action: .press),
            KeyCombination(key: .left, option: true, action: .release)
        ]
    }
    
    static func gg() -> [KeyCombination] {
        return [
            KeyCombination(key: .up, command: true, action: .press),
            KeyCombination(key: .up, command: true, action: .release)
        ]
    }
    
    static func G() -> [KeyCombination] {
        return [
            KeyCombination(key: .down, command: true, action: .press),
            KeyCombination(key: .down, command: true, action: .release)
        ]
    }
    
    static func cc() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .press),
            KeyCombination(key: .right, command: true, action: .release),
            KeyCombination(key: .left, command: true, shift: true, action: .press),
            KeyCombination(key: .left, command: true, shift: true, action: .release),
            KeyCombination(key: .delete, action: .press),
            KeyCombination(key: .delete, action: .release)
        ]
    }
    
    static func C() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, shift: true, action: .press),
            KeyCombination(key: .right, command: true, shift: true, action: .release),
            KeyCombination(key: .delete, action: .press),
            KeyCombination(key: .delete, action: .release)
        ]
    }
    
}
