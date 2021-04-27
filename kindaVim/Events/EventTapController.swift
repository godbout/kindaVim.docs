//
//  EventsController.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 23/04/2021.
//

import Foundation

struct EventTapController {
    
    var eventTapCallback: CGEventTapCallBack = { proxy, _, event, _ in
        guard let originalKeyCombination = KeyCombinationConverter.toKeyCombination(from: event) else { return Unmanaged.passUnretained(event) }
        
        guard let handledKeyCombinations = GlobalEventsController.handle(originalKeyCombination) else { return Unmanaged.passUnretained(event) }
        
        for handledKeyCombination in handledKeyCombinations {
            let handledCGEvent = KeyCombinationConverter.toCGEvent(from: handledKeyCombination)
            
            handledCGEvent?.tapPostEvent(proxy)
            
            print("'\(originalKeyCombination.key)' handled to '\(handledKeyCombination.key)'")
        }

        return nil
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

