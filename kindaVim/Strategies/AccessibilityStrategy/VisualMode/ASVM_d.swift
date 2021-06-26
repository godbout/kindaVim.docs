extension AccessibilityStrategyVisualMode {
    
    func d(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        
        element.selectedText = ""
        
        
        if VimEngine.shared.visualStyle == .linewise {
            if let nextLine = textEngine.nextLine(after: element.caretLocation, in: element.value) {
                let firstNonBlankOfNextLineLocation = textEngine.firstNonBlank(in: nextLine)
                let firstNonBlankOfNextLineText = nextLine[..<nextLine.index(nextLine.startIndex, offsetBy: firstNonBlankOfNextLineLocation)]
            
                _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
                
                element.caretLocation += firstNonBlankOfNextLineText.count
                element.selectedLength = 0
                element.selectedText = nil
            }                
        }
        
        return element
    }
    
}
