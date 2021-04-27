//
//  GlobalEventsController.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 25/04/2021.
//

import Foundation

struct GlobalEventsController {
    
    static func handle(proxy: CGEventTapProxy, event: CGEvent) -> Unmanaged<CGEvent>? {
        if let originalKeyCombination = KeyCombinationConverter.toKeyCombination(from: event) {
            let transformedKeyCombination = VimEngineController.shared.transform(from: originalKeyCombination)
            
            if let transformedCGEvent = KeyCombinationConverter.toCGEvent(from: transformedKeyCombination) {
                transformedCGEvent.tapPostEvent(proxy)
                
                print("'\(originalKeyCombination.key)' transformed to '\(transformedKeyCombination.key)'")
                
                return nil
            }
        }
        
        return Unmanaged.passUnretained(event)
    }
    
}
