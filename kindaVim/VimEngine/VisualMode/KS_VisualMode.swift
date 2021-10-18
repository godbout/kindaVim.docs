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
        case .d:
            post(ksVisualMode.d())
            
            enterNormalMode()
        case .e:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.eForVisualStyleCharacterwise())
            case .linewise:
                ()
            }
        case .g:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .G:
            post(ksVisualMode.GForVisualStyleCharacterwise())
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
                ()
            }
            post(ksVisualMode.jForVisualStyleCharacterwise())
        case .k:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.kForVisualStyleCharacterwise())
            case .linewise:
                ()
            }
        case .l:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.lForVisualStyleCharacterwise())
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
        case .escape:
            enterInsertMode()
        default:
            ()
        }
    }
    
}


// Operator Pending for KS Visual Mode
extension KindaVimEngine {
    
    func parseOperatorCommandForVisualModeUsingKeyboardStrategy() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
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
            post(ksVisualMode.ggForVisualStyleCharacterwise())
            
            enterVisualMode()
        case [.g, .j]:
            post(ksVisualMode.gjForVisualStyleCharacterwise())
            
            enterVisualMode()
        case [.g, .k]:
            post(ksVisualMode.gkForVisualStyleCharacterwise())
            
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
