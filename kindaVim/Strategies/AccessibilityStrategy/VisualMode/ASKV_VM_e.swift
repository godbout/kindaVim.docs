extension AccessibilityStrategyVisualMode {
    
    func e(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        if KindaVimEngine.shared.visualStyle == .characterwise {
            if Self.head >= Self.anchor {
                let endOfWordForwardLocation = textEngine.endOfWordForward(startingAt: (element.caretLocation + element.selectedLength) - element.characterLengthForCharacter(before: element.caretLocation + element.selectedLength), in: TextEngineText(from: element.value))                
                newElement.selectedLength += (endOfWordForwardLocation + element.characterLengthForCharacter(at: endOfWordForwardLocation)) - (Self.head + element.characterLengthForCharacter(at: Self.head))
            } else if Self.head < Self.anchor {
                let endOfWordForwardLocation = textEngine.endOfWordForward(startingAt: element.caretLocation, in: TextEngineText(from: element.value))
                
                if endOfWordForwardLocation > Self.anchor {
                    newElement.caretLocation = Self.anchor
                    newElement.selectedLength = (endOfWordForwardLocation + element.characterLengthForCharacter(at: endOfWordForwardLocation)) - Self.anchor              
                } else {
                    newElement.caretLocation = endOfWordForwardLocation
                    newElement.selectedLength = (Self.anchor + element.characterLengthForCharacter(at: Self.anchor)) - endOfWordForwardLocation
                }
            }
        }
        
        newElement.selectedText = nil
        
        return newElement
    }
     
}
