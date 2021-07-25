extension AccessibilityStrategyVisualMode {
    
    func e(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if KindaVimEngine.shared.visualStyle == .characterwise {
            if Self.head >= Self.anchor {
                let endOfWordForwardLocation = textEngine.endOfWordForward(startingAt: (element.caretLocation + element.selectedLength) - element.characterLengthForCharacter(at: element.caretLocation + element.selectedLength), in: TextEngineText(from: element.value))                
                element.selectedLength += (endOfWordForwardLocation + element.characterLengthForCharacter(at: endOfWordForwardLocation)) - (Self.head + element.characterLengthForCharacter(at: Self.head))
            } else if Self.head < Self.anchor {
                let endOfWordForwardLocation = textEngine.endOfWordForward(startingAt: element.caretLocation, in: TextEngineText(from: element.value))
                
                if endOfWordForwardLocation > Self.anchor {
                    element.caretLocation = Self.anchor
                    element.selectedLength = (endOfWordForwardLocation + element.characterLengthForCharacter(at: endOfWordForwardLocation)) - Self.anchor              
                } else {
                    element.caretLocation = endOfWordForwardLocation
                    element.selectedLength = (Self.anchor + element.characterLengthForCharacter(at: Self.anchor)) - endOfWordForwardLocation
                }
            }
        }
        
        element.selectedText = nil
        
        return element
    }
     
}
