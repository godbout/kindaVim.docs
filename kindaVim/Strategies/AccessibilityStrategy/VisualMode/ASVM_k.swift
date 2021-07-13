extension AccessibilityStrategyVisualMode {
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if VimEngine.shared.visualStyle == .characterwise {
            return kForVisualModeCharacterwise(on: element)
        }
        
        if VimEngine.shared.visualStyle == .linewise {
            return kForVisualModeLinewise(on: element)
        }
        
        return element
    }
    
    private func kForVisualModeCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: Self.head), let lineAboveHead = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtHead.number - 1) {
            var newHeadLocation = lineAboveHead.start + (AccessibilityTextElement.globalColumnNumber - 1)
            var globalColumnNumber: Int?
            
            // if the new head is over the line limit, we set it at the line limit,
            // and we will override the setting of the globalColumnNumber
            if newHeadLocation >= lineAboveHead.end {
                newHeadLocation = lineAboveHead.end - 1
                globalColumnNumber = AccessibilityTextElement.globalColumnNumber
            }
            
            // here we use selectedLength += rather than the easier selectedLength =
            // because for last character, we can't select the character, so it would fail
            if Self.head > Self.anchor, newHeadLocation > Self.anchor {
                element.selectedLength -= Self.head - newHeadLocation
            } else if Self.head > Self.anchor, newHeadLocation <= Self.anchor {
                element.caretLocation = newHeadLocation
                element.selectedLength += (Self.anchor - Self.head) + (Self.anchor - newHeadLocation)
            } else {
                element.caretLocation = newHeadLocation
                element.selectedLength += Self.head - newHeadLocation
            } 
            
            if globalColumnNumber != nil {
                AccessibilityTextElement.globalColumnNumber = globalColumnNumber!
            }
            
            element.selectedText = nil
            
            return element
        }
        
        element.selectedText = nil
        
        return element
    }
    
    private func kForVisualModeLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {        
        var element = element
        
        guard let lineAtAnchor = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.anchor) else {
            element.selectedLength = 1
            element.selectedText = nil
            
            return element
            
        }
        
        guard let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) else {
            element.selectedLength = 1
            element.selectedText = nil 
            
            return element
        }
        
        if lineAtHead.number > lineAtAnchor.number {
            element.selectedLength -= lineAtHead.length
            element.selectedText = nil
            
            return element
        }
        
        if let lineAboveHead = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtHead.number - 1) {
            element.caretLocation -= lineAboveHead.length
            element.selectedLength += lineAboveHead.length
            element.selectedText = nil
            
            return element
        }
        
        element.selectedText = nil
        
        return element
    }
    
}
