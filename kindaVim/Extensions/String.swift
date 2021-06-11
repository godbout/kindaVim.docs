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
    
}
