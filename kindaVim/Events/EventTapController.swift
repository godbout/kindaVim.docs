import AppKit
import Foundation

struct EventTapController {
    
    var eventTapCallback: CGEventTapCallBack = { proxy, _, event, _ in
        KeyboardStrategy.proxy = proxy

//        print(
//            """
//            ***
//            KEY PRESSED IS:
//            key code: \(event.getIntegerValueField(.keyboardEventKeycode))
//            KeyCode: \(String(describing: KeyCode(rawValue: event.getIntegerValueField(.keyboardEventKeycode))))
//            control: \(event.flags.contains(.maskControl))
//            option: \(event.flags.contains(.maskAlternate))
//            shift: \(event.flags.contains(.maskShift))
//            command: \(event.flags.contains(.maskCommand))
//            fn: \(event.flags.contains(.maskSecondaryFn))
//            ***
//            """
//        )
        
//        print(
//            """
//            on application: \(String(describing: NSWorkspace.shared.frontmostApplication?.bundleIdentifier))
//            """
//        )

        let keyCombinationPressed = KeyCombinationAdaptor.fromCGEvent(from: event)

        if GlobalEventsController.handle(keyCombination: keyCombinationPressed) == true {
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

