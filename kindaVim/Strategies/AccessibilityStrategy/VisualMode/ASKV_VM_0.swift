extension AccessibilityStrategyVisualMode {
    
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        if KindaVimEngine.shared.visualStyle == .characterwise, let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) {
            if lineAtHead.start <= Self.anchor || Self.head <= Self.anchor {
                newElement.caretLocation = lineAtHead.start
                newElement.selectedLength = (Self.anchor + element.characterLengthForCharacter(at: Self.anchor)) - lineAtHead.start
            } else {
                newElement.selectedLength = (lineAtHead.start + element.characterLengthForCharacter(at: lineAtHead.start)) - Self.anchor
            }
        }
       
        newElement.selectedText = nil
        
        return newElement
    }

}
