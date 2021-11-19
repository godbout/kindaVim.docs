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
                    resetCountBuffers()
                    push(element: element)
                }
            case .linewise:
                resetCountBuffers()
            }
        case .b:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.bForVisualStyleCharacterwise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                resetCountBuffers()
            }
        case .c:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.cForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    enterInsertMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.cForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    enterInsertMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .caret:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.caretForVisualStyleCharacterwise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                resetCountBuffers()
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
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                resetCountBuffers()
            }
        case .E:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.EForVisualStyleCharacterwise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                }
            case .linewise:
                resetCountBuffers()
            }
        case .e:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.eForVisualStyleCharacterwise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                resetCountBuffers()
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
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.GForVisualStyleLinewise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .h:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.hForVisualStyleCharacterwise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                resetCountBuffers()
            }
        case .i:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .j:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.jForVisualStyleCharacterwise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.jForVisualStyleLinewise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .k:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.kForVisualStyleCharacterwise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.kForVisualStyleLinewise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .l:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.lForVisualStyleCharacterwise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                resetCountBuffers()
            }
        case .o:
            if let element = asVisualMode.o(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            }
        case .t:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .T:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .underscore:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.underscoreForVisualStyleCharacterwise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                resetCountBuffers()
            }
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
                    resetCountBuffers()
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
                    resetCountBuffers()
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
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                resetCountBuffers()
            }
        case .W:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.WForVisualStyleCharacterwise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                }
            case .linewise:
                resetCountBuffers()
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
            // resetCountBuffers shouldn't be needed because we should reach 0 as
            // a Vim move rather than part of the count only when the count is already nil
            // but resetting below just as extra care and extra love.
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.zeroForVisualStyleCharacterwise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                resetCountBuffers()
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
        case [.g, .caret]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.gCaretForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }
            case .linewise:
                ()
            }
            
            enterVisualMode()
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
        case [.g, .I]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.gIForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }       
            case .linewise:
                ()
            }
            
            enterVisualMode()
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
