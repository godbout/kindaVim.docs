import KeyCombination


// AS Visual Mode
extension KindaVimEngine {
    
    func tryHandlingVisualModeUsingAccessibilityStrategyFirst(for keyCombination: KeyCombination) {
        switch keyCombination.vimKey {
        case .a:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .B:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.BForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                }
            case .linewise:
                ()
            }
        case .b:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.bForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                ()
            }
        case .c:
            enterInsertMode()
            
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.cForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.cForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .d:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.dForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.dForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .dollarSign:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.dollarSignForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                ()
            }
        case .E:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.EForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                }
            case .linewise:
                ()
            }
        case .e:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.eForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                ()
            }
        case .escape:
            // currently a hack
            // so that we can comment multiple lines by keeping the VM selection :D
            enterInsertMode()
        case .f:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .F:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .g:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .G:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.GForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.GForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .h:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.hForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                ()
            }
        case .i:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .j:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.jForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.jForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .k:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.kForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.kForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .l:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.lForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                ()
            }
        case .o:
            if let element = asVisualMode.o(on: focusedTextElement) {
                push(element: element)
            }
        case .t:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .T:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .v:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.vForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.vForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    
                    visualStyle = .characterwise
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .V:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.VForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    
                    visualStyle = .linewise
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.VForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .w:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.wForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                ()
            }
        case .W:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.WForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                }
            case .linewise:
                ()
            }
        case .y:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.yForVisualStyleCharacterwise(on: focusedTextElement, &lastYankStyle) {
                    push(element: element)
                    
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.yForVisualStyleLinewise(on: focusedTextElement, &lastYankStyle) {
                    push(element: element)
                    
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .zero:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.zeroForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                ()
            }
        default:
            ()
        }
    }
    
    
    
}


// Operator Pending for AS Visual Mode
extension KindaVimEngine {
    
    func tryParsingOperatorCommandForVisualModeUsingAccessibilityStrategyFirst() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.g, .dollarSign]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.gDollarSignForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }
            case .linewise:
                ()
            }
            
            enterVisualMode()
        case [.g, .E]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.gEForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                }
            case .linewise:
                ()
            }
            
            enterVisualMode()
        case [.g, .e]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.geForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }
            case .linewise:
                ()
            }
            
            enterVisualMode()
        case [.g, .g]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.ggForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }       
            case .linewise:
                if let element = asVisualMode.ggForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }       
            }
        case [.g, .j]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.gjForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }       
            case .linewise:
                if let element = asVisualMode.gjForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }       
            }
        case [.g, .k]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.gkForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }       
            case .linewise:
                if let element = asVisualMode.gkForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }       
            }
        case [.g, .zero]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.gZeroForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }
            case .linewise:
                ()
            }
            
            enterVisualMode()
        case [.i, .w]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.iwForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                }
            case .linewise:
                ()
            }
            
            enterVisualMode()
        default:
            switch visualStyle {
            case .characterwise:
                if operatorPendingBuffer.first?.vimKey == .f, let character = operatorPendingBuffer.last {
                    if let element = asVisualMode.fForVisualStyleCharacterwise(to: character.character, on: focusedTextElement) {
                        push(element: element)
                    }
                }
                
                if operatorPendingBuffer.first?.vimKey == .F, let character = operatorPendingBuffer.last {
                    if let element = asVisualMode.FForVisualStyleCharacterwise(to: character.character, on: focusedTextElement) {
                        push(element: element)
                    }
                }
                
                if operatorPendingBuffer.first?.vimKey == .t, let character = operatorPendingBuffer.last {
                    if let element = asVisualMode.tForVisualStyleCharacterwise(to: character.character, on: focusedTextElement) {
                        push(element: element)
                    }
                }
                
                if operatorPendingBuffer.first?.vimKey == .T, let character = operatorPendingBuffer.last {
                    if let element = asVisualMode.TForVisualStyleCharacterwise(to: character.character, on: focusedTextElement) {
                        push(element: element)
                    }
                }
            case .linewise:
                ()
            }
           
            enterVisualMode()
        }
    }
    
}
