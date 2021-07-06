extension AccessibilityStrategyVisualMode {
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if VimEngine.shared.visualStyle == .linewise {
            return jForVisualModeLinewise(on: element)
        }
        
        return element
    }
    
    private func jForVisualModeLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
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
        
        
        guard let lineAtAnchor = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.anchor) else { return element }
        guard let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) else { return element }
        
        if lineAtHead.number >= lineAtAnchor.number {
            if let lineBelowHead = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtHead.number + 1) {
                element.selectedLength += lineBelowHead.length
            }
        } else {
            element.caretLocation += lineAtHead.length
            element.selectedLength -= lineAtHead.length 
        }
        
        return element
    }
    
}
