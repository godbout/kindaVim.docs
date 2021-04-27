import Foundation

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

enum KeyCode: Int64, RawRepresentable {
    case j = 38
    case k = 40
    case up = 126
    case down = 125
}

enum KeyCombinationAction {
    case press
    case release
}
