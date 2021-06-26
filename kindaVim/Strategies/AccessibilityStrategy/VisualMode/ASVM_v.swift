extension AccessibilityStrategyVisualMode {
    
    func v(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        return handleAnchorHeadAndCaretLocation(with: element)
    }
    
    private func handleAnchorHeadAndCaretLocation(with element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if element.isEmpty {
            Self.anchor = 0
            Self.head = 0
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 1
            
            Self.anchor = element.caretLocation
            Self.head = element.caretLocation
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            Self.anchor = element.caretLocation
            Self.head = element.caretLocation
            
            return element
        }
        
        
        if Self.anchor == nil {
            Self.anchor = element.caretLocation
            Self.head = element.caretLocation
        } else if VimEngine.shared.visualStyle == .linewise {
            if Self.head > element.currentLine.endLimit! {
                element.caretLocation = element.currentLine.endLimit!
            } else {
                element.caretLocation = Self.head
            }
            
            Self.anchor = element.caretLocation
            Self.head = element.caretLocation
        } else {
            element.caretLocation = Self.head
        }
        
        return element        
    }
    
}
