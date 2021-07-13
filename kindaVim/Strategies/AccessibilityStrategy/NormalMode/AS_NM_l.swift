extension AccessibilityStrategyNormalMode {

    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.caretLocation < element.currentLine.endLimit {
            element.caretLocation += 1
        } else {
            element.caretLocation = element.currentLine.endLimit
        }
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }    
    
}
