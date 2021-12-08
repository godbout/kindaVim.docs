<div align="center">
    <img src="https://github.com/godbout/kindaVim.theapp/blob/master/assets/icon.png">
    <h1>brings Vim moves to macOS input fields. and a bit more.</h1>
</div>

![awesome stuff happening in there](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/gif.gif "hehe")

---

# WHY

brain space and energy are limited. why learning six hundred thousand new keyboard shortcuts when you can use Vim moves everywhere. also macOS is widely inconsistent like sometimes you can go up and down with ctrl+n/ctrl+p but also sometimes not. even in Apple's own apps. so jk FTW.

and also it's fucking cool.

# LOVED THE GIF?

maybe [watch the videos](https://www.youtube.com/channel/UC3ZP3QFMhNn3ivJgqoEW4Ug) first if you're not sure you wanna read further.

# HOW DOES IT WORK

by default kindaVim runs in `Auto Mode` and tries to read the text of the app focused:

1. if it can read and modify the text, it uses the [kV Accessibility Strategy](#user-content-kv-accessibility-strategy). theoritically you can have a full Vim experience. pragmatically some stuff will currently be missing so please [ask](https://github.com/godbout/kindaVim.theapp/issues/new) for what you need!
2. if it can't read the text, it uses the [kV Keyboard Strategy](#user-content-kv-keyboard-strategy) and tries to impersonate Vim through key remapping. it's a little more wonky than the kV Accessibility Strategy.

in the `Preferences` you can also:
* ask kindaVim to ignore any app completely
* bypass macOS Accessibility restrictions with the `PG-R` Mode for apps where you can read the text but not modify it. you'll experience this mostly in browsers
* enforce the [kV Keyboard Strategy](#user-content-kv-keyboard-strategy) for big fat liars apps that tell you they're implementing the macOS Accessibility but actually no no (all Electron apps)

# WAIT A MINUTE. WHAT DATA DO YOU STEAL???

to do its magic kindaVim needs to read/write text, and capture/forward key presses. so technically yes, i could steal your girlfriend's (or boyfriend's) phone number. but the app is [notarized by Apple](https://developer.apple.com/documentation/security/notarizing_macos_software_before_distribution), which means they've checked it and agreed i'm a good boy.

also honestly i personally don't give a single flying fuck about data. that's noise to me. i don't even track the [kindaVim.app](https://kindavim.app) website. i want to use my time and energy to create great products, and i truly believe that it'll be enough. yes. i'm that dumb.

# HOW 'BOUT THE MONEY

kindaVim will be a subscription of one ☕️ (USD$3) a month. the beta is free and contains the full set of features. i have no idea when i'll drop the beta. the beta may last 10 years. who knows. or maybe till 2047.

# CURRENT VIM IMPLEMENTATION

## kV Accessibility Strategy

(P.S.: the Unit and UI Tests for the Accessibility Strategy are now [open source](https://github.com/godbout/AccessibilityStrategyTestApp).)

| Normal Mode | including count |
| :---: | :---: | 
| _ | ❌️ | 
| [( | ❌️ | 
| [{ | ❌️ | 
| ]) | ❌️ | 
| ]} | ❌️ | 
| { | ❌️ | 
| } | ❌️ | 
| % | ❌️ | 
| ^ | ❌️ | 
| << | ❌️ | 
| >> | ❌️ | 
| $ | ❌️ | 
| 0 | ❌️ | 
| A | ❌️ | 
| a | ❌️ | 
| B | ❌️ | 
| b | ❌️ | 
| C | ❌️ | 
| caw | ❌️ | 
| cc | ❌️ | 
| cF | ❌️ | 
| cf | ✅️ | 
| cG | ❌️ | 
| cgg | ❌️ | 
| ci' | ❌️ | 
| ci" | ❌️ | 
| ci( | ❌️ | 
| ci) | ❌️ | 
| ci[ | ❌️ | 
| ci] | ❌️ | 
| ci{ | ❌️ | 
| ci} | ❌️ | 
| ci` | ❌️ | 
| ciw | ❌️ | 
| control r | ❌️ | 
| cT | ❌️ | 
| ct | ✅️ | 
| D | ❌️ | 
| daw | ❌️ | 
| dd | ❌️ | 
| dF | ❌️ | 
| df | ❌️ | 
| dG | ❌️ | 
| dgg | ❌️ | 
| dj | ❌️ | 
| dk | ❌️ | 
| dT | ❌️ | 
| dt | ❌️ | 
| E | ❌️ | 
| e | ❌️ | 
| F | ❌️ | 
| f | ✅️ | 
| G | ❌️ | 
| g_ | ❌️ | 
| g^ | ❌️ | 
| g$ | ❌️ | 
| g0 | ❌️ | 
| gE | ❌️ | 
| ge | ❌️ | 
| gg | ❌️ | 
| gI | ❌️ | 
| gj | ❌️ | 
| gk | ❌️ | 
| h | ❌️ | 
| I | ❌️ | 
| i | ❌️ | 
| j | ❌️ | 
| k | ❌️ | 
| l | ✅️ | 
| O | ❌️ | 
| o | ❌️ | 
| P | ❌️ | 
| p | ❌️ | 
| r | ❌️ | 
| T | ❌️ | 
| t | ✅️ | 
| u | ❌️ | 
| W | ❌️ | 
| w | ❌️ | 
| x | ❌️ | 
| yF | ❌️ | 
| yf | ❌️ | 
| yi' | ❌️ | 
| yi" | ❌️ | 
| yi( | ❌️ | 
| yi) | ❌️ | 
| yi[ | ❌️ | 
| yi] | ❌️ | 
| yi{ | ❌️ | 
| yi} | ❌️ | 
| yi` | ❌️ | 
| yiw | ❌️ | 
| yT | ❌️ | 
| yt | ❌️ | 
| yy | ❌️ | 

| Visual Mode | including count |
| :---: | :---: |
| _ | ❌️ |
| ^ | ❌️ |
| $ | ❌️ |
| 0 | ❌️ |
| B | ❌️ |
| b | ❌️ |
| c | ❌️ |
| d | ❌️ |
| E | ❌️ |
| e | ❌️ |
| F | ❌️ |
| f | ❌️ |
| G | ❌️ |
| g^ | ❌️ |
| g$ | ❌️ |
| g0 | ❌️ |
| gE | ❌️ |
| ge | ❌️ |
| gg | ❌️ |
| gI | ❌️ |
| gj | ❌️ |
| gk | ❌️ |
| h | ❌️ |
| iw | ❌️ |
| j | ❌️ |
| k | ❌️ |
| l | ❌️ |
| o | ❌️ |
| T | ❌️ |
| t | ❌️ |
| V | ❌️ |
| v | ❌️ |
| W | ❌️ |
| w | ❌️ |
| y | ❌️ |

## kV Keyboard Strategy

| Normal Mode | including count |
| :---: | :---: |
| _ | ❌️ |
| ^ | ❌️ |
| $ | ❌️ |
| 0 | ❌️ |
| A | ❌️ |
| a | ❌️ |
| b | ❌️ |
| C | ❌️ |
| cb | ❌️ |
| cc | ❌️ |
| cG | ❌️ |
| cgg | ❌️ |
| ciw | ❌️ |
| control d | ❌️ |
| control r | ❌️ |
| control u | ❌️ |
| D | ❌️ |
| db | ❌️ |
| dd | ❌️ |
| dG | ❌️ |
| dgg | ❌️ |
| dj | ❌️ |
| dk | ❌️ |
| e | ❌️ |
| G | ❌️ |
| g_ | ❌️ |
| g^ | ❌️ |
| g$ | ❌️ |
| g0 | ❌️ |
| ge | ❌️ |
| gg | ❌️ |
| gI | ❌️ |
| gj | ❌️ |
| gk | ❌️ |
| h | ❌️ |
| l | ✅️ |
| i | ❌️ |
| j | ❌️ |
| k | ❌️ |
| l | ❌️ |
| O | ❌️ |
| o | ❌️ |
| P | ❌️ |
| p | ❌️ |
| r | ❌️ |
| s | ❌️ |
| u | ❌️ |
| w | ❌️ |
| X | ❌️ |
| x | ❌️ |
| yiw | ❌️ |
| yy | ❌️ |

| Visual Mode | including count |
| :---: | :---: |
| _ | ❌️ |
| ^ | ❌️ |
| $ | ❌️ |
| 0 | ❌️ |
| b | ❌️ |
| c | ❌️ |
| d | ❌️ |
| e | ❌️ |
| G | ❌️ |
| g^ | ❌️ |
| g$ | ❌️ |
| g0 | ❌️ |
| ge | ❌️ |
| gg | ❌️ |
| gI | ❌️ |
| gj | ❌️ |
| gk | ❌️ |
| h | ❌️ |
| j | ❌️ |
| k | ❌️ |
| l | ❌️ |
| V | ❌️ |
| v | ❌️ |
| w | ❌️ |
| y | ❌️ |

lol those tables.

# ROADMAP
* add a plethora of missing Vim moves ([ask!](https://github.com/godbout/kindaVim.theapp/issues/new))
* update all moves to support new global count system ([ask!](https://github.com/godbout/kindaVim.theapp/issues/new))
* better handling of Electron shit apps

# KNOWN ISSUES

* issues regarding End User Experience will be reported here: https://github.com/godbout/kindaVim.theapp/issues

kindaVim uses the macOS Accessibility API extensively. it's an old and buggy API. unfortunately there's a lot that we don't control. the API sometimes sends back wrong data. it also requires macOS apps to implement the Accessibility in order to work. so even if i strive to make things consistent as much as possible, it is not always a success. all API bugs are reported to, and talked with Apple. please report if something does not seem to work properly, and i'll see what i can do.

in native apps that implement the macOS Accessibility the experience is consistent and we could basically build a whole Vim. in browsers, Electron apps and other native apps that don't implement the macOS Accessibility results may, well, vary. 😬️

# REQUESTS

* to request a missing move, [open an issue](https://github.com/godbout/kindaVim.theapp/issues/new)
* to request a feature, [open an issue](https://github.com/godbout/kindaVim.theapp/issues/new)
* to report a bug, wait. yes, [open an issue](https://github.com/godbout/kindaVim.theapp/issues/new)
* in case you just want to open an issue though, [open an issue](https://github.com/godbout/kindaVim.theapp/issues/new)

# ACKNOWLEDGMENTS, THANKS, AND KISSES

* [Takayama Fumihiko](https://github.com/tekezo) for [Karabiner-Elements](https://karabiner-elements.pqrs.org), my first experience of Vim moves on macOS. great option if you need lots of customizations
* [David Balatero](https://github.com/dbalatero) for [VimMode.spoon](https://github.com/dbalatero/VimMode.spoon), showing there's a way to make that shit work. great option if you're looking for free/open source
* [Sindre Sorhus](https://github.com/sindresorhus) for [LaunchAtLogin](https://github.com/sindresorhus/LaunchAtLogin) and [KeyboardShortcuts](https://github.com/sindresorhus/KeyboardShortcuts), that saved me countless of hours of headaches
* [Sparkle](https://sparkle-project.org) for the Sofware Updater. this is good shit
