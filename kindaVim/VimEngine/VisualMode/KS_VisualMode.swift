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
            case .linewise:
                ()
            }
        case .c:
            post(ksVisualMode.c())
            
            enterInsertMode()
        case .caret:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.caretForVisualStyleCharacterwise())
            case .linewise:
                ()
            }
        case .d:
            post(ksVisualMode.d())
            
            enterNormalMode()
        case .dollarSign:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.dollarSignForVisualStyleCharacterwise())
            case .linewise:
                ()
            }
        case .e:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.eForVisualStyleCharacterwise())
            case .linewise:
                ()
            }
        case .escape:
            enterInsertMode()
        case .g:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .G:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.GForVisualStyleCharacterwise())
            case .linewise:
                post(ksVisualMode.GForVisualStyleLinewise())
            }
        case .h:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.hForVisualStyleCharacterwise())
            case .linewise:
                ()
            }
        case .i:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .j:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.jForVisualStyleCharacterwise())
            case .linewise:
                post(ksVisualMode.jForVisualStyleLinewise())
            }
        case .k:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.kForVisualStyleCharacterwise())
            case .linewise:
                post(ksVisualMode.kForVisualStyleLinewise())
            }
        case .l:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.lForVisualStyleCharacterwise())
            case .linewise:
                ()
            }
        case .underscore:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.underscoreForVisualStyleCharacterwise())
            case .linewise:
                ()
            }
        case .v:
            switch visualStyle {
            case .characterwise:
                enterNormalMode()
                post(ksVisualMode.vForVisualStyleCharacterwise())
            case .linewise:
                visualStyle = .characterwise
                post(ksVisualMode.vForVisualStyleLinewise())
            }
        case .V:
            switch visualStyle {
            case .characterwise:
                visualStyle = .linewise
                post(ksVisualMode.VForVisualStyleCharacterwise())
            case .linewise:
                enterNormalMode()
                post(ksVisualMode.VForVisualStyleLinewise())
            }
        case .w:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.wForVisualStyleCharacterwise())
            case .linewise:
                ()
            }
        case .y:
            post(ksVisualMode.y())
            
            enterNormalMode()
        case .zero:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.zeroForVisualStyleCharacterwise())
            case .linewise:
                ()
            }
        default:
            ()
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
            case .linewise:
                ()
            }
            
            enterVisualMode()
        case [.g, .dollarSign]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.gDollarSignForVisualStyleCharacterwise())
            case .linewise:
                ()
            }
            
            enterVisualMode()
        case [.g, .e]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.geForVisualStyleCharacterwise())
            case .linewise:
                ()
            }
            
            enterVisualMode()
        case [.g, .g]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.ggForVisualStyleCharacterwise())
            case .linewise:
                post(ksVisualMode.ggForVisualStyleLinewise())
            }
            
            enterVisualMode()
        case [.g, .I]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.gIForVisualStyleCharacterwise())
            case .linewise:
                ()
            }
            
            enterVisualMode()
        case [.g, .j]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.gjForVisualStyleCharacterwise())
            case .linewise:
                post(ksVisualMode.gjForVisualStyleLinewise())
            }
            
            enterVisualMode()
        case [.g, .k]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.gkForVisualStyleCharacterwise())
            case .linewise:
                post(ksVisualMode.gkForVisualStyleLinewise())
            }
            
            enterVisualMode()
        case [.g, .zero]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.gZeroForVisualStyleCharacterwise())
            case .linewise:
                ()
            }
            
            enterVisualMode()
        default:
            // if we don't recognize any operator move
            // go back to visual mode
            enterVisualMode()
        }
    }
    
}
