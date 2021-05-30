protocol TextEngineProtocol {
    
    func wordBackward(for location: Int, playground text: String) -> Int
    func wordForward(for location: Int, playground text: String) -> Int
    
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
    
    func wordBackward(for location: Int, playground text: String) -> Int {
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

    func wordForward(for location: Int, playground text: String) -> Int {
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

}
