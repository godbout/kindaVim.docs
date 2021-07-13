extension AccessibilityStrategyNormalMode {
    
    func C(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        guard element.currentLine.isNotAnEmptyLine else {
            element.selectedLength = 0
            element.selectedText = nil

            return element            
        }
        
        element.selectedLength = (element.currentLine.endLimit + 1) - element.caretLocation
        element.selectedText = ""
                
        return element
    }
    
}
