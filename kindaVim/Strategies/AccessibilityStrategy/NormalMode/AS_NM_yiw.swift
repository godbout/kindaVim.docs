import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yiw(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        let value = element.value
        let wordRange = textEngine.innerWord(startingAt: element.caretLocation, in: value)
        
        let beginningOfWordIndex = value.utf16.index(value.startIndex, offsetBy: wordRange.lowerBound)
        let endOfWordIndex = value.utf16.index(value.startIndex, offsetBy: wordRange.upperBound)
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(String(value[beginningOfWordIndex..<endOfWordIndex]), forType: .string)
        
        newElement.caretLocation = wordRange.lowerBound
        newElement.selectedLength = newElement.characterLength
        newElement.selectedText = nil
    
        return newElement
    }
    
}
