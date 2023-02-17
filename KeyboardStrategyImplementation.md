# Keyboard Strategy

This is the fallback mode.
If the app you're on doesn't handle the macOS Accessibility properly, then kV will use different sets of key remapping (depending on whether you're on a Text Element, Non Text Element, TextField Element, TextArea Element, etc.) to impersonate a Vim move.
Most of the time the fallback happens automatically, but some apps (usually Electron) falsely advertise their support of the macOS Accessibility, and need the Keyboard Strategy to be manually enforced through the Preferences, Families Pane.

| Normal Mode                                 | count | repeat | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode                                | count | repeat | 
| ---:                                        | :---: | :---:  | :---:                                            | ---:                                       | :---: | :---:
| `_`                                         | ❌️    |        |                                                  | `_`                                        | ❌️    |          
| `?`                                         | ❌️    |        |                                                  | `^`                                        |       |          
| `?<CR>`                                     | ❌️    |        |                                                  | `+`, `<CR>`, `CTRL-M`, `<Enter>`           | ✅️    |          
| `/`                                         | ❌️    |        |                                                  | `$`, `<End>`                               | ❌️    |          
| `/<CR>`                                     | ❌️    |        |                                                  | `0`                                        |       |          
| `^`                                         |       |        |                                                  | `b`, `<S-Left>`                            | ✅️️    |          
| `+`, `<CR>`, `CTRL-M`, `<Enter>`            | ✅️️    |        |                                                  | `C`                                        |       |  ❌️
| `<<`                                        | ✅️️    | ✅     |                                                  | `c`, `s`                                   |       |  ❌️      
| `>>`                                        | ✅️️    | ✅     |                                                  | `D`                                        |       |  ❌️      
| `$`, `<End>`                                | ❌️    |        |                                                  | `d`, `<Del>`, `x`                          |       |  ❌️      
| `0`                                         |       |        |                                                  | `e`                                        | ✅️️    |          
| `A`                                         | ❌️    | ❌️     |                                                  | `G`                                        | ❌️    |         
| `a`                                         | ❌️    | ❌️     |                                                  | `g^`                                       |       |         
| `b`, `<S-Left>`                             | ✅️️    |        |                                                  | `g_`                                       | ❌️    |
| `C`, `c$`, `c<End>`                           | ❌️    | ❌️     |                                                  | `g$`, `g<End>`                             | ❌️    |         
| `CTRL-B`, `<PageUp>`, `<S-Up>`              | ❌️    |        |                                                  | `g0`, `g<Home>`                            |       |         
| `CTRL-D`                                    | ❌️    |        |                                                  | `ge`                                       | ✅️️    |         
| `CTRL-F`, `<PageDown>`, `<S-Down>`          | ❌️    |        |                                                  | `gg`                                       | ❌️    |         
| `CTRL-R`                                    | ✅️️    |        |                                                  | `gI`                                       |       | ️
| `CTRL-U`                                    | ❌️    |        |                                                  | `gj`, `g<Down>`                            | ✅️    |         
| `c0`                                        |       | ❌️     |                                                  | `gk`, `g<Up>`                              | ✅️    |         
| `cb`                                        | ✅️️    | ❌️     |                                                  | `h`, `<BS>`, `CTRL-H`, `<Left>`            | ✅️    |
| `cc`                                        | ❌️    | ❌️     |                                                  | `iw`                                       | ❌️    |         
| `ce`                                        | ✅️️    | ❌️     |                                                  | `j`, `CTRL-J`, `CTRL-N`, `<Down>`          | ✅️    |         
| `cG`                                        | ❌️    | ❌️     |                                                  | `k`, `CTRL-P`, `<Up>`                      | ✅️    |         
| `cg$`, `cg<End>`                              | ❌️    | ❌️     |                                                  | `l`, `<Right>`, `<Space>`                  | ✅️    |         
| `cg0`, `cg<Home>`                             |       | ❌️     |                                                  | `P`                                        | ❌️    |         
| `cgg`                                       | ❌️    | ❌️     |                                                  | `p`                                        | ❌️    |         
| `ch`, `c<BS>`, `cCTRL-H`, `c<Left>`         | ✅️️    | ❌️     |                                                  | `R`                                        | ❌️    | ❌️        
| `ciw`                                       | ❌️    | ❌️     |                                                  | `S`                                        | ❌️    | ❌️       
| `cj`, `cCTRL-J`, `cCTRL-N`, `c<Down>`       | ❌️    | ❌️     |                                                  | `V`                                        | ❌️    |         
| `ck`, `cCTRL-P`, `c<Up>`                    | ❌️    | ❌️     |                                                  | `v`                                        | ❌️    |         
| `cw`                                        | ✅️️    | ❌️     |                                                  | `w`, `<S-Right>`                           | ✅️️    |         
| `D`, `d$`, `d<End>`                           | ❌️    | ✅     |                                                  | `X`                                        |       | ❌️      
| `d0`                                        |       | ✅     |                                                  | `Y`                                        |       |                                
| `db`                                        | ✅️️    | ✅     |                                                  | `y`                                        |       |          
| `dd`                                        | ❌️    | ✅     |                                                  
| `de`                                        | ✅️️    | ✅     |                                      
| `dG`                                        | ❌️    | ✅     |                                      
| `dg$`, `dg<End>`                              | ❌️    | ✅     |
| `dg0`, `dg<Home>`                             |       | ✅     |
| `dgg`                                       | ❌️    | ✅     |                                      
| `diw`                                       | ❌️    | ✅     |                                      
| `dj`, `dCTRL-J`, `dCTRL-N`, `d<Down>`       | ❌️    | ✅     |                                      
| `dk`, `dCTRL-P`, `d<Up>`                    | ❌️    | ✅     |                                      
| `dw`                                        | ❌️    | ✅     |                                     
| `e`                                         | ✅️️    |        |                                      
| `G`                                         | ❌️    |        |                                      
| `g_`                                        | ❌️    |        |                                        
| `g^`                                        |       |        |                                      
| `g$`, `g<End>`                              | ❌️    |        |                                      
| `g0`, `g<Home>`                             |       |        |                                      
| `ge`                                        | ✅️️    |        |
| `gg`                                        | ❌️    |        |
| `gI`                                        | ❌️    | ❌️     |
| `gj`, `g<Down>`                             | ✅️    |        |
| `gk`, `g<Up>`                               | ✅️    |        |
| `h`, `<BS>`, `CTRL-H`, `<Left>`             | ✅️    |        |
| `I`                                         | ❌️    | ❌️     |    
| `i`                                         | ❌️    | ❌️     |
| `J`                                         | ❌️    |        |
| `j`, `CTRL-J`, `CTRL-N`, `<Down>`           | ✅    |        |
| `k`, `CTRL-P`, `<Up>`                       | ✅    |        |
| `l`, `<Right>`, `<Space>`                   | ✅    |        |
| `N`                                         | ✅️    |        |
| `n`                                         | ✅️    |        |
| `O`                                         | ❌️    | ❌️     |
| `o`                                         | ❌️    | ❌️     |
| `P`                                         | ❌️    | ❌️     |
| `p`                                         | ❌️    | ❌️     |
| `r`                                         | ❌️    | ❌️     |
| `S`                                         | ❌️    | ❌️     | ️
| `s`, `cl`, `c<Right>`, `c<Space>`           | ✅️️    | ❌️     |
| `u`                                         | ✅️️    | ❌️     |
| `w`, `<S-Right>`                            | ✅️️    |        |
| `X`, `dh`, `d<BS>`, `dCTRL-H`, `d<Left>`    | ✅️️    | ✅     |
| `x`, `<Del>`, `dl`, `d<Right>`, `d<Space>`  | ✅️️    | ✅     |
| `Y`                                         | ❌️    |        |
| `y$`, `y<End>`                                | ❌️    |        |
| `y0`                                        |       |        |
| `yg$`, `yg<End>`                              | ❌️    |        |
| `yg0`, `yg<Home>`                             |   ️    |        |
| `yh`, `y<BS>`, `y<Left>`, `yCTRL-H`         | ❌️    |        |
| `yiw`                                       | ❌️    |        |
| `yl`, `y<Right>`, `y<Space>`                | ❌️    |        |
| `yy`                                        | ❌️    |        |
| `zz`                                        | ❌️    |        |
