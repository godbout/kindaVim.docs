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
    
    static var shared = KindaVimEngine()

    var toggleHazeOverWindow: Bool = true
    var showCharactersTyped: Bool = false
    
    private var lastKeyCombinationPressed: KeyCombination?
    
    private(set) var currentMode: VimEngineMode = .insert
    private(set) var operatorPendingBuffer = [KeyCombination]()
    
    var lastYankStyle: VimEngineMoveStyle = .characterwise
    var visualStyle: VimEngineMoveStyle = .characterwise
    
    var display = Display()
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

    
    private init() {
        print("engine started")
    }
    
    func handle(keyCombination: KeyCombination, enforceKeyboardStrategy: Bool = false) {
        if showCharactersTyped == true {
            display.showKeysTyped(lastBeing: keyCombination)
        }
        
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
        
        if toggleHazeOverWindow == true {
            display.hazeOver(.off)
        }
        
        if showCharactersTyped == true {
            display.fadeOutCharactersWindow()
        }
    }
    
    func enterNormalMode() {
        if currentMode == .insert, let element = asNormalMode.h(on: focusedTextElement) {
            _ = push(element: element)
        }
        
        currentMode = .normal
        resetOperatorPendingBuffer()
        
        if toggleHazeOverWindow == true {
            display.hazeOver(.on)
        }
    }
    
    func enterVisualMode() {
        currentMode = .visual
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

    func post(_ keyCombinations: [KeyCombination]) {
        keyboardStrategy.post(keyCombinations)
    }
 
    @discardableResult
    func push(element: AccessibilityTextElement) -> Bool {
        return accessibilityStrategy.push(element: element)
    }
    
}
