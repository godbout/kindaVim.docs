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
    
    static func O() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, command: true, action: .press),
            KeyCombination(key: .left, command: true, action: .release),
            KeyCombination(key: .enter, action: .press),
            KeyCombination(key: .enter, action: .release),
            KeyCombination(key: .up, action: .press),
            KeyCombination(key: .up, action: .release)
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
    
    static func n0() -> [KeyCombination] {
        return [
            KeyCombination(key: .a, control: true, action: .press),
            KeyCombination(key: .a, control: true, action: .release)
        ]
    }
    
    static func n4() -> [KeyCombination] {
        return [
            KeyCombination(key: .e, control: true, action: .press),
            KeyCombination(key: .e, control: true, action: .release)
        ]
    }
    
    static func k_() -> [KeyCombination] {
        return [
            KeyCombination(key: .a, control: true, action: .press),
            KeyCombination(key: .a, control: true, action: .release),
            KeyCombination(key: .right, option: true, action: .press),
            KeyCombination(key: .right, option: true, action: .release),
            KeyCombination(key: .left, option: true, action: .press),
            KeyCombination(key: .left, option: true, action: .release)
        ]
    }
    
    static func dd() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .press),
            KeyCombination(key: .right, command: true, action: .release),
            KeyCombination(key: .a, control: true, shift: true, action: .press),
            KeyCombination(key: .a, control: true, shift: true, action: .release),
            KeyCombination(key: .delete, action: .press),
            KeyCombination(key: .delete, action: .release),
            KeyCombination(key: .down, action: .press),
            KeyCombination(key: .down, action: .release),
            KeyCombination(key: .a, control: true, action: .press),
            KeyCombination(key: .a, control: true, action: .release),
            KeyCombination(key: .delete, action: .press),
            KeyCombination(key: .delete, action: .release),
            KeyCombination(key: .a, control: true, action: .press),
            KeyCombination(key: .a, control: true, action: .release),
            KeyCombination(key: .right, option: true, action: .press),
            KeyCombination(key: .right, option: true, action: .release),
            KeyCombination(key: .left, option: true, action: .press),
            KeyCombination(key: .left, option: true, action: .release)
        ]
    }
    
    static func ciw() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, option: true, action: .press),
            KeyCombination(key: .right, option: true, action: .release),
            KeyCombination(key: .left, option: true, shift: true, action: .press),
            KeyCombination(key: .left, option: true, shift: true, action: .release),
            KeyCombination(key: .delete, action: .press),
            KeyCombination(key: .delete, action: .release),            
        ]
    }
    
    static func w() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, option: true, action: .press),
            KeyCombination(key: .right, option: true, action: .release),
            KeyCombination(key: .right, option: true, action: .press),
            KeyCombination(key: .right, option: true, action: .release),
            KeyCombination(key: .left, option: true, action: .press),
            KeyCombination(key: .left, option: true, action: .release)
        ]
    }
    
}
