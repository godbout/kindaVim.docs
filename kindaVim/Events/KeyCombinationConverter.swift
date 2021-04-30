//
//  KeyCombinationConverter.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 26/04/2021.
//

import Foundation

struct KeyCombinationConverter {
    
    static func toCGEvent(from keyCombination: KeyCombination) -> CGEvent? {
        guard let cgEvent =  CGEvent(
                keyboardEventSource: nil,
                virtualKey: CGKeyCode(keyCombination.key.rawValue),
                keyDown: keyCombination.action == .press
        ) else { return nil }
        
        cgEvent.flags = []

        if keyCombination.command == true {
            cgEvent.flags.insert(.maskCommand)
        }
        
        if keyCombination.option == true {
            cgEvent.flags.insert(.maskAlternate)
        }
        
        if keyCombination.control == true {
            cgEvent.flags.insert(.maskControl)
        }
        
        if keyCombination.fn == true {
            cgEvent.flags.insert(.maskSecondaryFn)
        }
        
        if keyCombination.shift == true {
            cgEvent.flags.insert(.maskShift)
        }

        return cgEvent
    }
    
    static func toKeyCombination(from cgEvent: CGEvent) -> KeyCombination? {
        guard let keyCode = KeyCode(rawValue: cgEvent.getIntegerValueField(.keyboardEventKeycode)) else { return nil }
        
        let keyCombination = KeyCombination(
            key: keyCode,
            command: cgEvent.flags.contains(.maskCommand),
            option: cgEvent.flags.contains(.maskAlternate),
            control: cgEvent.flags.contains(.maskControl),
            fn: cgEvent.flags.contains(.maskSecondaryFn),
            shift: cgEvent.flags.contains(.maskShift),
            action: cgEvent.type == CGEventType.keyDown ? .press : .release
        )
        
        return keyCombination
    }

}
