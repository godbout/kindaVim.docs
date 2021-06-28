extension AccessibilityStrategyVisualMode {
    
    func c(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        
        if VimEngine.shared.visualStyle == .linewise {
            element.caretLocation = element.currentLine.start
            element.selectedLength = element.currentLine.lengthWithoutLinefeed
            element.selectedText = ""
        } else {
            element.selectedText = ""
        }
        
        return element
    }
    
}
