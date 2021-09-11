import AppKit
import Foundation
import Defaults
import KeyboardStrategy
import KeyCombination


struct EventTapController {
    
    private static var eventTap: CFMachPort!
    private var eventTapCallback: CGEventTapCallBack = { proxy, type, event, _ in
        KeyboardStrategy.proxy = proxy
        
        if type == .tapDisabledByTimeout {
            CGEvent.tapEnable(tap: eventTap, enable: true)
        }
        
        guard type == .keyDown else {
            if KindaVimEngine.shared.currentMode != .insert {
                KindaVimEngine.shared.enterInsertMode()
            }
            
            return Unmanaged.passUnretained(event)
        }        
                
        let keyCombinationPressed = KeyCombinationAdaptor.fromCGEvent(from: event)
        guard GlobalEventsController.handle(keyCombination: keyCombinationPressed) == true else {
            return Unmanaged.passUnretained(event)
        }

        return nil
    }
    
    init() {
        Self.eventTap = setUpEventTap()
    }
    
    private func setUpEventTap() -> CFMachPort {
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
        
        return eventTap
    }

}

