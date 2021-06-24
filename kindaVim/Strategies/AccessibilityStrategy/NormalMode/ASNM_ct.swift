extension AccessibilityStrategy {
    
    func ct(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return dt(to: character, on: element)
    }
    
}
