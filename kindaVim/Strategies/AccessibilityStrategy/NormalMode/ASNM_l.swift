extension AccessibilityStrategy {

    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        if element.caretLocation < element.currentLine.endLimit! {
            element.caretLocation += 1
        }
        
        return element
    }    
    
}
