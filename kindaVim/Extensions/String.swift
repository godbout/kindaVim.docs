extension String {

    func characterLengthForCharacter(at location: Int) -> Int {
        guard let characterIndex = utf16.index(startIndex, offsetBy: location, limitedBy: endIndex) else { return 0 }
        guard characterIndex != endIndex else { return 0 }
        
        return self[characterIndex].utf16.count
    }
    
    func characterLengthForCharacter(after location: Int) -> Int {
        guard let nextCharacterIndex = utf16.index(startIndex, offsetBy: location + characterLengthForCharacter(at: location), limitedBy: endIndex) else { return 0 }
        guard nextCharacterIndex != endIndex else { return 0 }
        
        return self[nextCharacterIndex].utf16.count
    }
    
    func characterLengthForCharacter(before location: Int) -> Int {
        guard let characterIndex = utf16.index(startIndex, offsetBy: location, limitedBy: endIndex) else { return 0 }
        guard characterIndex != startIndex else { return 0 }
        let previousCharacterIndex = index(before: characterIndex)
        guard previousCharacterIndex != endIndex else { return 0 }
        
        return self[previousCharacterIndex].utf16.count
    }
    
}
