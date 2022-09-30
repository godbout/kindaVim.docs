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
| `(`                                         | ❌️              |                                      | `{`                                         | ❌️
| `)`                                         | ❌              |                                      | `}`                                         | ❌️
| `[(`                                        | ❌️              |                                      | `^`                                         |             
| `[(`                                        | ❌️              |                                      | `+`, `<CR>`, `CTRL-M`, `<Enter>`            | ✅️
| `[{`                                        | ❌️              |                                      | `<`                                         | ✅️
| `])`                                        | ❌️              |                                      | `>`                                         | ✅️
| `]}`                                        | ❌️              |                                      | `$`, `<End>`                                | ✅️️          
| `{`                                         | ❌️              |                                      | `~`                                         |             
| `}`                                         | ❌️              |                                      | `0`                                         |             
| `/`                                         | ✅️              |                                      | `a'`                                        | ❌️
| `/<CR>`                                     | ✅️              |                                      | `a"`                                        | ❌️
| `%`                                         |                 |                                      | `a[`, `a]`                                  | ❌️
| `^`                                         |                 |                                      | `a<`, `a>`                                  | ❌️ 
| `+`, `<CR>`, `<CTRL-M>`, `<Enter>`          | ✅️️              |                                      | <code>a`</code>                             | ❌️ 
| `<<`                                        | ✅️️              |                                      | `aB`, `a{`, `a}`                            | ❌️
| `>>`                                        | ✅️️              |                                      | `ab`, `a(`, `a)`                            | ❌️
| `~`                                         | ✅️              |                                      | `ap`                                        | ❌️
| `$`, `<End>`                                | ✅️              |                                      | `B`, `<C-Left>`                             | ✅️          
| `0`                                         |                 |                                      | `b`, `<S-Left>`                             | ✅️          
| `A`                                         | ❌️              |                                      | `C`                                         |             
| `a`                                         | ❌️              |                                      | `c`, `s`                                    |             
| `B`, `<C-Left>`                             | ✅️️              |                                      | `D`                                         |             
| `b`, `<S-Left>`                             | ✅️️              |                                      | `d`, `<Del>`, `x`                           |             
| `C`, `c$`, `cEnd`                           | ❌️              |                                      | `E`                                         | ✅️          
| `CTRL-B`, `<PageUp>`, `<S-Up>`              |                 |                                      | `e`                                         | ✅️          
| `CTRL-D`                                    |                 |                                      | `F`                                         | ✅️          
| `CTRL-F`, `<PageDown>`, `<S-Down>`          |                 |                                      | `f`                                         | ✅️          
| `CTRL-R`                                    | ✅️              |                                      | `G`                                         | ✅️          
| `CTRL-U`                                    |                 |                                      | `g_`                                        | ✅️
| `c0`                                        |                 |                                      | `g^`                                        |             
| `ca'`                                       | ❌️              |                                      | `g$`, `g<End>`                              | ✅️️          
| `ca"`                                       | ❌️              |                                      | `g0`, `g<Home>`                             |             
| `ca[`, `ca]`                                | ❌️              |                                      | `gE`                                        | ✅️          
| `ca<`, `ca>`                                | ❌️              |                                      | `ge`                                        | ✅️          
| <code>ca`</code>                            | ❌️              |                                      | `gg`                                        | ✅️          
| `caB`, `ca{`, `ca}`                         | ❌️              |                                      | `gI`                                        |             
| `cab`, `ca(`, `ca)`                         | ❌️              |                                      | `gj`, `g<Down>`                             | ✅️          
| `cap`                                       | ❌️              |                                      | `gk`, `g<Up>`                               | ✅️          
| `caW`                                       | ❌️              |                                      | `gx`                                        |
| `caw`                                       | ❌️              |                                      | `h`, `<BS>`, `CTRL-H`, `<Left>`             | ✅️          
| `cB`                                        | ✅️️              |                                      | `i'`                                        | ❌️
| `cb`                                        | ✅️️              |                                      | `i"`                                        | ❌️
| `cc`                                        | ❌️              |                                      | `i[`, `i]`                                  | ❌️
| `cE`                                        | ✅️️              |                                      | `i<`, `i>`                                  | ❌️ 
| `ce`                                        | ✅️️              |                                      | <code>i`</code>                             | ❌️ 
| `cF`                                        | ✅️              |                                      | `iB`, `i{`, `i}`                            | ❌️ 
| `cf`                                        | ✅️              |                                      | `ib`, `i(`, `i)`                            | ❌️ 
| `ch`, `c<BS>`, `cCTRL-H`, `c<Left>`         | ✅️              |                                      | `ip`                                        | ❌️
| `cG`                                        | ❌️              |                                      | `iW`                                        | ❌️          
| `cg$`, `cgEnd`                              | ❌️              |                                      | `iw`                                        | ❌️          
| `cg0`, `cgHome`                             |   ️              |                                      | `j`, `CTRL-J`, `CTRL-N`, `<Down>`           | ✅️          
| `cgg`                                       | ❌️              |                                      | `k`, `CTRL-P`, `<Up>`                       | ✅️          
| `ci'`                                       | ❌️              |                                      | `l`, `<Right>`, `<Space>`                   | ✅️          
| `ci"`                                       | ❌️              |                                      | `o`                                         |             
| `ci[`, `ci]`                                | ❌️              |                                      | `P`                                         | ❌️          
| `ci<`, `ci>`                                | ❌️              |                                      | `p`                                         | ❌️          
| <code>ci`</code>                            | ❌️              |                                      | `R`                                         |             
| `ciB`, `ci{`, `ci}`                         | ❌️              |                                      | `S`                                         |             
| `cib`, `ci(`, `ci)`                         | ❌️              |                                      | `T`                                         | ✅️          
| `cip`                                       | ❌️              |                                      | `t`                                         | ✅️️          
| `ciW`                                       | ❌️              |                                      | `u`                                         | 
| `ciw`                                       | ❌️              |                                      | `V`                                         | ❌️          
| `cj`, `cCTRL-J`, `cCTRL-N`, `c<Down>`       | ❌️              |                                      | `v`                                         | ❌️          
| `ck`, `cCTRL-P`, `c<Up>`                    | ❌️              |                                      | `W`, `<C-Right>`                            | ✅️          
| `cT`                                        | ✅️              |                                      | `w`, `<S-Right>`                            | ✅️          
| `ct`                                        | ✅️              |                                      | `X`                                         |             
| `cW`                                        | ❌️              |                                      | `Y`                                         |             
| `cw`                                        | ❌️              |                                      | `y`                                         |                 
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
