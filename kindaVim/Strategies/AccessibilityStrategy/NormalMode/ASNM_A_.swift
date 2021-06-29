extension AccessibilityStrategyNormalMode {
    
    func A(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        guard element.currentLine.isNotAnEmptyLine else { return element }
        
        element.caretLocation = element.currentLine.endLimit + 1
        
        return element
    }
    
}
