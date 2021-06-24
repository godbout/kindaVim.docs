extension AccessibilityStrategyNormalMode {
    
    func x(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        
        guard element.currentLine.isNotAnEmptyLine else { return element }        
        
        element.selectedLength = 1
        element.selectedText = ""
        
        // if we're at the last character of the line we need to move the caret back
        // one position, in certain cases
        if element.caretLocation >= element.currentLine.endLimit! {
            _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
            
            if element.caretLocation > element.currentLine.startLimit! {
                element.caretLocation -= 1                                
            }
            
            element.selectedText = nil
        }
        
        return element
    }
    
}
