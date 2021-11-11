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

for `Text Fields` and `Text Areas`, kindaVim will try to access the text through the [macOS Accessibility](https://support.apple.com/en-gb/guide/mac-help/mh35884/mac). if the application that holds the text implements the Accessibility properly then you have top black magic. a character-precision sniper. anything is possible (except some things). if the application does not implement the Accessibility, then kindaVim will fall back to using the [Keyboard Strategy](#).

## the Keyboard Strategy

for any UI Element other than `Text Fields` and `Text Areas` or for apps that don't implement the macOS Accessibility kindaVim will remap key presses. for Non Text UI Elements like `Dropdowns`, `Lists`, `Tables` etc. this works beautifully. for `Text Fields` and `Text Areas` on apps that don't implement the Accessibility kindaVim tries its best to reproduce the original Vim move through key remapping. but it's a little more wonky than the [Accessibility Strategy]().

# HOW 'BOUT THE MONEY

kindaVim will be a subscription of one ☕️ (USD$3) a month. if you want to read more about the rationale being it, you can read more [below](). the beta is free and contains the full set of features. i have no idea when i'll drop the beta. the beta may last 10 years. who knows. or maybe till 2047.

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

# KNOWN ISSUES

# ROADMAP
* a plethora of missing Vim moves
* count system
* hybrid mode: some apps like browsers implement the Accessibility but have restrictions. you can move around perfectly but the Accessibility cannot simulate the `enter` key or delete text. hybrid mode will be a combination of the [Accessibility Strategy]() for some movements and the [Keyboard Strategy]() for some others in order to bypass those restrictions.
* better handling of broswers and Electron apps

# MORE ABOUT THE SUBSCRIPTION MODEL

# ACKNOWLEDGMENT
* Sindre
* maestro
* hammerspoon vim

# REQUEST

