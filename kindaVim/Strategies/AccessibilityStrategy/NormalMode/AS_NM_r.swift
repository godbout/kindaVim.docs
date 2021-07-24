extension AccessibilityStrategyNormalMode {
    
    func r(with replacement: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        let value = element.value
        
        guard !value.isEmpty else { return element }                        
        guard let characterUnderCaretIndex = value.utf16.index(value.startIndex, offsetBy: element.caretLocation, limitedBy: value.index(before: value.endIndex)) else { return element }
        let characterUnderCaretText = element.value[characterUnderCaretIndex]
        
        guard characterUnderCaretText != "\n" else {
            newElement.selectedLength = 1
            newElement.selectedText = nil
            
            return newElement            
        }
        
        guard replacement != "\u{1b}" else {
            newElement.selectedLength = 1
            newElement.selectedText = nil
            
            return newElement            
        }
        
        newElement.selectedLength = newElement.characterLength
        newElement.selectedText = ""
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
        
        if let updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() {
            newElement.caretLocation = updatedElement.caretLocation
            newElement.selectedLength = 0
            newElement.selectedText = replacement.isNewline ? "\n" : String(replacement)
            
            return newElement
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
