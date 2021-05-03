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

    case g, G
    case h
    case i, I
    case j
    case k
    case l

    case o, O

    case controlR

    case u

    case w

    case x, X

    case dollarSign
    case underscore
    case zero
}

struct KeyCombination {
    let vimKey: VimKey?
    let key: KeyCode
    var command: Bool = false
    var option: Bool = false
    var control: Bool = false
    var fn: Bool = false
    var shift: Bool = false
    var action: KeyCombinationAction = .both
    
    init(key: KeyCode, command: Bool = false, option: Bool = false, control: Bool = false, fn: Bool = false, shift: Bool = false, action: KeyCombinationAction = .both) {
        self.key = key
        self.command = command
        self.option = option
        self.control = control
        self.fn = fn
        self.shift = shift
        self.action = action

        self.vimKey = Self.vimKeyFrom(key: key, control: control, option: option, shift: shift, command: command)
    }

    private static func vimKeyFrom(key: KeyCode, control: Bool, option: Bool, shift: Bool, command: Bool) -> VimKey? {
        switch key {
        case .a where shift == false:
            return .a
        case .a where shift == true:
            return .A
        case .b where shift == false:
            return .b
        case .c where shift == false:
            return .c
        case .c where shift == true:
            return .C
        case .d where shift == false:
            return .d
        case .g where shift == false:
            return .g
        case .g where shift == true:
            return .G
        case .h where shift == false:
            return .h
        case .i where shift == false:
            return .i
        case .i where shift == true:
            return .I
        case .j where shift == false:
            return .j
        case .k where shift == false:
            return .k
        case .l where shift == false:
            return .l
        case .o where shift == false:
            return .o
        case .o where shift == true:
            return .O
        case .r where control == true:
            return .controlR
        case .u where shift == false:
            return .u
        case .w where shift == false:
            return .w
        case .x where shift == false:
            return .x
        case .x where shift == true:
            return .X
        case .four where shift == true:
            return .dollarSign
        case .minus where shift == true:
            return .underscore
        case .zero where shift == false:
            return .zero

        default:
            return nil
        }
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

