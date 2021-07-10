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
        
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 1
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {}
        
        
        if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: Self.head), let lineAboveHead = AccessibilityTextElementAdaptor.lineFor(location: lineAtHead.start - 1) {
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
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {}
        
        
        guard let lineAtAnchor = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.anchor) else { return element }
        guard let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) else { return element }
        
        if lineAtHead.number > lineAtAnchor.number {
            element.selectedLength -= lineAtHead.length
        } else {
            if let lineAboveHead = AccessibilityTextElementAdaptor.lineFor(location: lineAtHead.start - 1) {
                element.caretLocation -= lineAboveHead.length
                element.selectedLength += lineAboveHead.length
            }
        }
        
        return element
    }
    
}
