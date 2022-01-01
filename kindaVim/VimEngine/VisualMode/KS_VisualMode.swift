import KeyCombination


// KS Visual Mode
extension KindaVimEngine {
    
    func handleVisualModeUsingKeyboardStrategy(for keyCombination: KeyCombination) {
        switch keyCombination.vimKey {
        case .a:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .b:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.bForNonTextElementWhenInVisualStyleCharacterwise())
                } else {
                    post(ksVisualMode.bForTextElementWhenInVisualStyleCharacterwise())
                }
                                
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .C:
            switch focusedElementType {
            case .textElement:
                post(ksVisualMode.CForTextElement())
            default:
                post(ksVisualMode.CForNonTextElement())
            }
            
            lastYankStyle = .linewise
            enterInsertMode()
        case .c:
            switch focusedElementType {
            case .textElement:
                post(ksVisualMode.cForTextElement())
            default:
                post(ksVisualMode.cForNonTextElement())
            }
            
            lastYankStyle = visualStyle == .characterwise ? .characterwise : .linewise
            enterInsertMode()
        case .caret:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.caretForNonTextElementWhenInVisualStyleCharacterwise())
                } else {
                    post(ksVisualMode.caretForTextElementWhenInVisualStyleCharacterwise())
                }
                                
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .D:
            switch focusedElementType {
            case .textElement:
                post(ksVisualMode.DForTextElement())
            default:
                post(ksVisualMode.DForNonTextElement())
            }
            
            lastYankStyle = .linewise
            enterNormalMode()
        case .d:
            switch focusedElementType {
            case .textElement:
                post(ksVisualMode.dForTextElement())
            default:
                post(ksVisualMode.dForNonTextElement())
            }
            
            lastYankStyle = visualStyle == .characterwise ? .characterwise : .linewise
            enterNormalMode()
        case .dollarSign:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.dollarSignForNonTextElementWhenInVisualStyleCharacterwise())
                } else {
                    post(ksVisualMode.dollarSignForTextElementWhenInVisualStyleCharacterwise())
                }
                                
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .e:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.eForNonTextElementWhenInVisualStyleCharacterwise())
                } else {
                    post(ksVisualMode.eForTextElementWhenInVisualStyleCharacterwise())
                }
                                
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .escape:
            enterInsertMode()
        case .G:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.GForNonTextElement())
                } else {
                    post(ksVisualMode.GForTextElementWhenInVisualStyleCharacterwise())
                }
                
                endCurrentMove()
            case .linewise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.GForNonTextElement())
                } else {
                    post(ksVisualMode.GForTextElementWhenInVisualStyleLinewise())
                }
                
                endCurrentMove()
            }
        case .g:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .h:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.hForVisualStyleCharacterwise())
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .i:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .j:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.jForVisualStyleCharacterwise())
                endCurrentMove()
            case .linewise:
                post(ksVisualMode.jForVisualStyleLinewise())
                endCurrentMove()
            }
        case .k:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.kForVisualStyleCharacterwise())
                endCurrentMove()
            case .linewise:
                post(ksVisualMode.kForVisualStyleLinewise())
                endCurrentMove()
            }
        case .l:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.lForVisualStyleCharacterwise())
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .underscore:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.underscoreForNonTextElementWhenInVisualStyleCharacterwise())
                } else {
                    post(ksVisualMode.underscoreForTextElementWhenInVisualStyleCharacterwise())
                }
                                
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .V:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.VForNonTextElement())
                } else {
                    post(ksVisualMode.VForTextElementWhenInVisualStyleCharacterwise())
                }
                                
                visualStyle = .linewise
                endCurrentMove()
            case .linewise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.VForNonTextElement())
                } else {
                    post(ksVisualMode.VForTextElementWhenInVisualStyleLinewise())
                }
                                
                enterNormalMode()
            }
        case .v:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.vForNonTextElement())
                } else {
                    post(ksVisualMode.vForTextElementWhenInVisualStyleCharacterwise())
                }
                
                enterNormalMode()
            case .linewise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.vForNonTextElement())
                } else {
                    post(ksVisualMode.vForTextElementWhenInVisualStyleLinewise())
                }
                
                visualStyle = .characterwise
                endCurrentMove()
            }
        case .w:    
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.wForNonTextElementWhenInVisualStyleCharacterwise())
                } else {
                    post(ksVisualMode.wForTextElementWhenInVisualStyleCharacterwise())
                }
                                
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .x:
            switch focusedElementType {
            case .textElement:
                post(ksVisualMode.xForTextElement())
            default:
                post(ksVisualMode.xForNonTextElement())
            }
            
            enterNormalMode()
        case .Y:
            switch focusedElementType {
            case .textElement:
                post(ksVisualMode.YForTextElement())
            default:
                post(ksVisualMode.YForNonTextElement())
            }
            
            lastYankStyle = .linewise
            enterNormalMode()
        case .y:
            switch focusedElementType {
            case .textElement:
                post(ksVisualMode.yForTextElement())
            default:
                post(ksVisualMode.yForNonTextElement())
            }
            
            enterNormalMode()
        case .zero:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.zeroForNonTextElementWhenInVisualStyleCharacterwise())
                } else {
                    post(ksVisualMode.zeroForTextElementWhenInVisualStyleCharacterwise())
                }
                                
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        default:
            endCurrentMove()
        }
    }
    
}


// Operator Pending for KS Visual Mode
extension KindaVimEngine {
    
    func parseOperatorCommandForVisualModeUsingKeyboardStrategy() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.g, .caret]:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.gCaretForNonTextElementWhenInVisualStyleCharacterwise())
                } else {
                    post(ksVisualMode.gCaretForTextElementWhenInVisualStyleCharacterwise())
                }
                
                enterVisualMode()
            case .linewise:
                enterVisualMode()
            }
        case [.g, .dollarSign]:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.gDollarSignForNonTextElementWhenInVisualStyleCharacterwise())
                } else {
                    post(ksVisualMode.gDollarSignForTextElementWhenInVisualStyleCharacterwise())
                }
                
                enterVisualMode()
            case .linewise:
                enterVisualMode()
            }
        case [.g, .e]:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.geForNonTextElementWhenInVisualStyleCharacterwise())
                } else {
                    post(ksVisualMode.geForTextElementWhenInVisualStyleCharacterwise())
                }
                
                enterVisualMode()
            case .linewise:
                enterVisualMode()
            }
        case [.g, .g]:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.ggForNonTextElement())
                } else {
                    post(ksVisualMode.ggForTextElementWhenInVisualStyleCharacterwise())
                }
                
                enterVisualMode()
            case .linewise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.ggForNonTextElement())
                } else {
                    post(ksVisualMode.ggForTextElementWhenInVisualStyleLinewise())
                }
                
                enterVisualMode()
            }
        case [.g, .I]:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.gIForNonTextElementWhenInVisualStyleCharacterwise())
                } else {
                    post(ksVisualMode.gIForTextElementWhenInVisualStyleCharacterwise())
                }
                
                enterVisualMode()
            case .linewise:
                enterVisualMode()
            }
        case [.g, .j]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.gjForVisualStyleCharacterwise())
                enterVisualMode()
            case .linewise:
                post(ksVisualMode.gjForVisualStyleLinewise())
                enterVisualMode()
            }
        case [.g, .k]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.gkForVisualStyleCharacterwise())
                enterVisualMode()
            case .linewise:
                post(ksVisualMode.gkForVisualStyleLinewise())
                enterVisualMode()
            }
        case [.g, .zero]:
            switch visualStyle {
            case .characterwise:
                if focusedElementType == .nonTextElement {
                    post(ksVisualMode.gZeroForNonTextElementWhenInVisualStyleCharacterwise())
                } else {
                    post(ksVisualMode.gZeroForTextElementWhenInVisualStyleCharacterwise())
                }
                
                enterVisualMode()
            case .linewise:
                enterVisualMode()
            }
        default:
            // if we don't recognize any operator move
            // go back to visual mode
            enterVisualMode()
        }
    }
    
}
