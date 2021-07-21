extension TextEngine {
    
    func beginningOfWordForward(startingAt location: Int, in text: TextEngineText) -> Int {
        guard text.isNotEmpty else { return 0 }
        
        let value = text.value
        
        let anchorIndex = value.utf16.index(value.startIndex, offsetBy: location)
        let endIndex = value.endIndex
        
        for index in value[anchorIndex..<endIndex].indices {
            guard index != value.index(before: endIndex) else { return text.endLimit }
            let nextIndex = value.index(after: index)
            
            if value[index].isCharacterThatConstitutesAVimWord {
                if value[nextIndex].isCharacterThatConstitutesAVimWord || value[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if value[index].isPunctuationButNotUnderscore {
                if value[nextIndex].isPunctuationButNotUnderscore || value[nextIndex].isSymbol || value[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if value[index].isSymbol {
                if value[nextIndex].isSymbol || value[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if value[index].isWhitespaceButNotNewline {
                if value[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if value[index].isNewline {
                if value[nextIndex].isWhitespaceButNotNewline {
                    continue
                }
            }
            
            return value.utf16.distance(from: value.startIndex, to: nextIndex)
        }
        
        return text.endLimit
    }
    
}
