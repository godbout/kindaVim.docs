import Foundation
import AppKit
import SwiftUI
import KeyCombination


struct Display {

    private var hazeOverWindow = HazeOverWindow()
    enum HazeOverStatus {
        case on
        case off
    }
    
    private var charactersWindow = CharactersWindow()
    private static var  ongoingMove: String = ""
    
    
    func hazeOver(_ status: HazeOverStatus, fullScreenMode: HazeOverFullScreenMode = .auto) {
        switch status {
        case .on:
            hazeOverWindow.on(fullScreenMode: fullScreenMode)
        case .off:
            hazeOverWindow.off()
        }
    }
    
    func ongoingMove(add keyCombination: KeyCombination) {
        if keyCombination.control == true {
            Self.ongoingMove = "⌃"
        }
                
        if keyCombination.option == true {
            Self.ongoingMove.append("⌥")
        }
        
        if keyCombination.shift == true, needToShowShiftSymbol(for: keyCombination) {
            Self.ongoingMove.append("⇧")
        }
        
        if keyCombination.command == true {
            Self.ongoingMove.append("⌘")
        }

        switch keyCombination.key {
        case .downArrow:
            Self.ongoingMove.append("↓")
        case .delete:
            Self.ongoingMove.append("⌫")
        case .end:
            Self.ongoingMove.append("↘")
        case .escape:
            Self.ongoingMove.append("⎋")
        case .forwardDelete:
            Self.ongoingMove.append("⌦")
        case .home:
            Self.ongoingMove.append("↖")
        case .leftArrow:
            Self.ongoingMove.append("←")
        case .pageDown:
            Self.ongoingMove.append("⇟")
        case .pageUp:
            Self.ongoingMove.append("⇞")
        case .return:
            Self.ongoingMove.append("↵")
        case .rightArrow:
            Self.ongoingMove.append("→")
        case .space:
            Self.ongoingMove.append("␣")
        case .tab:
            if keyCombination.shift == false {
                Self.ongoingMove.append("⇥")
            } else {
                Self.ongoingMove.append("⇤")
            }
        case .upArrow:
            Self.ongoingMove.append("↑")
        default:
            Self.ongoingMove.append(keyCombination.character)
        }
    }
        
    private func needToShowShiftSymbol(for keyCombination: KeyCombination) -> Bool {
        [
            KeyCombination(key: .delete).character,
            KeyCombination(key: .downArrow).character,
            KeyCombination(key: .end).character,
            KeyCombination(key: .escape).character,
            KeyCombination(key: .forwardDelete).character,
            KeyCombination(key: .leftArrow).character,
            KeyCombination(key: .home).character,
            KeyCombination(key: .pageDown).character,
            KeyCombination(key: .pageUp).character,
            KeyCombination(key: .return).character,
            KeyCombination(key: .rightArrow).character,
            KeyCombination(key: .space).character,
            KeyCombination(key: .upArrow).character,
        ]
            .contains(keyCombination.character)
    }
    
    func showOngoingMove() {
        charactersWindow.show(Self.ongoingMove)
    }
    
    func resetOngoingMove() {
        Self.ongoingMove = ""
    }
    
    func fadeOutOngoingMove() {
        charactersWindow.hide()
    }
    
}
