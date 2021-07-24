extension AccessibilityStrategyVisualMode {
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        if KindaVimEngine.shared.visualStyle == .characterwise, let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) {
            if element.caretLocation < Self.anchor, element.caretLocation <= lineAtHead.endLimit {
                newElement.caretLocation += element.characterLength
                newElement.selectedLength -= element.characterLength
            } else if element.caretLocation + element.selectedLength < lineAtHead.end {
                newElement.selectedLength += element.characterLengthForCharacter(at: element.caretLocation + element.selectedLength)
            }            
        }        
        
        newElement.selectedText = nil
        
        return newElement
    }
    
}

