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
                post(ksVisualMode.bForVisualStyleCharacterwise())
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .c:
            post(ksVisualMode.c())
            enterInsertMode()
        case .caret:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.caretForVisualStyleCharacterwise())
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .d:
            post(ksVisualMode.d())            
            enterNormalMode()
        case .dollarSign:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.dollarSignForVisualStyleCharacterwise())
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .e:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.eForVisualStyleCharacterwise())
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .escape:
            enterInsertMode()
        case .g:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .G:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.GForVisualStyleCharacterwise())
                endCurrentMove()
            case .linewise:
                post(ksVisualMode.GForVisualStyleLinewise())
                endCurrentMove()
            }
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
                post(ksVisualMode.underscoreForVisualStyleCharacterwise())
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .v:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.vForVisualStyleCharacterwise())
                enterNormalMode()
            case .linewise:
                visualStyle = .characterwise
                post(ksVisualMode.vForVisualStyleLinewise())
                endCurrentMove()
            }
        case .V:
            switch visualStyle {
            case .characterwise:
                visualStyle = .linewise
                post(ksVisualMode.VForVisualStyleCharacterwise())
                endCurrentMove()
            case .linewise:
                post(ksVisualMode.VForVisualStyleLinewise())
                enterNormalMode()
            }
        case .w:    
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.wForVisualStyleCharacterwise())
                endCurrentMove()
            case .linewise:
                endCurrentMove()
            }
        case .y:
            post(ksVisualMode.y())
            enterNormalMode()
        case .zero:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.zeroForVisualStyleCharacterwise())
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
                post(ksVisualMode.gCaretForVisualStyleCharacterwise())
                enterVisualMode()
            case .linewise:
                enterVisualMode()
            }
        case [.g, .dollarSign]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.gDollarSignForVisualStyleCharacterwise())
                enterVisualMode()
            case .linewise:
                enterVisualMode()
            }
        case [.g, .e]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.geForVisualStyleCharacterwise())
                enterVisualMode()
            case .linewise:
                enterVisualMode()
            }
        case [.g, .g]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.ggForVisualStyleCharacterwise())
                enterVisualMode()
            case .linewise:
                post(ksVisualMode.ggForVisualStyleLinewise())
                enterVisualMode()
            }
        case [.g, .I]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.gIForVisualStyleCharacterwise())
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
                post(ksVisualMode.gZeroForVisualStyleCharacterwise())
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
