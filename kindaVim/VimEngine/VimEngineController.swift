//
//  VimEngineController.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 23/04/2021.
//

import Foundation

enum VimEngineMode {
    case command
    case insert
    case operatorPending
}

class VimEngineController {
    
    static var shared = VimEngineController.init()
    var currentMode: VimEngineMode = .insert
    var operatorPendingBuffer = ""
    
    private init() {
        #if !TESTING
            _ = EventTapController.init()
        #endif
        
        print("engine started")
    }
    
    func transform(from original: KeyCombination) -> [KeyCombination] {
        if VimEngineController.shared.currentMode != .operatorPending {
            switch original.key {
            case .c where original.shift == false:
                VimEngineController.shared.enterOperatorPendingMode(with: "c")
                
                return []
            case .c where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
                return [
                    KeyCombination(key: .right, command: true, shift: true, action: .press),
                    KeyCombination(key: .right, command: true, shift: true, action: .release),
                    KeyCombination(key: .delete, action: .press),
                    KeyCombination(key: .delete, action: .release)
                ]
            case .g where original.shift == false:
                VimEngineController.shared.enterOperatorPendingMode(with: "g")
                
                return []
            case .x where original.shift == false:
                // using right and delete because maskSecondaryFn does not seem
                // to work when posting CGEvents. will fill a Radar bug with Apple
                return [
                    KeyCombination(key: .right, action: .press),
                    KeyCombination(key: .right, action: .release),
                    KeyCombination(key: .delete, action: .press),
                    KeyCombination(key: .delete, action: .release)
                ]
            case .x where original.shift == true:
                return [
                    KeyCombination(key: .delete, action: .press),
                    KeyCombination(key: .delete, action: .release)
                ]
            case .b where original.shift == false:
                return [
                    KeyCombination(key: .left, option: true, action: .press),
                    KeyCombination(key: .left, option: true, action: .release)
                ]
            case .r:
                return [
                    KeyCombination(key: .z, command: true, shift: true, action: .press),
                    KeyCombination(key: .z, command: true, shift: true, action: .release),
                ]
            case .u:
                return [
                    KeyCombination(key: .z, command: true, action: .press),
                    KeyCombination(key: .z, command: true, action: .release),
                ]
            case .o where original.shift == false:
                VimEngineController.shared.enterInsertMode()
                
                return [
                    KeyCombination(key: .right, command: true, action: .press),
                    KeyCombination(key: .right, command: true, action: .release),
                    KeyCombination(key: .enter, action: .press),
                    KeyCombination(key: .enter, action: .release)
                ]
            case .o where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
                return [
                    KeyCombination(key: .up, action: .press),
                    KeyCombination(key: .up, action: .release),
                    KeyCombination(key: .right, command: true, action: .press),
                    KeyCombination(key: .right, command: true, action: .release),
                    KeyCombination(key: .enter, action: .press),
                    KeyCombination(key: .enter, action: .release)
                ]
            case .i where original.shift == false:
                VimEngineController.shared.enterInsertMode()

                return []
            case .i where original.shift == true:
                VimEngineController.shared.enterInsertMode()

                return [
                    KeyCombination(key: .left, command: true, action: .press),
                    KeyCombination(key: .left, command: true, action: .release)
                ]
            case .a where original.shift == false:
                VimEngineController.shared.enterInsertMode()
                
                return [
                    KeyCombination(key: .right, action: .press),
                    KeyCombination(key: .right, action: .release)
                ]
            case .a where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
                return [
                    KeyCombination(key: .right, command: true, action: .press),
                    KeyCombination(key: .right, command: true, action: .release)
                ]
            case .j:
                return [
                    KeyCombination(key: .down, action: .press),
                    KeyCombination(key: .down, action: .release)
                ]
            case .k:
                return [
                    KeyCombination(key: .up, action: .press),
                    KeyCombination(key: .up, action: .release)
                ]
            case .h:
                return [
                    KeyCombination(key: .left, action: .press),
                    KeyCombination(key: .left, action: .release)
                ]
            case .l:
                return [
                    KeyCombination(key: .right, action: .press),
                    KeyCombination(key: .right, action: .release)
                ]
            default:
                return [original]
            }
        } else {
            switch original.key {
            case .c:
                operatorPendingBuffer.append("c")
            case .g:
                operatorPendingBuffer.append("g")
            default:
                ()
            }
            
            return operatorCommand()
        }
    }
    
    private func operatorCommand() -> [KeyCombination] {
        switch operatorPendingBuffer {
        case "cc":
            VimEngineController.shared.enterInsertMode()
            
            return [
                KeyCombination(key: .right, command: true, action: .press),
                KeyCombination(key: .right, command: true, action: .release),
                KeyCombination(key: .left, command: true, shift: true, action: .press),
                KeyCombination(key: .left, command: true, shift: true, action: .release),
                KeyCombination(key: .delete, action: .press),
                KeyCombination(key: .delete, action: .release)                
            ]
        case "gg":
            VimEngineController.shared.enterCommandMode()
            
            return [
                KeyCombination(key: .up, command: true, action: .press),
                KeyCombination(key: .up, command: true, action: .release)
            ]
        default:
            VimEngineController.shared.enterCommandMode()
            
            return []
        }        
    }
    
    func enterCommandMode() {
        currentMode = .command
        resetOperatorPendingBuffer()

        barbaricallyTintDisplay()
    }


    func enterInsertMode() {
        currentMode = .insert
        resetOperatorPendingBuffer()

        barbaricallyResetDisplayTint()
    }
    
    private func resetOperatorPendingBuffer() {
        operatorPendingBuffer = ""
    }
    
    private func enterOperatorPendingMode(with operator: String) {
        currentMode = .operatorPending
        operatorPendingBuffer.append(`operator`)
    }

    func barbaricallyTintDisplay() {
        let mainDisplayID = CGMainDisplayID()

        var redTable: [CGGammaValue] = [0.05, 0.7]
        var greenTable: [CGGammaValue] = [0.05, 0.7]
        var blueTable: [CGGammaValue] = [0.05, 0.7]

        CGSetDisplayTransferByTable(mainDisplayID, 2, &redTable, &greenTable, &blueTable)
    }

    func barbaricallyResetDisplayTint() {
        // barbaric for now yes
        CGDisplayRestoreColorSyncSettings()
    }
    
}
