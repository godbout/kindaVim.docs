import Foundation

enum KeyCode: Int64, RawRepresentable {
    // motions
    case j = 38
    case k = 40
    case h = 4
    case l = 37
    
    case i = 34
    
    case up = 126
    case down = 125
    case left = 123
    case right = 124
    
    case escape = 53
}

enum KeyCombinationAction {
    case press
    case release
}

struct KeyCombination {
    let key: KeyCode
    var command: Bool = false
    var option: Bool = false
    var control: Bool = false
    var fn: Bool = false
    var shift: Bool = false
    var action: KeyCombinationAction = .press
    
    init(key: KeyCode, command: Bool = false, option: Bool = false, control: Bool = false, fn: Bool = false, shift: Bool = false, action: KeyCombinationAction = .press) {
        self.key = key
        self.command = command
        self.option = option
        self.control = control
        self.fn = fn
        self.shift = shift
        self.action = action
    }
}

extension KeyCombination: Equatable {
    public static func == (lhs: KeyCombination, rhs: KeyCombination) -> Bool {
        lhs.key == rhs.key
            && lhs.command == rhs.command
            && lhs.option == rhs.option
            && lhs.control == rhs.control
            && lhs.fn == rhs.fn
            && lhs.shift == rhs.shift
            && lhs.action == rhs.action
    }
}

