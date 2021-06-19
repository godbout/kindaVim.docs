extension AccessibilityStrategy {
    
    func dt(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return ct(to: character, on: element)
    }
    
}
