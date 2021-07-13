extension AccessibilityStrategyVisualMode {
    
    func e(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if KindaVimEngine.shared.visualStyle == .characterwise {
            if Self.head >= Self.anchor {
                let endOfWordForwardLocation = textEngine.endOfWordForward(startingAt: element.caretLocation + element.selectedLength - 1, in: TextEngineText(from: element.value))
                
                element.selectedLength += endOfWordForwardLocation - Self.head
            } else if Self.head < Self.anchor {
                let endOfWordForwardLocation = textEngine.endOfWordForward(startingAt: element.caretLocation, in: TextEngineText(from: element.value))
                
                if endOfWordForwardLocation > Self.anchor {
                    element.caretLocation = Self.anchor
                    element.selectedLength = endOfWordForwardLocation - Self.anchor + 1                    
                } else {
                    element.caretLocation = endOfWordForwardLocation
                    element.selectedLength = Self.anchor - endOfWordForwardLocation + 1
                }
            }
        }
        
        element.selectedText = nil
        
        return element
    }
    
}
