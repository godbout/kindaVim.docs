extension AccessibilityStrategyNormalMode {
    
    func x(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        guard element.currentLine.isNotAnEmptyLine else {
            element.selectedLength = 1
            element.selectedText = nil
            
            return element
        }        
        
        // if we're at the last character of the line we need to move the caret back
        // one position, in certain cases
        guard element.caretLocation < element.currentLine.endLimit else {
            element.selectedLength = 1
            element.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
            
            if element.caretLocation > element.currentLine.start {
                element.caretLocation -= 1                                
            }
            
            element.selectedLength = 1
            element.selectedText = nil
            
            return element
        }
        
        element.selectedLength = 1
        element.selectedText = ""
        
        return element
    }
    
}
