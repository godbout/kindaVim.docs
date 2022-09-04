# Accessibility Strategy

kV detects automatically which Strategy to use, but sometimes you may wish to enforce the Keyboard Strategy even when the text is Accessible.
You can do so by pressing `fn` while doing a move. This is useful when you're in a text input but want to scroll through the UI (scrollbars) rather than the text/caret, or to move from one input to another in some apps with custom UI (e.g. Things 3, Logseq).

| Normal Mode                                 | count | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode | count |
| ---:                                        | :---:           | :---:                                | ---:                                        | :---:       
| `_`                                         | ✅️              |                                      | `_`                                         | ✅️️          
| `,`                                         | ✅️              |                                      | `,`                                         | ✅️          
| `;`                                         | ✅️              |                                      | `;`                                         | ✅️          
| `?`                                         | ✅️              |                                      | `(`                                         | ❌️
| `?<CR>`                                     | ✅️              |                                      | `)`                                         | ❌️
| `(`                                         | ❌️              |                                      | `^`                                         |             
| `)`                                         | ❌              |                                      | `+`, `<CR>`, `CTRL-M`, `<Enter>`            | ✅️
| `[(`                                        | ❌️              |                                      | `<`                                         | ✅️
| `[(`                                        | ❌️              |                                      | `>`                                         | ✅️
| `[{`                                        | ❌️              |                                      | `$`, `<End>`                                | ✅️️          
| `])`                                        | ❌️              |                                      | `~`                                         |             
| `]}`                                        | ❌️              |                                      | `0`                                         |             
| `{`                                         | ❌️              |                                      | `a'`                                        | ❌️
| `}`                                         | ❌️              |                                      | `a"`                                        | ❌️
| `/`                                         | ✅️              |                                      | `a[`, `a]`                                  | ❌️
| `/<CR>`                                     | ✅️              |                                      | `a<`, `a>`                                  | ❌️ 
| `%`                                         |                 |                                      | <code>a`</code>                             | ❌️ 
| `^`                                         |                 |                                      | `aB`, `a{`, `a}`                            | ❌️
| `+`, `<CR>`, `<CTRL-M>`, `<Enter>`          | ✅️️              |                                      | `ab`, `a(`, `a)`                            | ❌️
| `<<`                                        | ✅️️              |                                      | `B`, `<C-Left>`                             | ✅️          
| `>>`                                        | ✅️️              |                                      | `b`, `<S-Left>`                             | ✅️          
| `~`                                         | ✅️              |                                      | `C`                                         |             
| `$`, `<End>`                                | ✅️              |                                      | `c`, `s`                                    |             
| `0`                                         |                 |                                      | `D`                                         |             
| `A`                                         | ❌️              |                                      | `d`, `<Del>`, `x`                           |             
| `a`                                         | ❌️              |                                      | `E`                                         | ✅️          
| `B`, `<C-Left>`                             | ✅️️              |                                      | `e`                                         | ✅️          
| `b`, `<S-Left>`                             | ✅️️              |                                      | `F`                                         | ✅️          
| `C`, `c$`, `cEnd`                           | ❌️              |                                      | `f`                                         | ✅️          
| `CTRL-B`, `<PageUp>`, `<S-Up>`              |                 |                                      | `G`                                         | ✅️          
| `CTRL-D`                                    |                 |                                      | `g_`                                        | ✅️
| `CTRL-F`, `<PageDown>`, `<S-Down>`          |                 |                                      | `g^`                                        |             
| `CTRL-R`                                    | ✅️              |                                      | `g$`, `g<End>`                              | ✅️️          
| `CTRL-U`                                    |                 |                                      | `g0`, `g<Home>`                             |             
| `c0`                                        |                 |                                      | `gE`                                        | ✅️          
| `ca'`                                       | ❌️              |                                      | `ge`                                        | ✅️          
| `ca"`                                       | ❌️              |                                      | `gg`                                        | ✅️          
| `ca[`, `ca]`                                | ❌️              |                                      | `gI`                                        |             
| `ca<`, `ca>`                                | ❌️              |                                      | `gj`, `g<Down>`                             | ✅️          
| <code>ca`</code>                            | ❌️              |                                      | `gk`, `g<Up>`                               | ✅️          
| `caB`, `ca{`, `ca}`                         | ❌️              |                                      | `gx`                                        |
| `cab`, `ca(`, `ca)`                         | ❌️              |                                      | `h`, `<BS>`, `CTRL-H`, `<Left>`             | ✅️          
| `cap`                                       | ❌️              |                                      | `i'`                                        | ❌️
| `caW`                                       | ❌️              |                                      | `i"`                                        | ❌️
| `caw`                                       | ❌️              |                                      | `i[`, `i]`                                  | ❌️
| `cB`                                        | ✅️️              |                                      | `i<`, `i>`                                  | ❌️ 
| `cb`                                        | ✅️️              |                                      | <code>i`</code>                             | ❌️ 
| `cc`                                        | ❌️              |                                      | `iB`, `i{`, `i}`                            | ❌️ 
| `cE`                                        | ✅️️              |                                      | `ib`, `i(`, `i)`                            | ❌️ 
| `ce`                                        | ✅️️              |                                      | `ip`                                        | ❌️
| `cF`                                        | ✅️              |                                      | `iW`                                        | ❌️          
| `cf`                                        | ✅️              |                                      | `iw`                                        | ❌️          
| `ch`, `c<BS>`, `cCTRL-H`, `c<Left>`         | ✅️              |                                      | `j`, `CTRL-J`, `CTRL-N`, `<Down>`           | ✅️          
| `cG`                                        | ❌️              |                                      | `k`, `CTRL-P`, `<Up>`                       | ✅️          
| `cg$`, `cgEnd`                              | ❌️              |                                      | `l`, `<Right>`, `<Space>`                   | ✅️          
| `cg0`, `cgHome`                             |   ️              |                                      | `o`                                         |             
| `cgg`                                       | ❌️              |                                      | `P`                                         | ❌️          
| `ci'`                                       | ❌️              |                                      | `p`                                         | ❌️          
| `ci"`                                       | ❌️              |                                      | `R`                                         |             
| `ci[`, `ci]`                                | ❌️              |                                      | `S`                                         |             
| `ci<`, `ci>`                                | ❌️              |                                      | `T`                                         | ✅️          
| <code>ci`</code>                            | ❌️              |                                      | `t`                                         | ✅️️          
| `ciB`, `ci{`, `ci}`                         | ❌️              |                                      | `u`                                         | 
| `cib`, `ci(`, `ci)`                         | ❌️              |                                      | `V`                                         | ❌️          
| `cip`                                       | ❌️              |                                      | `v`                                         | ❌️          
| `ciW`                                       | ❌️              |                                      | `W`, `<C-Right>`                            | ✅️          
| `ciw`                                       | ❌️              |                                      | `w`, `<S-Right>`                            | ✅️          
| `cj`, `cCTRL-J`, `cCTRL-N`, `c<Down>`       | ❌️              |                                      | `X`                                         |             
| `ck`, `cCTRL-P`, `c<Up>`                    | ❌️              |                                      | `Y`                                         |             
| `cT`                                        | ✅️              |                                      | `y`                                         |                 
| `ct`                                        | ✅️              |                                      
| `cW`                                        | ❌️              |                                      
| `cw`                                        | ❌️              |                                      
| `D`, `d$`, `dEnd`                           | ❌️              |                                      
| `d0`                                        |                 |                                      
| `da'`                                       | ❌️              |
| `da"`                                       | ❌️              |
| `da[`, `da]`                                | ❌️              |
| `da<`, `da>`                                | ❌️              |
| <code>da`<code>                             | ❌️              |
| `daB`, `da{`, `da}`                         | ❌️              |                                      
| `dab`, `da(`, `da)`                         | ❌️              |                                      
| `dap`                                       | ❌️              |
| `daW`                                       | ❌️              |                                      
| `daw`                                       | ❌️              |                                      
| `dB`                                        | ✅️️              |                                      
| `db`                                        | ✅️️              |                                      
| `dd`                                        | ❌️              |
| `dE`                                        | ✅️️             
| `de`                                        | ✅️️             
| `dF`                                        | ✅️             
| `df`                                        | ✅️             
| `dG`                                        | ❌️             
| `dg$`, `dgEnd`                              | ❌️            
| `dg0`, `dgHome`                             |             
| `dgg`                                       | ❌️            
| `di'`                                       | ❌️            
| `di"`                                       | ❌️            
| `di[`, `di]`                                | ❌️              |                                      
| `di<`, `di>`                                | ❌️              |                                      
| <code>di`</code>                            | ❌️              |                                      
| `diB`, `di{`, `di}`                         | ❌️              |                                      
| `dib`, `di(`, `di)`                         | ❌️              |                                      
| `dip`                                       | ❌️
| `diW`                                       | ❌️            
| `diw`                                       | ❌️            
| `dj`, `dCTRL-J`, `dCTRL-N`, `d<Down>`       | ❌️             
| `dk`, `dCTRL-P`, `d<Up>`                    | ❌️             
| `dT`                                        | ✅️             
| `dt`                                        | ✅️             
| `dW`                                        | ✅️             
| `dw`                                        | ✅️             
| `E`                                         | ✅️️                 
| `e`                                         | ✅️️                 
| `F`                                         | ✅️                 
| `f`                                         | ✅️                 
| `G`                                         | ✅️                 
| `g_`                                        | ✅️     
| `g^`                                        | 
| `g$` , `g<End>`                             | ✅️                 
| `g0`, `g<Home>`                             |                  
| `gE`                                        | ✅️️                 
| `ge`                                        | ✅️️                 
| `gg`                                        | ✅️                 
| `gI`                                        | ❌️              
| `gj`, `g<Down>`                             | ✅️               
| `gk`, `g<Up>`                               | ✅️                 
| `gx`                                        |
| `H`                                         | ✅️
| `h`, `<BS>`, `CTRL-H`, `<Left>`             | ✅️                 
| `I`                                         | ❌️                 
| `i`                                         | ❌️               
| `J`                                         | ❌                 
| `j`, `CTRL-J`, `CTRL-N`, `<Down>`           | ✅️                 
| `k`, `CTRL-P`, `<Up>`                       | ✅️                 
| `L`                                         | ✅️
| `l`, `<Right>`, `<Space>`                   | ✅️
| `M`                                         |
| `N`                                         | ✅️               
| `n`                                         | ✅️               
| `O`                                         | ❌️                 
| `o`                                         | ❌️                 
| `P`                                         | ❌️                 
| `p`                                         | ❌️                 
| `r`                                         | ✅️                 
| `S`                                         | ❌️                  
| `s`, `cl`, `c<Right>`, `c<Space>`           | ✅️                  
| `T`                                         | ✅️                 
| `t`                                         | ✅️                 
| `u`                                         | ✅️                 
| `W`, `<C-Right>`                            | ✅️️                 
| `w`, `<S-Right>`                            | ✅️️                 
| `X`, `dh`, `d<BS>`, `dCTRL-H`, `d<Left>`    | ✅️                 
| `x`, `<Del>`, `dl`, `d<Right>`, `d<Space>`  | ✅️                  
| `Y`                                         | ✅️                  
| `y$`, `yEnd`                                | ️❌️
| `y0`                                        | ️
| `ya'`                                       | ❌️ 
| `ya"`                                       | ❌️ 
| `ya[`, `ya]`                                | ❌️ 
| `ya<`, `ya>`                                | ❌️                 
| <code>ya`</code>                            | ❌️
| `yaB`, `ya{`, `ya}`                         | ❌️                 
| `yab`, `ya(`, `ya)`                         | ❌️                 
| `yap`                                       | ❌️                 
| `yaW`                                       | ❌️                 
| `yaw`                                       | ❌️                 
| `yF`                                        | ✅️                 
| `yf`                                        | ✅️                 
| `yg$`, `ygEnd`                              | ️️❌️
| `yg0`, `ygHome`                             | ️️
| `yh`, `y<BS>`, `y<Left>`, `yCTRL-H`         | ❌️
| `yi'`                                       | ❌️
| `yi"`                                       | ❌️                 
| `yi[`, `yi]`                                | ❌️                 
| `yi<`, `yi>`                                | ❌️                 
|  <code>yi`</code>                           | ❌️ 
| `yiB`, `yi{`, `yi}`                         | ❌️                 
| `yib`, `yi(`, `yi)`                         | ❌️                 
| `yip`                                       | ❌️ 
| `yiW`                                       | ❌️ 
| `yiw`                                       | ❌️ 
| `yl`, `y<Right>`, `y<Space>`                | ❌️
| `yT`                                        | ✅️ 
| `yt`                                        | ✅️ 
| `yy`                                        | ✅️ 
| `z-`                                        | ❌️                 
| `z.`                                        | ❌️                 
| `zb`                                        | ❌️                 
| `z<CR>`                                     | ❌️                 
| `zt`                                        | ❌️                 
| `zz`                                        | ❌️                 
