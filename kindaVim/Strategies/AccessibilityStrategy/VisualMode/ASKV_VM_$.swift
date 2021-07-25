extension AccessibilityStrategyVisualMode {
    
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        if KindaVimEngine.shared.visualStyle == .characterwise, let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) {
            if Self.head >= Self.anchor || lineAtHead.end >= Self.anchor {
                newElement.caretLocation = Self.anchor
                newElement.selectedLength = lineAtHead.end - newElement.caretLocation
            } else {
                newElement.caretLocation = lineAtHead.end - AccessibilityTextElement.linefeedCharacterLength
                newElement.selectedLength = (Self.anchor + element.characterLengthForCharacter(at: Self.anchor)) - newElement.caretLocation
            }
            
        }
        
        newElement.selectedText = nil
        
        return newElement
    }
    
}
