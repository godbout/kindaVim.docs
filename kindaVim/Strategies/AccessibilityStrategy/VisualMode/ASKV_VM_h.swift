extension AccessibilityStrategyVisualMode {
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        if KindaVimEngine.shared.visualStyle == .characterwise, let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) {
            if element.caretLocation + element.selectedLength <= Self.anchor + element.characterLengthForCharacter(at: Self.anchor), element.caretLocation > lineAtHead.start {
                newElement.caretLocation -= element.characterLengthForCharacter(before: element.caretLocation)
                newElement.selectedLength += newElement.characterLength
            } else if Self.head > lineAtHead.start, element.selectedLength > 1 {
                newElement.selectedLength -= element.characterLengthForCharacter(before: element.caretLocation + element.selectedLength)
            }
        }
        
        newElement.selectedText = nil
        
        return newElement
    }

}
