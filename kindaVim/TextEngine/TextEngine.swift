protocol TextEngineProtocol {
    
    func wordBackward(for location: Int, playground text: String) -> Int
    func wordForward(for location: Int, playground text: String) -> Int
    
}


struct TextEngine: TextEngineProtocol {
    
    func wordBackward(for location: Int, playground text: String) -> Int {
        let anchorIndex = text.index(text.startIndex, offsetBy: location)
        let startIndex = text.startIndex
        
        for index in text[startIndex..<anchorIndex].indices.reversed() {
            guard index != startIndex else { return 0 }
            let previousIndex = text.index(before: index)
            
            if text[index] == "_" {
                if text[previousIndex].isLetter || text[previousIndex].isNumber || text[previousIndex] == "_" {
                    continue
                }
            }
            
            if text[index].isLetter {
                if text[previousIndex].isLetter || text[previousIndex].isNumber || text[previousIndex] == "_" {
                    continue
                }
            }
            
            if text[index].isNumber {
                if text[previousIndex].isLetter || text[previousIndex].isNumber || text[previousIndex] == "_" {
                    continue
                }
            }
            
            if text[index].isNewline {
                if !text[previousIndex].isNewline {
                    continue
                }
            }
                        
            if text[index].isWhitespace && !text[index].isNewline {
                continue
            }
            
            if text[index].isPunctuation && text[index] != "_" {
                if text[previousIndex].isPunctuation && text[previousIndex] != "_" {
                    continue
                }
            }
            
            if text[index].isSymbol {
                if text[previousIndex].isSymbol || (text[previousIndex].isPunctuation && text[previousIndex] != "_") {
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
            
            if text[index] == "_" {
                if text[nextIndex].isLetter || text[nextIndex].isNumber || text[nextIndex] == "_" || text[nextIndex].isWhitespace {
                    continue
                }
            }
                        
            if text[index].isPunctuation && text[index] != "_" {
                if (text[nextIndex].isPunctuation && text[nextIndex] != "_") || text[nextIndex].isSymbol || text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if text[index].isLetter {
                if text[nextIndex].isLetter || text[nextIndex].isNumber || text[nextIndex] == "_" || text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if text[index].isNumber {
                if text[nextIndex].isLetter || text[nextIndex].isNumber || text[nextIndex] == "_" || text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if text[index].isWhitespace && !text[index].isNewline {
                if text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            if text[index].isNewline {
                if text[nextIndex].isWhitespace && !text[nextIndex].isNewline {
                    continue
                }
            }
            
            if text[index].isSymbol {
                if text[nextIndex].isSymbol || text[nextIndex].isWhitespace {
                    continue
                }
            }
            
            return text.distance(from: text.startIndex, to: nextIndex)
        }
        
        return location
    }

}
