extension AccessibilityStrategyVisualMode {
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if VimEngine.shared.visualStyle == .linewise {
            return kForVisualModeLinewise(on: element)
        }
        
        return element
    }
    
    private func kForVisualModeLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation = element.currentLine.start
            element.selectedLength = element.currentLine.length
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        guard let lineNumberAtAnchor = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.anchor) else { return element }
        guard let lineNumberAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) else { return element }
        
        if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineNumberAtHead.number) {
            if lineNumberAtHead.number > lineNumberAtAnchor.number {
                element.selectedLength -= lineAtHead.length
            } else {
                if let lineBeforeHead = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineNumberAtHead.number - 1) {
                    element.caretLocation -= lineBeforeHead.length
                    element.selectedLength += lineBeforeHead.length
                }
            }
        }        
        
        return element
    }
    
}
