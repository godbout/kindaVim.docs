extension AccessibilityStrategyNormalMode {
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        guard element.caretLocation > element.currentLine.start else { 
            element.selectedLength = 1
            element.selectedText = nil
            
            return element
        }
        
        element.caretLocation -= 1
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
