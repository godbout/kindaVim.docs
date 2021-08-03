import CoreGraphics


protocol KeyboardStrategyProtocol {
    
    func post(_ keyCombinations: [KeyCombination])
    
}


struct KeyboardStrategy: KeyboardStrategyProtocol {
    
    static var proxy: CGEventTapProxy!
    
    
    func post(_ keyCombinations: [KeyCombination]) {
        print("move using Keyboard Strategy")
        
        for keyCombination in keyCombinations {
            let cgEvents = KeyCombinationAdaptor.toCGEvents(from: keyCombination)
            
            for cgEvent in cgEvents {
                cgEvent.tapPostEvent(Self.proxy)
            }
        }
    }
    
}
