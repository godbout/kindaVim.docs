//
//  EventsController.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 23/04/2021.
//

import Foundation

struct EventTapController {
    
    var eventTapCallback: CGEventTapCallBack = { proxy, _, event, _ in
        print(event.getIntegerValueField(.keyboardEventKeycode))
        
        KeyboardStrategy.proxy = proxy
        
        guard let originalKeyCombination = KeyCombinationConverter.toKeyCombination(from: event) else { return Unmanaged.passUnretained(event) }
        
        if GlobalEventsController.handle(originalKeyCombination) {
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

