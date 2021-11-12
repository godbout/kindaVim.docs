<div align="center">
    <img src="https://github.com/godbout/kindaVim.theapp/blob/master/assets/icon.png">
    <h1>brings Vim moves to macOS.</h1>
</div>

---

# WHY

brain space and energy are limited. why learning six hundred thousand new keyboard shortcuts when you can use Vim moves everywhere. also macOS is widely inconsistent like sometimes you can go up and down with ctrl+n/ctrl+p but also sometimes not. even in Apple's own apps. so jk FTW.

and also it's fucking cool.

# HOW DOES IT WORK

kindaVim uses two strategies:

## the Accessibility Strategy

for `Text Fields` and `Text Areas`, kindaVim will try to access the text through the [macOS Accessibility](https://support.apple.com/en-gb/guide/mac-help/mh35884/mac). if the application that holds the text implements the Accessibility properly then you have top black magic. a character-precision sniper. anything is possible (except some things). if the application does not implement the Accessibility, then kindaVim will fall back to using the [Keyboard Strategy](#user-content-the-keyboard-strategy).

## the Keyboard Strategy

for any UI Element other than `Text Fields` and `Text Areas` or for apps that don't implement the macOS Accessibility kindaVim will remap key presses. for Non Text UI Elements like `Dropdowns`, `Lists`, `Tables` etc. this works beautifully. for `Text Fields` and `Text Areas` on apps that don't implement the Accessibility kindaVim tries its best to reproduce the original Vim move through key remapping. but it's a little more wonky than the [Accessibility Strategy](#user-content-the-accessibility-strategy).

# HOW 'BOUT THE MONEY

kindaVim will be a subscription of one ☕️ (USD$3) a month. if you want to read more about the rationale behind this decision, well, then, [read more](#user-content-more-about-the-subscription-model). the beta is free and contains the full set of features. i have no idea when i'll drop the beta. the beta may last 10 years. who knows. or maybe till 2047.

# CURRENT VIM IMPLEMENTATION

## Accessibility Strategy

| Normal Mode |
| --- |
| _ | [( |
| [{ |
| ]) |
| ]} |
| { |
| } |
| % |
| ^ |
| << |
| >> |
| $ |
| 0 |
| A |
| a |
| B |
| b |
| C |
| caw |
| cc |
| cF |
| cf |
| cG |
| cgg |
| ci' |
| ci" |
| ci( |
| ci) |
| ci[ |
| ci] |
| ci{ |
| ci} |
| ci` |
| ciw |
| control r |
| cT |
| ct |
| D |
| daw |
| dd |
| dF |
| df |
| dG |
| dgg |
| dj |
| dk |
| dT |
| dt |
| E |
| e |
| F |
| f |
| G |
| g_ |
| g^ |
| g$ |
| g0 |
| gE |
| ge |
| gg |
| gI |
| gj |
| gk |
| h |
| I |
| i |
| j |
| k |
| l |
| O |
| o |
| P |
| p |
| r |
| T |
| t |
| u |
| W |
| w |
| x |
| yF |
| yf |
| yi' |
| yi" |
| yi( |
| yi) |
| yi[ |
| yi] |
| yi{ |
| yi} |
| yi` |
| yiw |
| yT |
| yt |
| yy |

| Visual Mode |
| --- |
| _ |
| ^ |
| $ |
| 0 |
| B |
| b |
| c |
| d |
| E |
| e |
| F |
| f |
| G |
| g^ |
| g$ |
| g0 |
| gE |
| ge |
| gg |
| gI |
| gj |
| gk |
| h |
| iw |
| j |
| k |
| l |
| o |
| T |
| t |
| V |
| v |
| W |
| w |
| y |

## Keyboard Strategy

| Normal Mode |
| --- |
| _ |
| ^ |
| $ |
| 0 |
| A |
| a |
| b |
| C |
| cb |
| cc |
| cG |
| cgg |
| ciw |
| control d |
| control r |
| control u |
| D |
| db |
| dd |
| dG |
| dgg |
| dj |
| dk |
| e |
| G |
| g_ |
| g^ |
| g$ |
| g0 |
| ge |
| gg |
| gI |
| gj |
| gk |
| h |
| l |
| i |
| j |
| k |
| l |
| O |
| o |
| P |
| p |
| r |
| s |
| u |
| w |
| X |
| x |
| yiw |
| yy |

| Visual Mode |
| --- |
| _ |
| ^ |
| $ |
| 0 |
| b |
| c |
| d |
| e |
| G |
| g^ |
| g$ |
| g0 |
| ge |
| gg |
| gI |
| gj |
| gk |
| h |
| j |
| k |
| l |
| V |
| v |
| w |
| y |

lol those tables.

# ROADMAP
* a plethora of missing Vim moves
* app updater
* count system
* hybrid mode: some apps like browsers implement the Accessibility but have restrictions. you can move around perfectly but the Accessibility cannot simulate the `enter` key or delete text. hybrid mode will be a combination of the [Accessibility Strategy](#user-content-the-accessibility-strategy) for some movements and the [Keyboard Strategy](#user-content-the-keyboard-strategy) for some others in order to bypass those restrictions
* better handling of broswers and Electron shit apps

# KNOWN ISSUES
* kindaVim currently considers escaped quotes as quotes. sad
* brackets within quotes are also not ignored. double sad
* some bug with caw, daw and empty lines. will fix when bored
* some moves may not work in some browers, even when enforcing the Keyboard Strategy. hybrid mode will solve this
* indentation <<, >> is currently not configurable and stuck to 4 spaces (haha)

# REQUESTS

* to request a missing move, open an issue: https://github.com/godbout/kindaVim.theapp/issues/new
* to request a feature, open an issue: https://github.com/godbout/kindaVim.theapp/issues/new
* to report a bug, open an issue: https://github.com/godbout/kindaVim.theapp/issues/new
* in case you just want to open an issue though, open an issue: https://github.com/godbout/kindaVim.theapp/issues/new

# MORE ABOUT THE SUBSCRIPTION MODEL

ever bought an app and 8 months later there's a new major version because **ENTIRELY REDESIGNED FROM SCRATCH FROM THE GROUND UP FOR YOU OUR LOVELY CUSTOMERS EVEN THO IT LOOKS THE SAME AND BEHAVES THE SAME BUT HEY HERE PUT YOUR CREDIT CARD NUMBER AGAIN HEHE™**? i have. many times. i hate it. as a consumer i don't give a single fuck if you need to rewrite your app. it's none of my business. not my problem. sometimes yes you can update for free but sometimes no you cannot and sometimes you need to bargain the six months period and blah and blah and blah. unnecessary headaches. with a subscription as a consumer you get the latest. you don't need to worry about what's happening behind the scenes (true, usually a lot, but again none of your business). if an app makes you smile when you use it, if it saves you time, or inspires you, then a couple of bucks a month should be a no-brainer **investment**. (that is, assuming that you're loving yourself 😅️😗️❤️.) you deserve it!


# ACKNOWLEDGMENTS, THANKS, AND KISSES

* [Takayama Fumihiko](https://github.com/tekezo) for [Karabiner-Elements](https://karabiner-elements.pqrs.org), my first experience of Vim moves on macOS. great option if you need lots of customizations
* [David Balatero](https://github.com/dbalatero) for [VimMode.spoon](https://github.com/dbalatero/VimMode.spoon), showing there's a way to make that shit work. great option if you're looking for free/open source
* [Sindre Sorhus](https://github.com/sindresorhus) for [LaunchAtLogin](https://github.com/sindresorhus/LaunchAtLogin) and [KeyboardShortcuts](https://github.com/sindresorhus/KeyboardShortcuts), that saved me countless of hours of headaches
