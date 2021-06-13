protocol TextEngineProtocol {
    
    func beginningOfWordBackward(startingAt location: Int, in text: String) -> Int
    func beginningOfWORDBackward(startingAt location: Int, in text: String) -> Int
    func beginningOfWordForward(startingAt location: Int, in text: String) -> Int
    func beginningOfWORDForward(startingAt location: Int, in text: String) -> Int
    func endOfWordForward(startingAt location: Int, in text: String) -> Int    
    func endOfWORDForward(startingAt location: Int, in text: String) -> Int    
    func findFirst(_ character: Character, in text: String) -> Int?
    func findNext(_ character: Character, after location: Int, in text: String) -> Int?
    func findPrevious(_ character: Character, before location: Int, in text: String) -> Int?
    func findSecond(_ character: Character, in text: String) -> Int?
    func firstNonBlank(in text: String) -> Int
    func innerQuotedString(using character: Character, startingAt location: Int, in text: String) -> Range<Int>?
    func innerWord(startingAt location: Int, in text: String) -> Range<Int>
    func lastLine(in text: String) -> TextEngineLine
    func firstLine(in text: String) -> String
    func nextLine(after location: Int, in text: String) -> String?
    func previousLine(before location: Int, in text: String) -> String?

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
    
    func beginningOfWordBackward(startingAt location: Int, in text: String) -> Int {
        let anchorIndex = text.index(text.startIndex, offsetBy: location)
        let startIndex = text.startIndex
        
        for index in text[startIndex..<anchorIndex].indices.reversed() {
            guard index != startIndex else { return 0 }
            let previousIndex = text.index(before: index)
            
            if text[index].isCharacterThatConstitutesAVimWord {
                if text[previousIndex].isCharacterThatConstitutesAVimWord {
                    continue
                }
            }
            
            if text[index].isPunctuationButNotUnderscore {
                if text[previousIndex].isPunctuationButNotUnderscore {
                    continue
                }
            }
            
            if text[index].isSymbol {
                if text[previousIndex].isSymbol || text[previousIndex].isPunctuationButNotUnderscore {
                    continue
                }
            }
            
            if text[index].isWhitespaceButNotNewline {
                continue
            }
            
            if text[index].isNewline {
                if !text[previousIndex].isNewline {
                    continue
                }
            }

            return text.distance(from: startIndex, to: index)
        }        
        
        return location
    }
    
    func beginningOfWORDBackward(startingAt location: Int, in text: String) -> Int {
        let anchorIndex = text.index(text.startIndex, offsetBy: location)
        let startIndex = text.startIndex
        
        for index in text[startIndex..<anchorIndex].indices.reversed() {
            guard index != startIndex else { return 0 }
            let previousIndex = text.index(before: index)
            
            if text[index].isCharacterThatConstitutesAVimWORD {
                if text[previousIndex].isCharacterThatConstitutesAVimWORD {
                    continue
                }
            }
            
            if text[index].isWhitespaceButNotNewline {
                continue
            }
            
            if text[index].isNewline {
                if !text[previousIndex].isNewline {
                    continue
                }
            }
            
            return text.distance(from: startIndex, to: index)
        }        
        
        return location
    }
    
    func beginningOfWordForward(startingAt location: Int, in text: String) -> Int {
        let anchorIndex = text.index(text.startIndex, offsetBy: location)
        let endIndex = text.endIndex
        
        for index in text[anchorIndex..<endIndex].indices {
            guard index != text.index(before: endIndex) else { return text.count - 1 }
            let nextIndex = text.index(after: index)

            if text[index].isCharacterThatConstitutesAVimWord {
                if text[nextIndex].isCharacterThatConstitutesAVimWord || text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if text[index].isPunctuationButNotUnderscore {
                if text[nextIndex].isPunctuationButNotUnderscore || text[nextIndex].isSymbol || text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if text[index].isSymbol {
                if text[nextIndex].isSymbol || text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if text[index].isWhitespaceButNotNewline {
                if text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if text[index].isNewline {
                if text[nextIndex].isWhitespaceButNotNewline {
                    continue
                }
            }
            
            return text.distance(from: text.startIndex, to: nextIndex)
        }
        
        return location
    }
    
    func beginningOfWORDForward(startingAt location: Int, in text: String) -> Int {
        let anchorIndex = text.index(text.startIndex, offsetBy: location)
        let endIndex = text.endIndex
        
        for index in text[anchorIndex..<endIndex].indices {
            guard index != text.index(before: endIndex) else { return text.count - 1 }
            let nextIndex = text.index(after: index)

            if text[index].isCharacterThatConstitutesAVimWORD {
                if text[nextIndex].isCharacterThatConstitutesAVimWORD || text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if text[index].isWhitespaceButNotNewline {
                if text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if text[index].isNewline {
                if text[nextIndex].isWhitespaceButNotNewline {
                    continue
                }
            }
            
            return text.distance(from: text.startIndex, to: nextIndex)
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
            
            return text.distance(from: text.startIndex, to: text.index(before: nextIndex))
        }
        
        return location
    }
    
    func endOfWORDForward(startingAt location: Int, in text: String) -> Int {
        guard let anchorIndex = text.index(text.startIndex, offsetBy: location + 1, limitedBy: text.endIndex) else { return text.count - 1 }
        let endIndex = text.endIndex
        
        for index in text[anchorIndex..<endIndex].indices {
            guard index != text.index(before: endIndex) else { return text.count - 1 }
            let nextIndex = text.index(after: index)
            
            
            
            return text.distance(from: text.startIndex, to: text.index(before: nextIndex))
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

        let beginningOfWordLocation = beginningOfWordBackward(startingAt: location + 1, in: text)
        let endOfWordLocation = endOfWordForward(startingAt: location - 1, in: text)

        return beginningOfWordLocation..<(endOfWordLocation + 1)
    }    

}


// here we have the helper funcs that may return nil
// they help for the other Vim Text Engine moves,
// or the AccessibilityStrategy moves themselves.
// they may return nil when they cannot find what is being looking for
extension TextEngine {
    
    func findFirst(_ character: Character, in text: String) -> Int? {
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
    
    func findSecond(_ character: Character, in text: String) -> Int? {
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
