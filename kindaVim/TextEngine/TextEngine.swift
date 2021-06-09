protocol TextEngineProtocol {
    
    func beginningOfWordBackward(startingAt location: Int, in text: String) -> Int
    func beginningOfWordForward(startingAt location: Int, in text: String) -> Int
    func endOfWordForward(startingAt location: Int, in text: String) -> Int    
    func findFirst(_ character: Character, in text: String) -> Int?
    func firstNonBlank(in text: String) -> Int
    func findNext(_ character: Character, after location: Int, in text: String) -> Int?
    func findPrevious(_ character: Character, before location: Int, in text: String) -> Int?
    func findSecond(_ character: Character, in text: String) -> Int?
    func nextLine(after location: Int, in text: String) -> String?
    func previousLine(before location: Int, in text: String) -> String?
    
}


extension Character {
    
    func isCharacterThatConstitutesAVimWord() -> Bool {
        return self.isLetter || self.isNumber || self == "_"
    }
    
    func isPunctuationButNotUnderscore() -> Bool {
        return self.isPunctuation && self != "_"
    }
    
    func isWhitespaceButNotNewline() -> Bool { 
        return self.isWhitespace && !self.isNewline
    }
    
}


struct TextEngine: TextEngineProtocol {
    
    func beginningOfWordBackward(startingAt location: Int, in text: String) -> Int {
        let anchorIndex = text.index(text.startIndex, offsetBy: location)
        let startIndex = text.startIndex
        
        for index in text[startIndex..<anchorIndex].indices.reversed() {
            guard index != startIndex else { return 0 }
            let previousIndex = text.index(before: index)
            
            if text[index].isCharacterThatConstitutesAVimWord() {
                if text[previousIndex].isCharacterThatConstitutesAVimWord() {
                    continue
                }
            }
            
            if text[index].isPunctuationButNotUnderscore() {
                if text[previousIndex].isPunctuationButNotUnderscore() {
                    continue
                }
            }
            
            if text[index].isSymbol {
                if text[previousIndex].isSymbol || text[previousIndex].isPunctuationButNotUnderscore() {
                    continue
                }
            }
            
            if text[index].isWhitespaceButNotNewline() {
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

            if text[index].isCharacterThatConstitutesAVimWord() {
                if text[nextIndex].isCharacterThatConstitutesAVimWord() || text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if text[index].isPunctuationButNotUnderscore() {
                if text[nextIndex].isPunctuationButNotUnderscore() || text[nextIndex].isSymbol || text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if text[index].isSymbol {
                if text[nextIndex].isSymbol || text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if text[index].isWhitespaceButNotNewline() {
                if text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if text[index].isNewline {
                if text[nextIndex].isWhitespaceButNotNewline() {
                    continue
                }
            }
            
            return text.distance(from: text.startIndex, to: nextIndex)
        }
        
        return location
    }

    func firstNonBlank(in text: String) -> Int {
        guard let characterIndex = text.firstIndex(where: { !$0.isWhitespaceButNotNewline() }) else { return 0 }

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

    func findPrevious(_ character: Character, before location: Int, in text: String) -> Int? {
        let searchStartIndex = text.startIndex
        guard let searchEndIndex = text.index(text.startIndex, offsetBy: location, limitedBy: text.endIndex) else { return nil }

        guard let characterFoundLocation = findLast(character, in: String(text[searchStartIndex..<searchEndIndex])) else { return nil }

        return characterFoundLocation
    }

    func findSecond(_ character: Character, in text: String) -> Int? {
        guard let firstCharacterIndex = text.firstIndex(of: character) else { return nil }
        let nextToFirstCharacterIndex = text.index(after: firstCharacterIndex)
        guard let secondCharacterLocation = findFirst(character, in: String(text[nextToFirstCharacterIndex..<text.endIndex])) else { return nil }

        return text.distance(from: text.startIndex, to: nextToFirstCharacterIndex) + secondCharacterLocation
    }

    func nextLine(after location: Int, in text: String) -> String? {
        guard let nextLineStartLocation = findNext("\n", after: location - 1, in: text) else { return nil }
        let nextLineEndLocation = findNext("\n", after: nextLineStartLocation, in: text) ?? text.count - 1

        let nextLineStartLocationIndex = text.index(text.startIndex, offsetBy: nextLineStartLocation + 1)
        let nextLineEndLocationIndex = text.index(text.startIndex, offsetBy: nextLineEndLocation + 1)

        return String(text[nextLineStartLocationIndex..<nextLineEndLocationIndex])
    }

    func previousLine(before location: Int, in text: String) -> String? {
        guard let previousLineEndLocation = findPrevious("\n", before: location, in: text) else { return nil }
        let previousLineStartLocation = findPrevious("\n", before: previousLineEndLocation, in: text) ?? -1

        let previousLineEndIndex = text.index(text.startIndex, offsetBy: previousLineEndLocation + 1)
        let previousLineStartIndex = text.index(text.startIndex, offsetBy: previousLineStartLocation + 1)

        return String(text[previousLineStartIndex..<previousLineEndIndex])
    }

    func endOfWordForward(startingAt location: Int, in text: String) -> Int {
        guard let anchorIndex = text.index(text.startIndex, offsetBy: location + 1, limitedBy: text.endIndex) else { return text.count - 1 }
        let endIndex = text.endIndex
        
        for index in text[anchorIndex..<endIndex].indices {
            guard index != text.index(before: endIndex) else { return text.count - 1 }
            let nextIndex = text.index(after: index)

            if text[index].isCharacterThatConstitutesAVimWord() {
                if text[nextIndex].isCharacterThatConstitutesAVimWord() {
                    continue
                }
            }

            if text[index].isPunctuationButNotUnderscore() {
                if text[nextIndex].isPunctuationButNotUnderscore() || text[nextIndex].isSymbol {
                    continue
                }
            }
            
            if text[index].isSymbol {
                if text[nextIndex].isSymbol {
                    continue
                }
            }

            if text[index].isWhitespaceButNotNewline() {
                if text[nextIndex].isWhitespace || text[nextIndex].isCharacterThatConstitutesAVimWord() || text[nextIndex].isPunctuationButNotUnderscore() || text[nextIndex].isSymbol {
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

}
