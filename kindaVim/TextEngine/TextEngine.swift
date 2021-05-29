protocol TextEngineProtocol {
    
    func wordBackward(count: Int, for location: Int, playground text: String) -> Int
    func wordForward(count: Int, for location: Int, playground text: String) -> Int
    
}


extension TextEngineProtocol {
    
    func wordBackward(count: Int = 1, for location: Int, playground text: String) -> Int {
        return wordBackward(count: count, for: location, playground: text)
    }
    
    func wordForward(count: Int = 1, for location: Int, playground text: String) -> Int {
        return wordForward(count: count, for: location, playground: text)
    }
    
}


struct TextEngine: TextEngineProtocol {
    
    func wordBorward(count: Int = 1, for location: Int, playground text: String) -> Int {
        return location
    }

    func wordForward(count: Int = 1, for location: Int, playground text: String) -> Int {
        let start = text.index(text.startIndex, offsetBy: location)
        let end = text.endIndex

        let currentCharacterIndex = text.index(text.startIndex, offsetBy: location)

        for index in text[start..<end].indices {
            if index == text.index(before: text.endIndex) {
                return text.distance(from: text.startIndex, to: text.index(before: text.endIndex)) 
            }
            
            if text[index] == "_" {
                continue
            }

            if text[index].isNewline {
                let nextIndex = text[start..<end].index(after: index)
                    
                if text[nextIndex].isNewline || !text[nextIndex].isWhitespace {
                    return text.distance(from: text.startIndex, to: text.index(after: index))
                } else {
                    continue
                }
            }

            if text[index].isWhitespace {
                let nextIndex = text[start..<end].index(after: index)

                if text[nextIndex].isWhitespace {
                    continue
                } else {
                    return text.distance(from: text.startIndex, to: text.index(after: index))
                }
            }

            if text[index].isPunctuation {
                if text[currentCharacterIndex].isPunctuation {
                    continue
                } else {
                    return text.distance(from: text.startIndex, to: index)
                }
            }

            if text[index].isLetter {
                if text[currentCharacterIndex].isLetter {
                    continue
                } else {
                    return text.distance(from: text.startIndex, to: index)
                }
            }
        }

        return location
    }

}
