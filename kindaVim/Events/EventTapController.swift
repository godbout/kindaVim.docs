//
//  EventsController.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 23/04/2021.
//

import Foundation

struct EventTapController {
    
    var eventTapCallback: CGEventTapCallBack = { proxy, _, event, _ in
        KeyboardStrategy.proxy = proxy

        print(
            """
            ***
            KEY PRESSED IS:
            \(event.getIntegerValueField(.keyboardEventKeycode))
            \(String(describing: KeyCode(rawValue: event.getIntegerValueField(.keyboardEventKeycode))))
            ***
            """
        )

        let keyCombinationPressed = KeyCombinationAdaptor.toKeyCombination(from: event)

        if GlobalEventsController.stole(keyCombination: keyCombinationPressed) == true {
            return nil
        }
        
        return Unmanaged.passUnretained(event)
    }
    
    init() {
        setUpEventTap()
    }
    
    private func setUpEventTap() {
        guard let eventTap = CGEvent.tapCreate(
            tap: .cghidEventTap,
            place: .headInsertEventTap,
            options: .defaultTap,
            eventsOfInterest: CGEventMask(1 << CGEventType.keyDown.rawValue),
            callback: eventTapCallback,
            userInfo: nil
        ) else {
            fatalError("can't create tap")
        }

        let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
        CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
    }

}

