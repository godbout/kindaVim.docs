import AppKit
import Foundation
import KeyCombination
import KeyboardStrategy
import AccessibilityStrategy
import AXEngine


enum VimEngineMode {
    
    case insert
    case normal
    case operatorPendingForNormalMode
    case visual
    case operatorPendingForVisualMode
    
}


enum VimEngineStrategy {
    
    case keyboardStrategy
    case accessibilityStrategy
    
}


class KindaVimEngine {
    
    var toggleHazeOverWindow: Bool = true
    var toggleMenuBarIcon: Bool = false
    var showCharactersTyped: Bool = false
    var jkMapping: Bool = true
    
    private(set) var currentMode: VimEngineMode = .insert
    
    private(set) var firstCountBuffer: String = ""
    private(set) var secondCountBuffer: String = ""
    var count: Int {
        let firstCount = Int(firstCountBuffer)
        let secondCount = Int(secondCountBuffer)
        
        switch (firstCount, secondCount) {
        case (.none, .none):
            return 1
        case (.some, .none):
            return firstCount!
        case (.none, .some):
            return secondCount!
        case (.some, .some):
            return firstCount! * secondCount!
        }
    }
    
    private(set) var operatorPendingBuffer = [KeyCombination]()
    
    var lastYankStyle: VimEngineMoveStyle = .characterwise
    var visualStyle: VimEngineMoveStyle = .characterwise
    
    var display = Display()
    var statusItem: NSStatusItem?
    var axEngine: AXEngineProtocol = AXEngine()
    
    var focusedElementType: ElementType {
        switch axEngine.axRole() {
        case .textField, .textArea, .scrollArea, .webArea:
            return .textElement
        default:
            return .nonTextElement
        }
    }
    var focusedTextElement: AccessibilityTextElement? {
        accessibilityStrategy.focusedTextElement()
    }
        
    var keyboardStrategy: KeyboardStrategyProtocol = KeyboardStrategy()
    var ksNormalMode: KeyboardStrategyNormalModeProtocol = KeyboardStrategyNormalMode()
    var ksVisualMode: KeyboardStrategyVisualModeProtocol = KeyboardStrategyVisualMode()
    var accessibilityStrategy: AccessibilityStrategyProtocol = AccessibilityStrategy()
    var asNormalMode: AccessibilityStrategyNormalModeProtocol = AccessibilityStrategyNormalMode()
    var asVisualMode: AccessibilityStrategyVisualModeProtocol = AccessibilityStrategyVisualMode()

    
    func handle(keyCombination: KeyCombination, enforceKeyboardStrategy: Bool = false) {
        if showCharactersTyped == true {
            display.showKeysTyped(lastBeing: keyCombination)
        }
        
        // before sending the key combination down the rabbit hole we need to check first
        // if it's a digit and if this digit will be used for counts. in that case the digit
        // is not used for a move so we don't send it. else it is (like for example `r5`) and we do.
        if grabDigitForCounts(keyCombination: keyCombination) == false {
            switch (currentMode, enforceKeyboardStrategy) {
            case (.normal, false):
                handleNormalMode(using: .accessibilityStrategy, for: keyCombination)
            case (.normal, true):
                handleNormalMode(using: .keyboardStrategy, for: keyCombination)
            case (.operatorPendingForNormalMode, false):
                handleOperatorPendingForNormalMode(using: .accessibilityStrategy, for: keyCombination)
            case (.operatorPendingForNormalMode, true):
                handleOperatorPendingForNormalMode(using: .keyboardStrategy, for: keyCombination)
            case (.visual, false):
                handleVisualMode(using: .accessibilityStrategy, for: keyCombination)
            case (.visual, true):
                handleVisualMode(using: .keyboardStrategy, for: keyCombination)
            case (.operatorPendingForVisualMode, false):
                handleOperatorPendingForVisualMode(using: .accessibilityStrategy, for: keyCombination)
            case (.operatorPendingForVisualMode, true):
                handleOperatorPendingForVisualMode(using: .keyboardStrategy, for: keyCombination)
            default:
                ()
            }
        }
    }
        
    private func grabDigitForCounts(keyCombination: KeyCombination) -> Bool {
        switch keyCombination.vimKey {
        // 0 is special. if used after another digit, it's part of the count.
        // if not, then it's a Vim move. we send back false when it's a Vim move
        // so that it's treated as such.
        case .zero:
            if theDigitIsBeforeAVimMove() {
                guard !firstCountBuffer.isEmpty else { return false }
                
                firstCountBuffer.append("0")
                
                return true
            }
            
            if theDigitIsBetweenAnOperatorAndItsRelativeMotion() {
                guard !secondCountBuffer.isEmpty else { return false }
                
                secondCountBuffer.append("0")
                
                return true
            }
                        
            return false
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            if theDigitIsBeforeAVimMove() {
                firstCountBuffer.append(keyCombination.vimKey!.rawValue)
                            
                return true
            }
            
            if theDigitIsBetweenAnOperatorAndItsRelativeMotion() {
                secondCountBuffer.append(keyCombination.vimKey!.rawValue)
                            
                return true
            }
                        
            return false
        default:
            return false
        }
    }
    
    private func theDigitIsBeforeAVimMove() -> Bool {
        return operatorPendingBuffer.isEmpty
    }
        
    private func theDigitIsBetweenAnOperatorAndItsRelativeMotion() -> Bool {
        // dirty for now. there are actually `operators` that are more
        // than one key, like `g~`, `gu`, `gU` etc. if we handle those one day
        // then the code below (and probably more) needs to change.
        // also we may move the Vim Operators in some sort of Constant struct or enum.
        let vimOperators = [
            VimKey.c,
            VimKey.d,
            VimKey.y,
            VimKey.leftChevron,
            VimKey.rightChevron,
        ]
        
        guard let vimKey = operatorPendingBuffer.last?.vimKey else { return false }
        
        return vimOperators.contains(vimKey)
    }
    
    private func handleNormalMode(using strategy: VimEngineStrategy, for keyCombination: KeyCombination) {
        switch strategy {
        case .accessibilityStrategy:
            tryHandlingNormalModeUsingAccessibilityStrategyFirst(for: keyCombination)
        case .keyboardStrategy:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        }        
    }
    
    private func handleOperatorPendingForNormalMode(using strategy: VimEngineStrategy, for keyCombination: KeyCombination) {
        operatorPendingBuffer.append(keyCombination)
        
        switch strategy {
        case .accessibilityStrategy:
            tryParsingOperatorCommandForNormalModeUsingAccessibilityStrategyFirst()
        case .keyboardStrategy:
            parseOperatorCommandForNormalModeUsingKeyboardStrategy()
        }
        
        if currentMode != .operatorPendingForNormalMode {
            resetOperatorPendingBuffer()
        }
    }
    
    private func handleVisualMode(using strategy: VimEngineStrategy, for keyCombination: KeyCombination) {
        switch strategy {
        case .accessibilityStrategy:
            tryHandlingVisualModeUsingAccessibilityStrategyFirst(for: keyCombination)
        case .keyboardStrategy:
            handleVisualModeUsingKeyboardStrategy(for: keyCombination)
        }
    }
    
    func handleOperatorPendingForVisualMode(using strategy: VimEngineStrategy, for keyCombination: KeyCombination) {
        operatorPendingBuffer.append(keyCombination)
        
        switch strategy {
        case .accessibilityStrategy:
            tryParsingOperatorCommandForVisualModeUsingAccessibilityStrategyFirst()
        case .keyboardStrategy:
            parseOperatorCommandForVisualModeUsingKeyboardStrategy()
        }
        
        if currentMode != .operatorPendingForVisualMode {
            resetOperatorPendingBuffer()
        }
    }
    
    func enterInsertMode() {
        currentMode = .insert
        resetOperatorPendingBuffer()
        resetCountBuffers()
        
        if toggleHazeOverWindow == true {
            display.hazeOver(.off)
        }
              
        // currently we duplicate the code at start, in the statusBarController, in the Settings...
        // we should have some kind of observer here, like some Combine shit? need to investigate.
        if toggleMenuBarIcon == true {
            statusItem?.button?.image = NSImage(named: "MenuBarIconEmpty")
        }
        
        if showCharactersTyped == true {
            display.fadeOutCharactersWindow()
        }
    }
    
    func enterNormalMode(enforceKeyboardStrategy: Bool = false) {
        if currentMode == .insert {
            goBackOneCharacterForTextElements(enforceKeyboardStrategy: enforceKeyboardStrategy)
        }
        
        currentMode = .normal
        resetOperatorPendingBuffer()
        resetCountBuffers()
        
        if toggleHazeOverWindow == true {
            display.hazeOver(.on)
        }
        
        // same as a bit above.
        if toggleMenuBarIcon == true {
            statusItem?.button?.image = NSImage(named: "MenuBarIconFull")
        }
    }
        
    private func goBackOneCharacterForTextElements(enforceKeyboardStrategy: Bool) {
        switch (focusedElementType, enforceKeyboardStrategy) {
        case (.textElement, true):
            post(ksNormalMode.h())
        case (.textElement, false):
            if let element = asNormalMode.h(on: focusedTextElement) {
                _ = push(element: element)
            } else {
                post(ksNormalMode.h())
            }
        default:
            ()
        }
    }
    
    func enterVisualMode() {
        currentMode = .visual
        resetCountBuffers()
    }
    
    func enterOperatorPendingForNormalMode(with keyCombination: KeyCombination) {
        currentMode = .operatorPendingForNormalMode
        operatorPendingBuffer.append(keyCombination)
    }
    
    func enterOperatorPendingForVisualMode(with keyCombination: KeyCombination) {
        currentMode = .operatorPendingForVisualMode
        operatorPendingBuffer.append(keyCombination)
    }
    
    private func resetOperatorPendingBuffer() {
        operatorPendingBuffer = []
    }
        
    func resetCountBuffers() {
        firstCountBuffer = ""
        secondCountBuffer = ""
    }

    func post(_ keyCombinations: [KeyCombination]) {
        keyboardStrategy.post(keyCombinations)
    }
 
    @discardableResult
    func push(element: AccessibilityTextElement) -> Bool {
        return accessibilityStrategy.push(element: element)
    }
    
}
