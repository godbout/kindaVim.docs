extension AccessibilityStrategyVisualMode {
    
    func c(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        if VimEngine.shared.visualStyle == .characterwise {
            return cForVisualModeCharacterwise(on: element)
        }
        
        if VimEngine.shared.visualStyle == .linewise {
            return cForVisualModeLinewise(on: element)
        }
        
        return element
    }
    
    private func cForVisualModeCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element 
        
        element.selectedText = ""
        
        return element
    }
    
    private func cForVisualModeLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        let value = element.value
        let beginningOfSelectionIndex = value.index(value.startIndex, offsetBy: element.caretLocation)
        let endOfSelectionIndex = value.index(value.startIndex, offsetBy: element.caretLocation + element.selectedLength)
        let currentSelectedText = value[beginningOfSelectionIndex..<endOfSelectionIndex]
        
        if currentSelectedText.last == "\n" {
            element.selectedLength -= 1
        }
        
        element.selectedText = ""
        
        return element
    }
    
}
