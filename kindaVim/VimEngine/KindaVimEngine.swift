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


enum AppMode {
    
    case auto
    case off
    case pgR
    case keyMapping
    
}


class KindaVimEngine {
    
    var toggleHazeOverWindow: Bool = true
    var toggleMenuBarIcon: Bool = false
    var showCharactersTyped: Bool = false
    var jkMapping: Bool = true
    
    private(set) var currentMode: VimEngineMode = .insert
    
    private(set) var firstCountBuffer: String = ""
    private(set) var secondCountBuffer: String = ""
    var count: Int? {
        let firstCount = Int(firstCountBuffer)
        let secondCount = Int(secondCountBuffer)
        
        switch (firstCount, secondCount) {
        case (.none, .none):
            return nil
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
    var axEngine: AXEngineProtocol
    var inputFieldObserver: InputFieldObserver
    
    var focusedElementType: ElementType {
        // this is used only for KS to detect if it's TE or NTE
        // hence we can't use focusedTextElement coz it's nil (no AS).
        switch axEngine.axRole(of: axEngine.axFocusedElement()) {
        case .comboBox, .textField, .textArea, .scrollArea, .webArea:
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
    var commandLineMode: CommandLineModeProtocol = CommandLineMode()
       
    init(axEngine: AXEngine = AXEngine(), inputFieldObserver: InputFieldObserver = InputFieldObserver()) {
        self.axEngine = axEngine
        self.inputFieldObserver = inputFieldObserver
    }
    

    func handle(keyCombination: KeyCombination, appMode: AppMode = .auto) {
        #if DEBUG
        if showCharactersTyped == true {
            display.ongoingMove(add: keyCombination)
            display.showOngoingMove()
        }
        #endif
        
        // before sending the key combination down the rabbit hole we need to check first
        // if it's a digit and if this digit will be used for counts. in that case the digit
        // is not used for a move so we don't send it. else it is (like for example `r5`) and we do.
        if grabDigitForCounts(keyCombination: keyCombination) == false {
            switch currentMode {
            case .normal:
                if appMode == .keyMapping {
                    handleNormalMode(using: .keyboardStrategy, for: keyCombination)
                } else {
                    handleNormalMode(using: .accessibilityStrategy, for: keyCombination, appMode: appMode)
                }
            case .operatorPendingForNormalMode:
                if appMode == .keyMapping {
                    handleOperatorPendingForNormalMode(using: .keyboardStrategy, for: keyCombination)
                } else {
                    handleOperatorPendingForNormalMode(using: .accessibilityStrategy, for: keyCombination, appMode: appMode)
                }
            case .visual:
                if appMode == .keyMapping {
                    handleVisualMode(using: .keyboardStrategy, for: keyCombination)
                } else {
                    handleVisualMode(using: .accessibilityStrategy, for: keyCombination, appMode: appMode)
                }
            case .operatorPendingForVisualMode:
                if appMode == .keyMapping {
                    handleOperatorPendingForVisualMode(using: .keyboardStrategy, for: keyCombination)
                } else {
                    handleOperatorPendingForVisualMode(using: .accessibilityStrategy, for: keyCombination)
                }
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
    
    private func handleNormalMode(using strategy: VimEngineStrategy, for keyCombination: KeyCombination, appMode: AppMode = .auto) {
        switch strategy {
        case .accessibilityStrategy:
            tryHandlingNormalModeUsingAccessibilityStrategyFirst(for: keyCombination, appMode: appMode)
        case .keyboardStrategy:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        }        
    }
    
    private func handleOperatorPendingForNormalMode(using strategy: VimEngineStrategy, for keyCombination: KeyCombination, appMode: AppMode = .auto) {
        operatorPendingBuffer.append(keyCombination)
        
        switch strategy {
        case .accessibilityStrategy:
            tryParsingOperatorCommandForNormalModeUsingAccessibilityStrategyFirst(appMode: appMode)
        case .keyboardStrategy:
            parseOperatorCommandForNormalModeUsingKeyboardStrategy()
        }
        
        if currentMode != .operatorPendingForNormalMode {
            resetOperatorPendingBuffer()
        }
    }
    
    private func handleVisualMode(using strategy: VimEngineStrategy, for keyCombination: KeyCombination, appMode: AppMode = .auto) {
        switch strategy {
        case .accessibilityStrategy:
            tryHandlingVisualModeUsingAccessibilityStrategyFirst(for: keyCombination, appMode: appMode)
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
        endCurrentMove()
        currentMode = .insert
        
        if toggleHazeOverWindow == true {
            display.hazeOver(.off)
        }
              
        // currently we duplicate the code at start, in the statusBarController, in the Settings...
        // we should have some kind of observer here, like some Combine shit? need to investigate.
        if toggleMenuBarIcon == true {
            statusItem?.button?.image = NSImage(named: "MenuBarIconEmpty")
        }
                
        inputFieldObserver.stopObserving()
        
        #if DEBUG
        if showCharactersTyped == true {
            display.fadeOutOngoingMove()
        }
        #endif
    }
    
    func enterNormalMode(appMode: AppMode = .auto) {
        endCurrentMove()
        
        if currentMode == .insert {
            goBackOneCharacterForTextElements(appMode: appMode)
        }
        
        currentMode = .normal        
        
        if toggleHazeOverWindow == true {
            display.hazeOver(.on)
        }
        
        // same as a bit above.
        if toggleMenuBarIcon == true {
            statusItem?.button?.image = NSImage(named: "MenuBarIconFull")
        }
    }
        
    private func goBackOneCharacterForTextElements(appMode: AppMode) {
        switch (focusedElementType, appMode) {
        case (.textElement, .keyMapping):
            post(ksNormalMode.h())
        case (.textElement, _):
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
        endCurrentMove()
        currentMode = .visual
    }
    
    func endCurrentMove() {        
        resetOperatorPendingBuffer()
        resetCountBuffers()
        display.resetOngoingMove()
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
        
    private func resetCountBuffers() {
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
