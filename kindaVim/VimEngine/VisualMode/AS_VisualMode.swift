import KeyCombination


// AS Visual Mode
extension KindaVimEngine {
    
    func tryHandlingVisualModeUsingAccessibilityStrategyFirst(for keyCombination: KeyCombination, appMode: AppMode) {
        switch keyCombination.vimKey {
        case .a:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .B:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.BForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                }
                
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .b:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.bForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                endCurrentMove()
            }
        case .C:
            if let element = asVisualMode.C(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                state.lastYankStyle = .linewise
                enterInsertMode()
            } else {
                handleVisualModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .c:
            // TODO: push visualStyle into VimEngineState? then no need to separate like this. can separate within the AS
            // itself.
            // we are able to do that now because we're putting setting the state LYS within the moves themselves.
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.cForVisualStyleCharacterwise(on: focusedTextElement, pgR: appMode == .pgR) {
                    push(element: element)
                    state.lastYankStyle = .characterwise
                    enterInsertMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.cForVisualStyleLinewise(on: focusedTextElement, pgR: appMode == .pgR) {
                    push(element: element)
                    state.lastYankStyle = .linewise
                    enterInsertMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .caret:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.caretForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                endCurrentMove()
            }
        case .D:
            if let element = asVisualMode.D(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                state.lastYankStyle = .linewise
                enterNormalMode()
            } else {
                handleVisualModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .d:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.dForVisualStyleCharacterwise(on: focusedTextElement, pgR: appMode == .pgR) {
                    push(element: element)
                    state.lastYankStyle = .characterwise
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.dForVisualStyleLinewise(on: focusedTextElement, pgR: appMode == .pgR) {
                    push(element: element)
                    state.lastYankStyle = .linewise
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
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                endCurrentMove()
            }
        case .E:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.EForVisualStyleCharacterwise(on: focusedTextElement) {                    
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                endCurrentMove()
            }
        case .e:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.eForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                endCurrentMove()
            }
        case .escape:
            // currently a hack
            // so that we can comment multiple lines by keeping the VM selection :D
            enterInsertMode()
        case .F:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .f:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .G:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.GForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.GForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .g:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .h:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.hForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                endCurrentMove()
            }
        case .i:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .j:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.jForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.jForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .k:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.kForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.kForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .l:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.lForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                endCurrentMove()
            }
        case .o:
            if let element = asVisualMode.o(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleVisualModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .T:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .t:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .tilde:
            if let element = asVisualMode.tilde(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                handleVisualModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .underscore:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.underscoreForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                endCurrentMove()
            }
        case .V:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.VForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    visualStyle = .linewise
                    endCurrentMove()
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
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .W:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.WForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                endCurrentMove()
            }
        case .w:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.wForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                endCurrentMove()
            }
        case .X:
            if let element = asVisualMode.X(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                state.lastYankStyle = .linewise
                enterNormalMode()
            } else {
                handleVisualModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .x:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.xForVisualStyleCharacterwise(on: focusedTextElement, pgR: appMode == .pgR) {
                    push(element: element)
                    state.lastYankStyle = .characterwise
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.xForVisualStyleLinewise(on: focusedTextElement, pgR: appMode == .pgR) {
                    push(element: element)
                    state.lastYankStyle = .linewise
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .Y:
            if let element = asVisualMode.Y(on: focusedTextElement) {
                push(element: element)
                state.lastYankStyle = .linewise
                enterNormalMode()
            } else {
                handleVisualModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .y:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.yForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    state.lastYankStyle = .characterwise
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.yForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    state.lastYankStyle = .linewise
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .zero:
            // endCurrentMove shouldn't be needed because we should reach 0 as
            // a Vim move rather than part of the count only when the count is already nil
            // but resetting below just as extra care and extra love.
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.zeroForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                endCurrentMove()
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
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }
            case .linewise:
                enterVisualMode()
            }
        case [.g, .dollarSign]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.gDollarSignForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }
            case .linewise:
                enterVisualMode()
            }
        case [.g, .E]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.gEForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)                    
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }
            case .linewise:
                enterVisualMode()
            }
        case [.g, .e]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.geForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }
            case .linewise:
                enterVisualMode()
            }
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
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }       
            case .linewise:
                enterVisualMode()
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
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }
            case .linewise:
                enterVisualMode()
            }
        case [.i, .W]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.iWForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }
            case .linewise:
                enterVisualMode()
            }
        case [.i, .w]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.iwForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }
            case .linewise:
                enterVisualMode()
            }
        default:
            switch visualStyle {
            case .characterwise:
                guard operatorPendingBuffer.first?.vimKey != .F else {
                    if let character = operatorPendingBuffer.last, let element = asVisualMode.FForVisualStyleCharacterwise(times: count, to: character.character, on: focusedTextElement) {
                        push(element: element)                        
                        enterVisualMode()
                    } else {
                        parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                    }
                                        
                    return
                }
                                
                guard operatorPendingBuffer.first?.vimKey != .f else {
                    if let character = operatorPendingBuffer.last, let element = asVisualMode.fForVisualStyleCharacterwise(times: count, to: character.character, on: focusedTextElement) {
                        push(element: element)                        
                        enterVisualMode()
                    } else {
                        parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                    }
                                        
                    return
                }
                
                guard operatorPendingBuffer.first?.vimKey != .T else {
                    if let character = operatorPendingBuffer.last, let element = asVisualMode.TForVisualStyleCharacterwise(times: count, to: character.character, on: focusedTextElement) {
                        push(element: element)                        
                        enterVisualMode()
                    } else {
                        parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                    }
                                        
                    return
                }
                
                guard operatorPendingBuffer.first?.vimKey != .t else {
                    if let character = operatorPendingBuffer.last, let element = asVisualMode.tForVisualStyleCharacterwise(times: count, to: character.character, on: focusedTextElement) {
                        push(element: element)                        
                        enterVisualMode()
                    } else {
                        parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                    }
                                        
                    return
                }
                
                // if nothing gets caught, stop operator pending and go back to VM
                enterVisualMode()
            case .linewise:
                enterVisualMode()
            }
        }
    }
    
}
