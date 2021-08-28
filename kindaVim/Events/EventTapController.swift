import AppKit
import Foundation
import Defaults
import KeyboardStrategy
import KeyCombination


struct EventTapController {
    
    var eventTapCallback: CGEventTapCallBack = { proxy, _, event, _ in
        KeyboardStrategy.proxy = proxy
        
        guard event.type == .keyDown else {
            if KindaVimEngine.shared.currentMode != .insert {
                KindaVimEngine.shared.enterInsertMode()
                
                if Defaults[.showCharactersTyped] == true {
                    KindaVimEngine.shared.display.fadeOutCharactersWindow()
                }
            }
            
            return Unmanaged.passUnretained(event)
        }        
                
        let keyCombinationPressed = KeyCombinationAdaptor.fromCGEvent(from: event)
        guard GlobalEventsController.handle(keyCombination: keyCombinationPressed) == true else {
            return Unmanaged.passUnretained(event)
        }
        
        if Defaults[.showCharactersTyped] == true {
            KindaVimEngine.shared.display.showKeysTyped(lastBeing: keyCombinationPressed)

            if KindaVimEngine.shared.currentMode == .insert {
                KindaVimEngine.shared.display.fadeOutCharactersWindow()
            }
        }

        return nil
    }
    
    init() {
        setUpEventTap()
    }
    
    private func setUpEventTap() {
        let eventMask = (1 << CGEventType.keyDown.rawValue) | (1 << CGEventType.leftMouseDown.rawValue) | (1 << CGEventType.rightMouseDown.rawValue)
        
        guard let eventTap = CGEvent.tapCreate(
            tap: .cghidEventTap,
            place: .headInsertEventTap,
            options: .defaultTap,
            eventsOfInterest: CGEventMask(eventMask),
            callback: eventTapCallback,
            userInfo: nil
        ) else {
            fatalError("can't create tap")
        }

        let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
        CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
    }

}

