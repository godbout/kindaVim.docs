import Foundation

enum KeyCode: Int64, RawRepresentable {
    case a = 0
    case b = 11
    case c = 8
    case d = 2
    case e = 14

    case g = 5
    case h = 4
    case i = 34
    case j = 38
    case k = 40
    case l = 37

    case o = 31

    case r = 15
    case u = 32

    case w = 13

    case x = 7
    case y = 16
    case z = 6

    case delete = 51
    case down = 125
    case enter = 36
    case escape = 53
    case four = 21
    case left = 123
    case minus = 27
    case right = 124
    case up = 126
    case zero = 29
    
    case fnUp = 116
    case fnDown = 121
}

enum KeyCombinationAction {
    case press
    case release
    case both
}

enum VimKey {
    case a, A
    case b
    case c, C
    case d
    case controlD

    case g, G
    case h
    case i, I
    case j
    case k
    case l

    case o, O

    case controlR

    case u
    case controlU

    case w

    case x, X
    case y

    case dollarSign

    // temporary for escape to enter Command Mode
    // and escape again to send escape key to macOS
    case escape
    
    case underscore
    case zero
}

struct KeyCombination {
    let vimKey: VimKey?
    let key: KeyCode
    var command: Bool = false
    var option: Bool = false
    var control: Bool = false
    var shift: Bool = false
    var action: KeyCombinationAction = .both
    
    init(key: KeyCode, control: Bool = false, option: Bool = false, shift: Bool = false, command: Bool = false, action: KeyCombinationAction = .both) {
        self.key = key
        self.control = control
        self.option = option
        self.shift = shift
        self.command = command
        self.action = action

        self.vimKey = Self.vimKeyFrom(key: key, control: control, option: option, shift: shift, command: command)
    }

    private static func vimKeyFrom(key: KeyCode, control: Bool, option: Bool, shift: Bool, command: Bool) -> VimKey? {
        switch key {
        case .a where control == false && option == false && shift == false && command == false:
            return .a
        case .a where control == false && option == false && shift == true && command == false:
            return .A
        case .b where control == false && option == false && shift == false && command == false:
            return .b
        case .c where control == false && option == false && shift == false && command == false:
            return .c
        case .c where control == false && option == false && shift == true && command == false:
            return .C
        case .d where control == false && option == false && shift == false && command == false:
            return .d
        case .d where control == true && option == false && shift == false && command == false:
            return .controlD
        case .g where control == false && option == false && shift == false && command == false:
            return .g
        case .g where control == false && option == false && shift == true && command == false:
            return .G
        case .h where control == false && option == false && shift == false && command == false:
            return .h
        case .i where control == false && option == false && shift == false && command == false:
            return .i
        case .i where control == false && option == false && shift == true && command == false:
            return .I
        case .j where control == false && option == false && shift == false && command == false:
            return .j
        case .k where control == false && option == false && shift == false && command == false:
            return .k
        case .l where control == false && option == false && shift == false && command == false:
            return .l
        case .o where control == false && option == false && shift == false && command == false:
            return .o
        case .o where control == false && option == false && shift == true && command == false:
            return .O
        case .r where control == true && option == false && shift == false && command == false:
            return .controlR
        case .u where control == false && option == false && shift == false && command == false:
            return .u
        case .u where control == true && option == false && shift == false && command == false:
            return .controlU
        case .w where control == false && option == false && shift == false && command == false:
            return .w
        case .x where control == false && option == false && shift == false && command == false:
            return .x
        case .x where control == false && option == false && shift == true && command == false:
            return .X
        case .y where control == false && option == false && shift == false && command == false:
            return .y
        // temporary for escape to enter Command Mode
        // and escape again to send escape key to macOS
        case .escape where control == false && option == false && shift == false && command == false:
            return .escape
        case .four where control == false && option == false && shift == true && command == false:
            return .dollarSign
        case .minus where control == false && option == false && shift == true && command == false:
            return .underscore
        case .zero where control == false && option == false && shift == false && command == false:
            return .zero
        default:
            return nil
        }
    }
}

extension KeyCombination: Equatable {
    public static func == (lhs: KeyCombination, rhs: KeyCombination) -> Bool {
        lhs.vimKey == rhs.vimKey
            && lhs.key == rhs.key
            && lhs.command == rhs.command
            && lhs.option == rhs.option
            && lhs.control == rhs.control
            && lhs.shift == rhs.shift
            && lhs.action == rhs.action
    }
}
