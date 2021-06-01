import Foundation

enum KeyCode: Int64, RawRepresentable {
    case a = 0
    case b = 11
    case c = 8
    case d = 2
    case e = 14
    case f = 3
    case g = 5
    case h = 4
    case i = 34
    case j = 38
    case k = 40
    case l = 37
    case m = 46
    case n = 45
    case o = 31
    case p = 35
    case q = 12
    case r = 15
    case s = 1
    case t = 17
    case u = 32
    case v = 9
    case w = 13
    case x = 7
    case y = 16
    case z = 6

    case zero = 29
    case one = 18
    case two = 19
    case three = 20
    case four = 21
    case five = 23
    case six = 22
    case seven = 26
    case eight = 28
    case nine = 25

    case backslash = 42
    case backtick = 50
    case comma = 43
    case delete = 51
    case dot = 47
    case down = 125
    case enter = 36
    case escape = 53
    case equal = 24
    case fnDown = 121
    case fnLeft = 115
    case fnRight = 119
    case fnUp = 116
    case left = 123
    case leftBracket = 33
    case minus = 27
    case right = 124
    case rightBracket = 30
    case semicolon = 41
    case singleQuote = 39
    case slash = 44
    case up = 126
}

enum KeyCombinationAction {
    case press
    case release
    case both
}

enum VimKey {
    // for dumping data
    case commandD
    
    case a, A
    case b
    case c, C
    case d, controlD

    case f, F

    case g, G
    case h
    case i, I
    case j
    case k
    case l

    case o, O

    case r, controlR
    case s
    case t

    case u, controlU

    case w

    case x, X
    case y

    case caret
    case doubleQuote
    case dollarSign

    // temporary for escape to enter Command Mode
    // and escape again to send escape key to macOS
    case escape

    // temporary for pressing enter in Command Mode
    // to act like an enter in Insert Mode
    // checking if it feels better (like in Alfred)
    case enter
    
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
    var character: Character {
        let cgEvent = KeyCombinationAdaptor.toCGEvents(from: self)
        
        var uniChar = UniChar()
        var length = 0
        cgEvent.first?.keyboardGetUnicodeString(maxStringLength: 1, actualStringLength: &length, unicodeString: &uniChar)
        
        return Character(UnicodeScalar(uniChar) ?? "?")        
    }
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
        case .d where control == false && option == false && shift == false && command == true:
            return .commandD
        case .f where control == false && option == false && shift == false && command == false:
            return .f
        case .f where control == false && option == false && shift == true && command == false:
            return .F
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
        case .r where control == false && option == false && shift == false && command == false:
            return .r
        case .r where control == true && option == false && shift == false && command == false:
            return .controlR
        case .s where control == false && option == false && shift == false && command == false:
            return .s
        case .t where control == false && option == false && shift == false && command == false:
            return .t
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
        // temporary for pressing enter in Command Mode
        // to act like an enter in Insert Mode
        // checking if it feels better (like in Alfred)
        case .enter where control == false && option == false && shift == false && command == false:
            return .enter
        case .four where control == false && option == false && shift == true && command == false:
            return .dollarSign
        case .minus where control == false && option == false && shift == true && command == false:
            return .underscore
        case .singleQuote where control == false && option == false && shift == true && command == false:
            return .doubleQuote
        case .six where control == false && option == false && shift == true && command == false:
            return .caret
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
