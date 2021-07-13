extension AccessibilityStrategyNormalMode {
    
    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
            
        guard element.currentLine.isNotAnEmptyLine else {
            element.selectedLength = 0
            element.selectedText = nil

            return element
        }
        
        guard element.caretIsNotAtTheEnd else {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        element.caretLocation += 1
        element.selectedLength = 0
        element.selectedText = nil
        
        return element
    }
    
}
