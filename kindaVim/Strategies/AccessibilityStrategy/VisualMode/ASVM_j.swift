extension AccessibilityStrategyVisualMode {
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
   
        if VimEngine.shared.visualStyle == .characterwise {
            return jForVisualModeCharacterwise(on: element)
        }
        
        if VimEngine.shared.visualStyle == .linewise {
            return jForVisualModeLinewise(on: element)
        }
        
        return element
    }
    
    private func jForVisualModeCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 1
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: Self.head), let lineBelowHead = AccessibilityTextElementAdaptor.lineFor(location: lineAtHead.end) {
            var newHeadLocation = lineBelowHead.start + (AccessibilityTextElement.globalColumnNumber - 1)
            var globalColumnNumber: Int?
            
            // if the new head is over the line limit, we set it at the line limit,
            // and we will override the setting of the globalColumnNumber
            if newHeadLocation >= lineBelowHead.end {
                newHeadLocation = lineBelowHead.end - 1
                globalColumnNumber = AccessibilityTextElement.globalColumnNumber
            }
            
            if Self.head >= Self.anchor || (Self.head < Self.anchor && newHeadLocation >= Self.anchor) {
                element.caretLocation = Self.anchor
                element.selectedLength += newHeadLocation - Self.head
            } else {
                element.caretLocation = newHeadLocation
                element.selectedLength = Self.head - element.caretLocation
            }
            
            // so here we override the globalColumnNumber as when you reach the end
            // of a line through jk it should let go of the update of the globalColumnNumber
            if globalColumnNumber != nil {
                AccessibilityTextElement.globalColumnNumber = globalColumnNumber!
            }
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
            if let lineBelowHead = AccessibilityTextElementAdaptor.lineFor(location: lineAtHead.end) {
                element.selectedLength += lineBelowHead.length
            }
        } else {
            element.caretLocation += lineAtHead.length
            element.selectedLength -= lineAtHead.length 
        }
        
        return element
    }
    
}
