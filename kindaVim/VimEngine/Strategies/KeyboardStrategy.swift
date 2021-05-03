//
//  KeyboardStrategy.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

import Foundation

struct KeyboardStrategy {
    
    static var proxy: CGEventTapProxy!
    
    static func h() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, action: .both)
        ]
    }
    
    static func j() -> [KeyCombination] {
        return [
            KeyCombination(key: .down, action: .both)
        ]
    }
    
    static func k() -> [KeyCombination] {
        return [
            KeyCombination(key: .up, action: .both)
        ]
    }
    
    static func l() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, action: .both)
        ]
    }
    
    static func I() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, command: true, action: .both)
        ]
    }
    
    static func a() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, action: .both)
        ]
    }
    
    static func A() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .both)
        ]
    }
    
    static func o() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .both),
            KeyCombination(key: .enter, action: .both)
        ]
    }
    
    static func O() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, command: true, action: .both),
            KeyCombination(key: .enter, action: .both),
            KeyCombination(key: .up, action: .both)
        ]
    }
    
    static func u() -> [KeyCombination] {
        return [
            KeyCombination(key: .z, command: true, action: .both)
        ]
    }
    
    static func controlR() -> [KeyCombination] {
        return [
            KeyCombination(key: .z, command: true, shift: true, action: .both)
        ]
    }
    
    static func x() -> [KeyCombination] {
        // using right and delete because maskSecondaryFn does not seem
        // to work when posting CGEvents. will fill a Radar bug with Apple
        return [
            KeyCombination(key: .right, action: .both),
            KeyCombination(key: .delete, action: .both)
        ]
    }
    
    static func X() -> [KeyCombination] {
        return [
            KeyCombination(key: .delete, action: .both)
        ]
    }
    
    static func b() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, option: true, action: .both)
        ]
    }
    
    static func gg() -> [KeyCombination] {
        return [
            KeyCombination(key: .up, command: true, action: .both)
        ]
    }
    
    static func G() -> [KeyCombination] {
        return [
            KeyCombination(key: .down, command: true, action: .both)
        ]
    }
    
    static func cc() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .both),
            KeyCombination(key: .left, command: true, shift: true, action: .both),
            KeyCombination(key: .delete, action: .both)
        ]
    }

    static func C() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, shift: true, action: .both),
            KeyCombination(key: .delete, action: .both)
        ]
    }
    
    static func n0() -> [KeyCombination] {
        return [
            KeyCombination(key: .a, control: true, action: .both)
        ]
    }
    
    static func n4() -> [KeyCombination] {
        return [
            KeyCombination(key: .e, control: true, action: .both)
        ]
    }
    
    static func k_() -> [KeyCombination] {
        return [
            KeyCombination(key: .a, control: true, action: .both),
            KeyCombination(key: .right, option: true, action: .both),
            KeyCombination(key: .left, option: true, action: .both)
        ]
    }
    
    static func dd() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .both),
            KeyCombination(key: .a, control: true, shift: true, action: .both),
            KeyCombination(key: .delete, action: .both),
            KeyCombination(key: .down, action: .both),
            KeyCombination(key: .a, control: true, action: .both),
            KeyCombination(key: .delete, action: .both),
            KeyCombination(key: .a, control: true, action: .both),
            KeyCombination(key: .right, option: true, action: .both),
            KeyCombination(key: .left, option: true, action: .both)
        ]
    }
    
    static func ciw() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, option: true, action: .both),
            KeyCombination(key: .left, option: true, shift: true, action: .both),
            KeyCombination(key: .delete, action: .both)
        ]
    }
    
    static func w() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, option: true, action: .both),
            KeyCombination(key: .right, option: true, action: .both),
            KeyCombination(key: .left, option: true, action: .both)
        ]
    }
    
    static func post(_ keyCombinations: [KeyCombination]) -> Bool {
        print("move using Keyboard Strategy")
        
        for keyCombination in keyCombinations {
            let cgEvents = KeyCombinationConverter.toCGEvents(from: keyCombination)
            
            for cgEvent in cgEvents {
                cgEvent.tapPostEvent(proxy)
            }
        }
        
        return true
    }
    
}
