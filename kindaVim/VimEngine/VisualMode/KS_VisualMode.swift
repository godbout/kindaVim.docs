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
                resetCountBuffers()
                post(ksVisualMode.bForVisualStyleCharacterwise())
            case .linewise:
                resetCountBuffers()
            }
        case .c:
            post(ksVisualMode.c())
            enterInsertMode()
        case .caret:
            switch visualStyle {
            case .characterwise:
                resetCountBuffers()
                post(ksVisualMode.caretForVisualStyleCharacterwise())
            case .linewise:
                resetCountBuffers()
            }
        case .d:
            post(ksVisualMode.d())
            
            enterNormalMode()
        case .dollarSign:
            switch visualStyle {
            case .characterwise:
                resetCountBuffers()
                post(ksVisualMode.dollarSignForVisualStyleCharacterwise())
            case .linewise:
                resetCountBuffers()
            }
        case .e:
            switch visualStyle {
            case .characterwise:
                resetCountBuffers()
                post(ksVisualMode.eForVisualStyleCharacterwise())
            case .linewise:
                resetCountBuffers()
            }
        case .escape:
            enterInsertMode()
        case .g:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .G:
            switch visualStyle {
            case .characterwise:
                resetCountBuffers()
                post(ksVisualMode.GForVisualStyleCharacterwise())
            case .linewise:
                resetCountBuffers()
                post(ksVisualMode.GForVisualStyleLinewise())
            }
        case .h:
            switch visualStyle {
            case .characterwise:
                resetCountBuffers()
                post(ksVisualMode.hForVisualStyleCharacterwise())
            case .linewise:
                resetCountBuffers()
            }
        case .i:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .j:
            switch visualStyle {
            case .characterwise:
                resetCountBuffers()
                post(ksVisualMode.jForVisualStyleCharacterwise())
            case .linewise:
                resetCountBuffers()
                post(ksVisualMode.jForVisualStyleLinewise())
            }
        case .k:
            switch visualStyle {
            case .characterwise:
                resetCountBuffers()
                post(ksVisualMode.kForVisualStyleCharacterwise())
            case .linewise:
                resetCountBuffers()
                post(ksVisualMode.kForVisualStyleLinewise())
            }
        case .l:
            switch visualStyle {
            case .characterwise:
                resetCountBuffers()
                post(ksVisualMode.lForVisualStyleCharacterwise())
            case .linewise:
                resetCountBuffers()
            }
        case .underscore:
            switch visualStyle {
            case .characterwise:
                resetCountBuffers()
                post(ksVisualMode.underscoreForVisualStyleCharacterwise())
            case .linewise:
                resetCountBuffers()
            }
        case .v:
            switch visualStyle {
            case .characterwise:
                enterNormalMode()
                post(ksVisualMode.vForVisualStyleCharacterwise())
            case .linewise:
                visualStyle = .characterwise
                resetCountBuffers()
                post(ksVisualMode.vForVisualStyleLinewise())
            }
        case .V:
            switch visualStyle {
            case .characterwise:
                visualStyle = .linewise
                resetCountBuffers()
                post(ksVisualMode.VForVisualStyleCharacterwise())
            case .linewise:
                enterNormalMode()
                post(ksVisualMode.VForVisualStyleLinewise())
            }
        case .w:    
            switch visualStyle {
            case .characterwise:
                resetCountBuffers()
                post(ksVisualMode.wForVisualStyleCharacterwise())
            case .linewise:
                resetCountBuffers()
            }
        case .y:
            post(ksVisualMode.y())
            enterNormalMode()
        case .zero:
            switch visualStyle {
            case .characterwise:
                resetCountBuffers()
               post(ksVisualMode.zeroForVisualStyleCharacterwise())
            case .linewise:
                resetCountBuffers()
            }
        default:
            resetCountBuffers()
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
