<div align="center">
    <img src="https://github.com/godbout/kindaVim.theapp/blob/master/assets/icon.png">
    <h1>brings Vim moves to macOS input fields. and non input fields. is that everywhere yet?</h1>
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

1. if it can read and modify the text, it uses the [kV Accessibility Strategy](#user-content-kv-accessibility-strategy). it's text manipulation. theoritically you can have a full Vim experience. pragmatically some stuff will currently be missing so please [ask](https://github.com/godbout/kindaVim.theapp/issues/new) for what you need!
2. if it can't read the text, it uses the [kV Keyboard Strategy](#user-content-kv-keyboard-strategy) and tries to impersonate Vim through keys remapping. it's a little more wonky than the kV Accessibility Strategy.
3. if it's not text, it also uses the [kV Keyboard Strategy](#user-content-kv-keyboard-strategy), remap keys, and if the app uses the default macOS keyboard shortcuts you should just get what you expect (e.g. `G` scrolls to the end of a webpage, reaches the last email of a list, goes to the last item of a dropdown, etc.)


in the `Preferences` you can also:
* ask kindaVim to ignore any app completely
* bypass macOS Accessibility restrictions with the `PG-R` Mode for apps where you can read the text but not modify it. you'll experience this mostly in browsers
* enforce the [kV Keyboard Strategy](#user-content-kv-keyboard-strategy) for big fat liars apps that tell you they're implementing the macOS Accessibility but actually no no (all Electron apps)

# WAIT A MINUTE. WHAT DATA DO YOU STEAL???

to do its magic kindaVim needs to read/write text, and capture/forward key presses. so technically yes, i could steal your girlfriend's (or boyfriend's) phone number. but the app is [notarized by Apple](https://developer.apple.com/documentation/security/notarizing_macos_software_before_distribution), which means they've checked and agreed i'm a good boy. and also they took 100 US dollars from me.

also honestly i personally don't give a single flying fuck about data. that's noise to me. i don't even track the [kindaVim.app](https://kindavim.app) website. i want to use my time and energy to create great products, and i believe the rest will take care of itself. yes. i'm that dumb.

# HOW 'BOUT THE $$$

kindaVim will be a subscription of one ☕️ (USD$3) a month. the beta is free and contains the full set of features. i have no idea when i'll drop the beta. the beta may last 10 years. who knows. or maybe till 2049.

# CURRENT VIM IMPLEMENTATION

## Motions

### kV Accessibility Strategy

| Normal Mode | including count | copies deletion | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode | including count | copies deletion 
| :---:       | :---:           |  :---:          | :---:                                | :---:       | :---:           | :---:           
| `_`         | ❌️              |                 |                                      | `_`         | ❌️              |                 
| `[(`        | ❌️              |                 |                                      | `^`         |               |
| `[(`        | ❌️              |                 |                                      | `$`         | ❌️              |
| `[{`        | ❌️              |                 |                                      | `~`         |
| `])`        | ❌️              |                 |                                      | `0`         |               |
| `]}`        | ❌️              |                 |                                      | `B`          | ❌️             |
| `{`        | ❌️              |                  |                                      | `b`          | ❌️             |
| `}`        | ❌️              |                  |                                      | `C`          |                | ✅️️
| `%`        |               |                  |                                        | `c`          |                | ✅️️
| `^`        |               |                  |                                        | `D`          |                | ✅️️
| `<<`        | ❌️              |                 |                                      | `d`          |                | ✅️️
| `>>`        | ❌️              |                 |                                      | `E`          | ❌️             |
| `~`        | ✅️              |                  |                                      | `e`          | ❌️             |
| `$`        | ❌️              |                  |                                      | `F`          | ✅️             |
| `0`        |                 |                  |                                      | `f`          | ✅️             |
| `A`        | ️❌️              |                  |                                      | `G`          | ❌️             |
| `a`        | ❌️              |                  |                                      | `g^`          |              | 
| `B`        | ✅️️              |                  |                                      | `g$`          | ❌️             | 
| `b`        | ✅️️              |                  |                                      | `g0`          |              |
| `C`        | ❌️              | ✅️️               |                                      | `gE`          | ❌️             |
| `caW`      | ❌️              |  ❌️              |                                      | `ge`          | ❌️             |
| `caw`      | ❌️              |        ✅️️        |                                      | `gg`          | ❌️             |
| `cB`      | ✅️️              |        ✅️️         |                                      | `gI`          |               |
| `cb`      | ✅️️              |        ✅️️         |                                      | `gj`          | ❌️              |
| `cc`      | ❌️              |        ✅️️         |                                      | `gk`          | ❌️              |
| `cE`      | ✅️️              |        ✅️️         |                                      | `h`          | ❌️              |
| `ce`      | ✅️️              |        ✅️️         |                                      | `iW`          | ❌️              |
| `cF`      | ✅️              |        ✅️         |                                      | `iw`          | ❌️              |
| `cf`      | ✅️              |        ✅️         |                                      | `j`          | ❌️              |
| `cG`      | ❌️              |        ✅️️         |                                      | `k`          | ❌️              |
| `cgg`      | ❌️              |       ✅️         |                                      | `l`          | ❌️              |
| `ci'`      | ❌️              |       ✅️️         |                                      | `o`          |               |
| `ci"`      | ❌️              |       ✅️️         |                                      | `R`          |                 |  ✅️️ 
| `ci(`      | ❌️              |       ✅️         |                                      | `S`          |                 |  ✅️️ 
| `ci)`      | ❌️              |       ✅️         |                                      | `s`          |                 |  ✅️️ 
| `ci[`      | ❌️              |       ✅️         |                                      | `T`          | ✅️              |
| `ci]`      | ❌️              |       ✅️         |                                      | `t`          | ✅️️              |
| `ci{`      | ❌️              |       ✅️        |                                       | `V`          | ❌️              |
| `ci}`      | ❌️              |       ✅️         |                                      | `v`          | ❌️              |
| <code>ci`</code> | ❌️        |        ✅️️       |                                       | `W`          | ❌️              |
| `ciB`      |   ❌️            | ✅️              |                                       | `w`          | ❌️              |
| `cib`      |   ❌️            | ✅️              |                                       | `X`          |                 | ✅️️ 
| `ciW`      |   ❌️            | ✅️️              |                                       | `x`          |                 |  ✅️️
| `ciw`      |                 | ✅️️              |                                       | `Y`          |                 |
| `CTRL-R`   | ❌️              |                 |                                       | `y`          |                 |
| `cT`       | ✅️              | ✅️ 
| `ct`       | ✅️              | ✅️ 
| `cW`       | ❌️              | ✅️️ 
| `cw`       | ❌️              | ✅️️ 
| `D`       | ❌️              | ❌
| `daW`     | ❌️               | ❌
| `daw`     | ❌️               | ✅️️
| `dB`     | ✅️️               | ✅️️
| `db`     | ✅️️               | ✅️️
| `dd`     | ❌️               | ✅️️
| `dE`     | ✅️️               | ✅️️
| `de`     | ✅️️               | ✅️️
| `dF`     | ✅️               | ✅️
| `df`     | ✅️               | ✅️
| `dG`     | ❌️               | ✅️️
| `dgg`     | ❌️               | ✅️
| `dh`     | ❌️               | ✅️️
| `diW`     | ❌️               | ✅️️
| `diw`     | ❌️               | ✅️️
| `dj`     | ❌️               | ✅️️
| `dk`     | ❌️               | ✅️️
| `dl`     | ❌️               | ✅️️
| `dT`     | ✅️               | ✅️ 
| `dt`     | ✅️               | ✅️
| `dW`     | ✅️                | ✅️
| `dw`     | ✅️                | ✅️
| `E`     | ✅️️                 
| `e`     | ✅️️                 
| `F`     | ✅️                 
| `f`     | ✅️                 
| `G`     | ✅️                 
| `g_`     | ❌️     
| `g^`     | 
| `g$`     | ❌️                 
| `g0`     |                  
| `gE`     | ✅️️                 
| `ge`     | ✅️️                 
| `gg`     | ✅️                 
| `gI`     | ❌️              
| `gj`     | ❌️                 
| `gk`     | ❌️                 
| `h`      | ❌️                 
| `I`      | ❌️                 
| `i`      | ❌️               
| `J`      | ❌️                 
| `j`      | ❌️                 
| `k`      | ❌️                 
| `l`      | ✅️                 
| `O`      | ❌️                 
| `o`      | ❌️                 
| `P`      | ❌️                 
| `p`      | ❌️                 
| `r`      | ✅️                 
| `S`      | ❌️                  | ✅️️  
| `s`      | ❌️                  | ✅️️
| `T`      | ✅️                 
| `t`      | ✅️                 
| `u`      | ❌️                 
| `W`      | ✅️️                 
| `w`      | ✅️️                 
| `X`      | ❌️                  | ✅️️  
| `x`      | ❌️                  | ✅️️
| `yF`     | ✅️                 
| `yf`     | ✅️                 
| `yi'`     | ❌️                 
| `yi"`    | ❌️                 
| `yi(`     | ❌️                 
| `yi)`     | ❌️                 
| `yi[`     | ❌️                 
| `yi]`     | ❌️                 
| `yi{`     | ❌️                 
| `yi}`     | ❌️                 
|  <code>yi`</code> | ❌️ | 
| `yiw` | ❌️ | 
| `yT` | ✅️ | 
| `yt` | ✅️ | 
| `yy` | ❌️ | 

### kV Keyboard Strategy

| Normal Mode | including count | copies deletion | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode | including count | copies deletion
| :---:       | :---:           |  :---:          | :---:                                | :---:       |     :---:       | :---:
| `_`         | ❌️              |                 |                                      | `_`         | ❌️              |
| `^`         |               |                  |                                       | `^`         |                 |
| `$`         | ❌️              |                  |                                     | `$`         | ❌️              |
| `0`         |               |                  |                                       | `0`         |                 |
| `A`         | ❌️              |                  |                                     | `b`         | ❌️              |
| `a`         | ❌️              |                  |                                     | `C`         |                 |  ✅️️
| `b`         | ❌️              |                  |                                     | `c`         |                 |  ✅️️
| `C`         | ❌️              |      ✅️️          |                                     | `D`         |                 |  ✅️️
| `c$`        | ❌️              |      ✅️️          |                                     | `d`         |                 |  ✅️️
| `cb`        | ❌️              |      ✅️          |                                     | `e`          | ❌️              |
| `cc`        | ❌️              |      ✅️️          |                                     | `G`          | ❌️              |
| `ce`        | ❌️              |      ✅️️          |                                     | `g^`          |                 |
| `cG`        | ❌️              |      ✅️️          |                                     | `g$`          | ❌️              |
| `cgg`        | ❌️              |     ✅️          |                                     | `g0`          |                 |
| `ciw`        | ❌️              |     ✅️️          |                                      | `ge`          | ❌️              |
| `cl`         | ❌️               |   ✅️             |                                   | `gg`          | ❌️              |
| `CTRL-B`     | ❌️               |                 |                                    | `gI`          |                | 
| `CTRL-D`    | ❌️              |                   |                                    | `gj`          | ❌️              | 
| `CTRL-F`    | ❌️              |                  |                                     | `gk`          | ❌️              |
| `CTRL-R`    | ❌️              |                  |                                     | `h`           | ❌️              |                                    
| `CTRL-U`    | ❌️              |                  |                                     | `j`           | ❌️              |                                    
| `cw`        | ❌️              |      ✅️️           |                                    | `k`           | ❌️              |
| `D`        | ❌️              |       ✅️️           |                                    | `l`           | ❌️              |
| `d$`       | ❌️               |      ✅️            |                                   | `R`           | ❌️              | ✅️ 
| `db`        | ❌️              |      ✅️           |                                    | `S`           | ❌️              | ✅️ 
| `dd`        | ❌️              |      ✅️️           |                                    | `s`           | ❌️              | ✅️    
| `de`        | ❌️              |      ✅️           |                                    | `V`           | ❌️              |
| `dG`        | ❌️              |      ✅️️           |                                    | `v`           | ❌️              |
| `dgg`       | ❌️              |      ✅️           |                                    | `w`           | ❌️              |
| `dh`       | ❌️              |       ✅️️           |                                    | `X`           |                 |  ✅️️
| `dj`       | ❌️              |       ✅️           |                                    | `x`           |                 |  ✅️️
| `dk`       | ❌️              |       ✅️           |                                    | `Y`           |                 |  
| `dl`       | ❌️              |       ✅️️           |                                    | `y`           |                 |
| `dw`       | ❌️              |       ✅️️           |                                    
| `e`        | ❌️              |                    |                                    
| `G`        | ❌️              |                    |                                    
| `g_`        | ❌️              |
| `g^`        |                 |
| `g$`        | ❌️              |
| `g0`        |                 |
| `ge`        | ❌️              |
| `gg`        | ❌️              |
| `gI`        | ❌️              |
| `gj`        | ❌️              |
| `gk`        | ❌️              |
| `h`         | ❌️              |
| `l`         | ✅️              |
| `i`         | ❌️              |
| `J`         | ❌️              |
| `j`         | ❌️              |
| `k`         | ❌️              |
| `l`         | ❌️              |
| `O`         | ❌️              |
| `o`         | ❌️              |
| `P`         | ❌️              |
| `p`         | ❌️              |
| `r`         | ❌️              |
| `S`         | ❌️              |       ✅️️
| `s`         | ❌️              |       ✅️
| `u`         | ❌️              |
| `w`         | ❌️              |
| `X`         | ❌️              |✅️️
| `x`         | ❌️              |✅️️
| `yiw`       | ❌️              |
| `yy`       | ❌️               |

### Commands

| Command |
| :---:   |
| `:q`       
| `:q!`
| `:w`         
| `:wq`        
| `:x`

# DID YOU KNOW?

![bye bye caps lock](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/did-you-know.png "haha")

# ROADMAP
* add a plethora of missing Vim moves ([ask!](https://github.com/godbout/kindaVim.theapp/issues/new))
* update all moves to support new global count system ([ask!](https://github.com/godbout/kindaVim.theapp/issues/new))
* exploring the idea of letting non Vim moves pass through and go back to macOS (so that you can run your PH shortcut in Normal Mode)
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

# OPEN SOURCE

the [tests](https://github.com/godbout/AccessibilityStrategyTestApp) describing the Vim moves are open source. you can use those to build your own implementation, or if you just want to learn more about Vim moves, or if you just can't get enough good self-induced migraines.

# ACKNOWLEDGMENTS, THANKS, AND KISSES

* [Takayama Fumihiko](https://github.com/tekezo) for [Karabiner-Elements](https://karabiner-elements.pqrs.org), my first experience of Vim moves on macOS. great option if you need lots of customizations
* [David Balatero](https://github.com/dbalatero) for [VimMode.spoon](https://github.com/dbalatero/VimMode.spoon), showing there's a way to make that shit work. great option if you're looking for free/open source
* [Sindre Sorhus](https://github.com/sindresorhus) for [LaunchAtLogin](https://github.com/sindresorhus/LaunchAtLogin) and [KeyboardShortcuts](https://github.com/sindresorhus/KeyboardShortcuts), that saved me countless of hours of headaches
* [Sparkle](https://sparkle-project.org) for the Sofware Updater. this is good shit
* [Clipy](https://github.com/Clipy) for [Sauce](https://github.com/Clipy/Sauce), a magnificent Swift package to handle Keyboard Layouts headaches shits
 
# CAN YOU TONE DOWN THE LANGUAGE PLEASE?

no.
