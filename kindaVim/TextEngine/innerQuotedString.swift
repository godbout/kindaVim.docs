extension TextEngine {
    
    func innerQuotedString(using quote: Character, startingAt location: Int, in text: String) -> Range<Int>? {
        guard !text.isEmpty else { return nil }
        
        guard let characterAtLocationIndex = text.utf16.index(text.startIndex, offsetBy: location, limitedBy: text.index(before: text.endIndex)) else { return nil }
        let characterAtLocationText = text[characterAtLocationIndex]
        
        if characterAtLocationText == quote {
            let searchEndIndex = text.utf16.index(text.startIndex, offsetBy: location)
            let numberOfQuotesBeforeCurrentQuote = text[..<searchEndIndex].filter { $0 == quote }.utf16.count
            
            if numberOfQuotesBeforeCurrentQuote % 2 == 0 {
                if let nextQuoteLocation = findNext(quote, after: location, in: TextEngineText(from: text)) {
                    return (location + Character.quoteCharacterLength)..<nextQuoteLocation
                }
                
                return nil
            }
        }
        
        if let previousQuoteLocation = findPrevious(quote, before: location, in: text) {
            if let nextQuoteLocation = findNext(quote, after: location - Character.quoteCharacterLength, in: TextEngineText(from: text)) {
                return (previousQuoteLocation + Character.quoteCharacterLength)..<nextQuoteLocation
            }
            
            return nil
        }
        
        if let firstQuoteLocation = findFirst(quote, in: text), let secondQuoteLocation = findSecond(quote, in: text) {
            return (firstQuoteLocation + Character.quoteCharacterLength)..<secondQuoteLocation
        }
        
        return nil
    }    
    
}
