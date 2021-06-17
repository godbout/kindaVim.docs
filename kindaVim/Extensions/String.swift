extension String {
    
    var isOnlyALinefeedCharacter: Bool {
        return self == "\n"
    }
    
    var endLimit: Int {
        guard !isEmpty else { return 0 }
        guard !isOnlyALinefeedCharacter else { return 0 }
        
        let characterBeforeLastIndex = index(before: endIndex)
        
        if hasSuffix("\n") {
            let characterBeforeBeforeLastIndex = index(before: characterBeforeLastIndex)
            
            return distance(from: startIndex, to: characterBeforeBeforeLastIndex)            
        }
        
        return distance(from: startIndex, to: characterBeforeLastIndex)        
    }
    
    mutating func removeTrailingLinefeedIfAny() {
        if hasSuffix("\n") {
            removeLast()
        }    
    }
    
    mutating func addTrailingLinefeedIfNone() {
        if !hasSuffix("\n") {
            append("\n")
        }
    }
    
}
