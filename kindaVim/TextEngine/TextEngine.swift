protocol TextEngineProtocol {
    
    func beginningOfParagraphBackward(startingAt location: Int, in text: String) -> Int
    func beginningOfWordBackward(startingAt location: Int, in text: TextEngineText) -> Int
    func beginningOfWORDBackward(startingAt location: Int, in text: TextEngineText) -> Int
    func beginningOfWordForward(startingAt location: Int, in text: TextEngineText) -> Int
    func beginningOfWORDForward(startingAt location: Int, in text: TextEngineText) -> Int
    func endOfParagraphForward(startingAt location: Int, in text: String) -> Int
    func endOfWordBackward(startingAt location: Int, in text: String) -> Int
    func endOfWORDBackward(startingAt location: Int, in text: String) -> Int
    func endOfWordForward(startingAt location: Int, in text: String) -> Int
    func endOfWORDForward(startingAt location: Int, in text: String) -> Int
    func findNext(_ character: Character, after location: Int, in text: String) -> Int?
    func findPrevious(_ character: Character, before location: Int, in text: String) -> Int?
    func firstNonBlank(in text: String) -> Int
    func innerQuotedString(using character: Character, startingAt location: Int, in text: String) -> Range<Int>?
    func innerWord(startingAt location: Int, in text: String) -> Range<Int>
    func lastLine(in text: String) -> TextEngineLine
    func firstLine(in text: String) -> String
    func nextLine(after location: Int, in text: String) -> String?
    func nextUnmatched(_ bracket: Character, after location: Int, in text: String) -> Int
    func previousLine(before location: Int, in text: String) -> String?
    func previousUnmatched(_ bracket: Character, before location: Int, in text: String) -> Int

}


struct TextEngineText {

    let value: String

    var isEmpty: Bool {
        return value.isEmpty
    }

    var isNotEmpty: Bool {
        return !isEmpty
    }

    var isOnlyALinefeedCharacter: Bool {
        return value == "\n"
    }

    var endLimit: Int {
        guard isNotEmpty else { return 0 }
        guard !isOnlyALinefeedCharacter else { return 0 }
        guard value.hasSuffix("\n") else { return value.distance(from: value.startIndex, to: value.index(before: value.endIndex)) }

        return value.distance(from: value.startIndex, to: value.endIndex)
    }


    init(from text: String) {
        value = text
    }

}


struct TextEngineLine {
    
    var start: Int
    var end: Int
    var value: String
    
}


struct TextEngine: TextEngineProtocol {}


// Vim Text Engine types of move.
// always return a location.
// e.g. previousNonBlank: if it cannot find a non blank, then it returns 0 (start of line)
// rather than nil. so those funcs are not pure search funcs, they're more related
// to Vim ways of working.
extension TextEngine {
    
    func beginningOfParagraphBackward(startingAt location: Int, in text: String) -> Int {
        var searchEndIndex = text.index(text.startIndex, offsetBy: location)
        
        while searchEndIndex != text.startIndex, searchEndIndex != text.endIndex, text[searchEndIndex].isNewline {
            searchEndIndex = text.index(before: searchEndIndex)
        }        
        
        if let previousEmptyLineRange = text.range(of: "\n\n", options: [.backwards], range: text.startIndex..<searchEndIndex) {
            return text.distance(from: text.startIndex, to: previousEmptyLineRange.lowerBound) + 1
        }
        
        return 0
    }
    
    
    
    
    
    func endOfParagraphForward(startingAt location: Int, in text: String) -> Int {
        guard !text.isEmpty else { return 0 }
        
        var searchStartIndex = text.index(text.startIndex, offsetBy: location)
        
        while searchStartIndex != text.endIndex, text[searchStartIndex].isNewline {
            searchStartIndex = text.index(after: searchStartIndex)
        }        
        
        if let nextEmptyLineRange = text.range(of: "\n\n", options: [], range: searchStartIndex..<text.endIndex) {
            return text.distance(from: text.startIndex, to: nextEmptyLineRange.lowerBound) + 1
        }
        
        return text.count - 1
    }
    
    func endOfWordBackward(startingAt location: Int, in text: String) -> Int {
        let anchorIndex = text.index(text.startIndex, offsetBy: location)
        let startIndex = text.startIndex
        
        for index in text [startIndex..<anchorIndex].indices.reversed() {
            guard index != startIndex else { return 0 }
            guard index != text.index(before: text.endIndex) else { return text.count - 1 }
            let nextIndex = text.index(after: index)
            
            if text[index].isCharacterThatConstitutesAVimWord {
                if text[nextIndex].isCharacterThatConstitutesAVimWord {
                    continue
                }
            }
            
            if text[index].isPunctuationButNotUnderscore {
                if text[nextIndex].isPunctuationButNotUnderscore || text[nextIndex].isSymbol {
                    continue
                }
            }
            
            if text[index].isSymbol {
                if text[nextIndex].isSymbol || text[nextIndex].isPunctuationButNotUnderscore {
                    continue
                }
            }
            
            if text[index].isWhitespaceButNotNewline {
                if text[nextIndex].isWhitespace || text[nextIndex].isCharacterThatConstitutesAVimWord || text[nextIndex].isPunctuationButNotUnderscore || text[nextIndex].isSymbol {
                    continue
                }
            }
            
            // weird, special case, but can't find another
            // way to make this work after two full days of
            // head banging on that shit
            if text[index].isNewline {
                let previousIndex = text.index(before: index)
                
                if !text[previousIndex].isNewline {
                    continue
                }                
            }
    
            return text.distance(from: startIndex, to: index)
        }
        
        return location
    }
    
    func endOfWORDBackward(startingAt location: Int, in text: String) -> Int {
        let anchorIndex = text.index(text.startIndex, offsetBy: location)
        let startIndex = text.startIndex
        
        for index in text [startIndex..<anchorIndex].indices.reversed() {
            guard index != startIndex else { return 0 }
            guard index != text.index(before: text.endIndex) else { return text.count - 1 }
            let nextIndex = text.index(after: index)
            
            if text[index].isCharacterThatConstitutesAVimWORD {
                if text[nextIndex].isCharacterThatConstitutesAVimWORD {
                    continue
                }
            }
                        
            if text[index].isWhitespaceButNotNewline {
                if text[nextIndex].isWhitespace || text[nextIndex].isCharacterThatConstitutesAVimWORD || text[nextIndex].isPunctuationButNotUnderscore || text[nextIndex].isSymbol {
                    continue
                }
            }
            
            if text[index].isNewline {
                let previousIndex = text.index(before: index)
                
                if !text[previousIndex].isNewline {
                    continue
                }                
            }
            
            return text.distance(from: startIndex, to: index)
        }
        
        return location
    }
    
    func endOfWordForward(startingAt location: Int, in text: String) -> Int {
        guard let anchorIndex = text.index(text.startIndex, offsetBy: location + 1, limitedBy: text.endIndex) else { return text.count - 1 }
        let endIndex = text.endIndex
        
        for index in text[anchorIndex..<endIndex].indices {
            guard index != text.index(before: endIndex) else { return text.count - 1 }
            let nextIndex = text.index(after: index)
            
            if text[index].isCharacterThatConstitutesAVimWord {
                if text[nextIndex].isCharacterThatConstitutesAVimWord {
                    continue
                }
            }
            
            if text[index].isPunctuationButNotUnderscore {
                if text[nextIndex].isPunctuationButNotUnderscore || text[nextIndex].isSymbol {
                    continue
                }
            }
            
            if text[index].isSymbol {
                if text[nextIndex].isSymbol {
                    continue
                }
            }
            
            if text[index].isWhitespaceButNotNewline {
                if text[nextIndex].isWhitespace || text[nextIndex].isCharacterThatConstitutesAVimWord || text[nextIndex].isPunctuationButNotUnderscore || text[nextIndex].isSymbol {
                    continue
                }
            }
            
            if text[index].isNewline {
                continue
            }
            
            return text.distance(from: text.startIndex, to: index)
        }
        
        return location
    }
    
    func endOfWORDForward(startingAt location: Int, in text: String) -> Int {
        guard let anchorIndex = text.index(text.startIndex, offsetBy: location + 1, limitedBy: text.endIndex) else { return text.count - 1 }
        let endIndex = text.endIndex
        
        for index in text[anchorIndex..<endIndex].indices {
            guard index != text.index(before: endIndex) else { return text.count - 1 }
            let nextIndex = text.index(after: index)
            
            if text[index].isCharacterThatConstitutesAVimWORD {
                if text[nextIndex].isCharacterThatConstitutesAVimWORD {
                    continue
                }
            }
            
            if text[index].isWhitespaceButNotNewline {
                if text[nextIndex].isWhitespace || text[nextIndex].isCharacterThatConstitutesAVimWord || text[nextIndex].isPunctuationButNotUnderscore || text[nextIndex].isSymbol {
                    continue
                }
            }
            
            if text[index].isNewline {
                continue
            }
            
            return text.distance(from: text.startIndex, to: index)
        }
        
        return location
    }
    
    func firstNonBlank(in text: String) -> Int {
        guard let characterIndex = text.firstIndex(where: { !$0.isWhitespaceButNotNewline }) else { return text.count }
        
        return text.distance(from: text.startIndex, to: characterIndex)
    }
    
    func innerQuotedString(using quote: Character, startingAt location: Int, in text: String) -> Range<Int>? {
        if let previousQuoteLocation = findPrevious(quote, before: location, in: text) {
            if let nextQuoteLocation = findNext(quote, after: location - 1, in: text) {
                return (previousQuoteLocation + 1)..<nextQuoteLocation
            }
            
            return nil
        }
        
        if let firstQuoteLocation = findFirst(quote, in: text), let secondQuoteLocation = findSecond(quote, in: text) {
            return (firstQuoteLocation + 1)..<secondQuoteLocation
        }
        
        return nil
    }    

    func innerWord(startingAt location: Int, in text: String) -> Range<Int> {
        let characterAtLocationIndex = text.index(text.startIndex, offsetBy: location)
        let characterAtLocationText = text[characterAtLocationIndex]

        if characterAtLocationText == " " {
            let previousNonBlankLocation = findPreviousNonBlank(startingAt: location, in: text) ?? -1
            let nextNonBlankLocation = findNextNonBlank(after: location, in: text) ?? text.count  
            
            return (previousNonBlankLocation + 1)..<nextNonBlankLocation
        }

        let beginningOfWordLocation = beginningOfWordBackward(startingAt: location + 1, in: TextEngineText(from: text))
        let endOfWordLocation = endOfWordForward(startingAt: location - 1, in: text)

        return beginningOfWordLocation..<(endOfWordLocation + 1)
    }
    
    func nextUnmatched(_ bracket: Character, after location: Int, in text: String) -> Int {
        let locationIndex = text.index(text.startIndex, offsetBy: location)
        let searchText = String(text[locationIndex..<text.endIndex])

        if let rightBracketFoundLocation = findNextUnmatched(bracket, after: 0, in: searchText) {
            return location + rightBracketFoundLocation
        }
        
        return location
    }    
    
    func previousUnmatched(_ bracket: Character, before location: Int, in text: String) -> Int {
        let locationIndex = text.index(text.startIndex, offsetBy: location)
        let searchText = String(text[text.startIndex..<locationIndex])
        
        if let leftBracketFoundLocation = findPreviousUnmatched(bracket, before: location, in: searchText) {
            return leftBracketFoundLocation
        }
        
        return location
    }

}


// here we have the helper funcs that may return nil
// they help for the other Vim Text Engine moves,
// or the AccessibilityStrategy moves themselves.
// they may return nil when they cannot find what is being looking for
extension TextEngine {
    
    private func findPreviousUnmatched(_ bracket: Character, before location: Int, in text: String) -> Int? {
        var pairingBracket: Character
        
        switch bracket {
        case "{":
            pairingBracket = "}"
        case "(":
            pairingBracket = ")"
        default:
            return nil
        }
        
        let searchEndIndex = text.index(text.startIndex, offsetBy: location)
        
        guard let lastLeftBracketFoundIndex = text[text.startIndex..<searchEndIndex].lastIndex(of: bracket) else { return nil }
        
        if let lastRightBracketFoundIndex = text[lastLeftBracketFoundIndex..<text.endIndex].lastIndex(of: pairingBracket) {
            let lastLeftBracketFoundLocation = text.distance(from: text.startIndex, to: lastLeftBracketFoundIndex)
            
            return findPreviousUnmatched(bracket, before: lastLeftBracketFoundLocation, in: String(text[text.startIndex..<lastRightBracketFoundIndex]))
        }
        
        return text.distance(from: text.startIndex, to: lastLeftBracketFoundIndex)
    }
    
    private func findNextUnmatched(_ bracket: Character, after location: Int, in text: String) -> Int? {
        var pairingBracket: Character
        
        switch bracket {
        case "}":
            pairingBracket = "{"
        case ")":
            pairingBracket = "("
        default:
            return nil
        }
        
        guard let searchStartIndex = text.index(text.startIndex, offsetBy: location + 1, limitedBy: text.endIndex) else { return nil }
        
        guard let firstRightBracketFoundIndex = text[searchStartIndex..<text.endIndex].firstIndex(of: bracket) else { return nil }
        
        if let firstLeftBracketFoundIndex = text[text.index(after: text.startIndex)..<firstRightBracketFoundIndex].firstIndex(of: pairingBracket) {
            let distanceBetweenLeftAndRightBracketsFound = text.distance(from: firstLeftBracketFoundIndex, to: firstRightBracketFoundIndex)
            let distanceFromStartToFirstLeftBracketFound = text.distance(from: text.startIndex, to: firstLeftBracketFoundIndex) 
            
            return distanceFromStartToFirstLeftBracketFound + (findNextUnmatched(bracket, after: distanceBetweenLeftAndRightBracketsFound, in: String(text[firstLeftBracketFoundIndex..<text.endIndex])) ?? 0)
        }
        
        return text.distance(from: text.startIndex, to: firstRightBracketFoundIndex)               
    }
    
    private func findFirst(_ character: Character, in text: String) -> Int? {
        guard let characterIndex = text.firstIndex(of: character) else { return nil }
        
        return text.distance(from: text.startIndex, to: characterIndex)
    }
    
    func findLast(_ character: Character, in text: String) -> Int? {
        guard let characterIndex = text.lastIndex(of: character) else { return nil }
        
        return text.distance(from: text.startIndex, to: characterIndex)
    }
    
    func findNext(_ character: Character, after location: Int, in text: String) -> Int? {
        guard let searchStartIndex = text.index(text.startIndex, offsetBy: location + 1, limitedBy: text.endIndex) else { return nil }
        let searchEndIndex = text.endIndex
        
        guard let characterFoundLocation = findFirst(character, in: String(text[searchStartIndex..<searchEndIndex])) else { return nil }
        
        return (location + 1) + characterFoundLocation
    }
    
    func findNextNonBlank(after location: Int, in text: String) -> Int? {
        let anchorIndex = text.index(text.startIndex, offsetBy: location)
        let endIndex = text.endIndex
        
        for index in text[anchorIndex..<endIndex].indices {
            guard index != text.index(before: endIndex) else { return nil }
            let nextIndex = text.index(after: index)
            
            if text[nextIndex].isWhitespaceButNotNewline {
                continue
            }
            
            return text.distance(from: text.startIndex, to: nextIndex)
        }
        
        return nil
    }
    
    func findPrevious(_ character: Character, before location: Int, in text: String) -> Int? {
        let searchStartIndex = text.startIndex
        guard let searchEndIndex = text.index(text.startIndex, offsetBy: location, limitedBy: text.endIndex) else { return nil }
        
        guard let characterFoundLocation = findLast(character, in: String(text[searchStartIndex..<searchEndIndex])) else { return nil }
        
        return characterFoundLocation
    }
    
    func findPreviousNonBlank(startingAt location: Int, in text: String) -> Int? {
        guard let anchorIndex = text.index(text.startIndex, offsetBy: location + 1, limitedBy: text.endIndex) else { return nil }
        let startIndex = text.startIndex
        
        for index in text[startIndex..<anchorIndex].indices.reversed() {
            guard index != startIndex else { return nil }
            let previousIndex = text.index(before: index)
            
            if text[previousIndex].isWhitespaceButNotNewline {
                continue
            }
            
            return text.distance(from: startIndex, to: previousIndex)
        }
        
        return nil
    }
    
    private func findSecond(_ character: Character, in text: String) -> Int? {
        guard let firstCharacterIndex = text.firstIndex(of: character) else { return nil }
        let nextToFirstCharacterIndex = text.index(after: firstCharacterIndex)
        guard let secondCharacterLocation = findFirst(character, in: String(text[nextToFirstCharacterIndex..<text.endIndex])) else { return nil }
        
        return text.distance(from: text.startIndex, to: nextToFirstCharacterIndex) + secondCharacterLocation
    }
    
    func firstLine(in text: String) -> String {
        guard let nextLineStartLocation = findNext("\n", after: -1, in: text) else { return text }
                    
        let nextLineStartIndex = text.index(text.startIndex, offsetBy: nextLineStartLocation + 1)
        
        return String(text[text.startIndex..<nextLineStartIndex])
    }
    
    func lastLine(in text: String) -> TextEngineLine {
        guard let previousLineStartLocation = findPrevious("\n", before: text.count, in: text) else { return TextEngineLine(start: 0, end: text.count, value: text) }
        
        let previousLineStartIndex = text.index(text.startIndex, offsetBy: previousLineStartLocation + 1)
        
        return TextEngineLine(
            start: text.distance(from: text.startIndex, to: previousLineStartIndex),
            end: text.distance(from: text.startIndex, to: text.endIndex),
            value: String(text[previousLineStartIndex..<text.endIndex]) 
        )
    }
    
    func nextLine(after location: Int, in text: String) -> String? {
        guard let nextLineStartLocation = findNext("\n", after: location - 1, in: text) else { return nil }
        let nextLineEndLocation = findNext("\n", after: nextLineStartLocation, in: text) ?? text.count - 1
        
        let nextLineStartIndex = text.index(text.startIndex, offsetBy: nextLineStartLocation + 1)
        let nextLineEndIndex = text.index(text.startIndex, offsetBy: nextLineEndLocation + 1)
        
        return String(text[nextLineStartIndex..<nextLineEndIndex])
    }
    
    func previousLine(before location: Int, in text: String) -> String? {
        guard let previousLineEndLocation = findPrevious("\n", before: location, in: text) else { return nil }
        let previousLineStartLocation = findPrevious("\n", before: previousLineEndLocation, in: text) ?? -1
        
        let previousLineEndIndex = text.index(text.startIndex, offsetBy: previousLineEndLocation + 1)
        let previousLineStartIndex = text.index(text.startIndex, offsetBy: previousLineStartLocation + 1)
        
        return String(text[previousLineStartIndex..<previousLineEndIndex])
    }
    
}
