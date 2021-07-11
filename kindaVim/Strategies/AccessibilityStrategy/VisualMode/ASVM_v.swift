extension AccessibilityStrategyVisualMode {
    
    func v(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        return handleAnchorHeadAndCaretLocation(with: element)
    }
    
    private func handleAnchorHeadAndCaretLocation(with element: AccessibilityTextElement) -> AccessibilityTextElement {
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(on: element)
    }
    
    private func handleTheThreeCasesTM(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            element.selectedText = nil
            
            Self.anchor = 0
            Self.head = 0
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 0
            element.selectedText = nil
            
            Self.anchor = element.caretLocation
            Self.head = element.caretLocation
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.selectedText = nil
            
            Self.anchor = element.caretLocation
            Self.head = element.caretLocation
            
            return element
        }
        
        
        return nil
    }
    
    private func theMove(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if Self.anchor == nil {
            if element.caretLocation >= element.currentLine.endLimit {
                element.caretLocation = element.currentLine.endLimit
                Self.anchor = element.currentLine.endLimit
                Self.head = element.currentLine.endLimit
            } else {
                Self.anchor = element.caretLocation
                Self.head = element.caretLocation
            }            
        } else if VimEngine.shared.visualStyle == .linewise {
            if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) { 
                if Self.head > lineAtHead.endLimit {
                    element.caretLocation = lineAtHead.endLimit
                } else {
                    element.caretLocation = Self.head
                }
                
                Self.anchor = element.caretLocation
                Self.head = element.caretLocation
            }
        } else if VimEngine.shared.visualStyle == .characterwise {
            if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) { 
                if Self.head > lineAtHead.endLimit {
                    element.caretLocation = lineAtHead.endLimit
                } else {
                    element.caretLocation = Self.head
                }
            }
        }
        
        element.selectedText = nil
        
        return element   
    }
    
}
