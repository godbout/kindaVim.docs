extension AccessibilityStrategyVisualMode {
    
    func e(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 1
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        if VimEngine.shared.visualStyle == .characterwise {
            if Self.head >= Self.anchor {
                let endOfWordForwardLocation = textEngine.endOfWordForward(startingAt: element.caretLocation + element.selectedLength - 1, in: TextEngineText(from: element.value))
                
                element.selectedLength += endOfWordForwardLocation - Self.head
            } else if Self.head < Self.anchor {
                let endOfWordForwardLocation = textEngine.endOfWordForward(startingAt: element.caretLocation, in: TextEngineText(from: element.value))
                
                if endOfWordForwardLocation > Self.anchor {
                    element.selectedLength = endOfWordForwardLocation - Self.anchor + 1
                    element.caretLocation = Self.anchor
                    
                    Self.head = endOfWordForwardLocation
                } else {
                    element.selectedLength -= endOfWordForwardLocation - element.caretLocation
                    element.caretLocation = endOfWordForwardLocation
                }
            }
        }
        
        return element
    }
    
}
