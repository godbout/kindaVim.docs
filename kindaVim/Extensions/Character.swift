extension Character {
    
    var isCharacterThatConstitutesAVimWord: Bool {
        return self.isLetter || self.isNumber || self == "_"
    }
    
    var isPunctuationButNotUnderscore: Bool {
        return self.isPunctuation && self != "_"
    }
    
    var isWhitespaceButNotNewline: Bool { 
        return self.isWhitespace && !self.isNewline
    }
    
    var isCharacterThatConstitutesAVimWORD: Bool {
        return self.isLetter || self.isNumber || self.isPunctuation || self.isSymbol
    }
    
    static var linefeedCharacterLength = 1
    static var bracketCharacterLength = 1
    static var quoteCharacterLength = 1
    
}
