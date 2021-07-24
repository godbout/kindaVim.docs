extension AccessibilityStrategyNormalMode {
    
    // that one is a bit messy to be honest. might need to review the lineFor when value is empty
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        guard element.role == .textArea else { return nil }
        var newElement = element
        
        // the only two times we don't get a next line is if we are at the last line, or if we are before the last line
        // but the last line is empty. if the whole text is empty, we still receive a next line (yes, doesn't seem proper right?)
        if let nextLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number + 1) {
            guard nextLine.length > AccessibilityTextElement.globalColumnNumber else {
                let globalColumNumber = AccessibilityTextElement.globalColumnNumber
                
                newElement.caretLocation = nextLine.endLimit
                newElement.selectedLength = newElement.characterLength
                newElement.selectedText = nil
                
                AccessibilityTextElement.globalColumnNumber = globalColumNumber
                
                return newElement
            }
            
            newElement.caretLocation = nextLine.start + (AccessibilityTextElement.globalColumnNumber - 1)
            // yes, 1. this coz it's really shit to handle the emojis and globalColumnNumber. 1 seems the least
            // worst ways to handle this currently. i'm not sure how to do otherwise. the AX API returns UTF16 lengths,
            // so some emojis are two characters length, some three, some five. how to do? if we convert to Unicode Scalars,
            // every emoji is one character, but they take up way more space in text views, so? don't know.
            newElement.selectedLength = 1
            newElement.selectedText = nil
            
            return newElement
        } 
         
        if element.currentLine.isNotTheLastLine {
            newElement.caretLocation = element.length
            newElement.selectedLength = newElement.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
