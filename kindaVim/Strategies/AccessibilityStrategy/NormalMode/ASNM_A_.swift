extension AccessibilityStrategyNormalMode {
    
    func A(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        guard element.currentLine.isNotAnEmptyLine else {
            element.selectedLength = 0
            element.selectedText = nil

            return element            
        }
        
        element.caretLocation = element.currentLine.endLimit + 1
        element.selectedLength = 0
        element.selectedText = nil
        
        return element        
    }
    
}
