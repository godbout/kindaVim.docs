extension AccessibilityStrategyVisualMode {
    
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        if KindaVimEngine.shared.visualStyle == .characterwise {
            if Self.head >= Self.anchor {
                let beginningOfWordLocation = textEngine.beginningOfWordBackward(startingAt: (element.caretLocation + element.selectedLength) - element.characterLengthForCharacter(before: element.caretLocation + element.selectedLength), in: TextEngineText(from: element.value))
                
                if beginningOfWordLocation <= Self.anchor {
                    newElement.caretLocation = beginningOfWordLocation         
                    newElement.selectedLength = (Self.anchor + element.characterLengthForCharacter(at: Self.anchor)) - newElement.caretLocation
                } else {
                    newElement.selectedLength -= Self.head - beginningOfWordLocation
                }
            } else if Self.head < Self.anchor {
                let beginningOfWordLocation = textEngine.beginningOfWordBackward(startingAt: element.caretLocation, in: TextEngineText(from: element.value))
                
                newElement.caretLocation = beginningOfWordLocation 
                newElement.selectedLength = (Self.anchor + element.characterLengthForCharacter(at: Self.anchor)) - newElement.caretLocation
            }
        }
        
        newElement.selectedText = nil
        
        return newElement
    }
        
}
