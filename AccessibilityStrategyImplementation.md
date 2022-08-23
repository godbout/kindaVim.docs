# Accessibility Strategy

kV detects automatically which Strategy to use, but sometimes you may wish to enforce the Keyboard Strategy even when the text is Accessible.
You can do so by pressing `fn` while doing a move. This is useful when you're in a text input but want to scroll through the UI (scrollbars) rather than the text/caret, or to move from one input to another in some apps with custom UI (e.g. Things 3, Logseq).

| Normal Mode                                 | count | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode | count |
| ---:                                        | :---:           | :---:                                | ---:                                        | :---:       
| `_`                                         | ✅️              |                                      | `_`                                         | ✅️️          
| `,`                                         | ✅️              |                                      | `,`                                         | ✅️          
| `;`                                         | ✅️              |                                      | `;`                                         | ✅️          
| `?`                                         | ✅️              |                                      | `^`                                         |             
| `?<CR>`                                     | ✅️              |                                      | `+`, `<CR>`, `CTRL-M`, `<Enter>`            | ✅️
| `(`                                         | ❌️              |                                      | `<`                                         | ✅️
| `)`                                         | ❌              |                                      | `>`                                         | ✅️
| `[(`                                        | ❌️              |                                      | `$`, `<End>`                                | ✅️️          
| `[(`                                        | ❌️              |                                      | `~`                                         |             
| `[{`                                        | ❌️              |                                      | `0`                                         |             
| `])`                                        | ❌️              |                                      | `a'`                                        | ❌️
| `]}`                                        | ❌️              |                                      | `a"`                                        | ❌️
| `{`                                         | ❌️              |                                      | `a[`, `a]`                                  | ❌️
| `}`                                         | ❌️              |                                      | `a<`, `a>`                                  | ❌️ 
| `/`                                         | ✅️              |                                      | <code>a`</code>                             | ❌️ 
| `/<CR>`                                     | ✅️              |                                      | `aB`, `a{`, `a}`                            | ❌️
| `%`                                         |                 |                                      | `ab`, `a(`, `a)`                            | ❌️
| `^`                                         |                 |                                      | `B`, `<C-Left>`                             | ✅️          
| `+`, `<CR>`, `<CTRL-M>`, `<Enter>`          | ✅️️              |                                      | `b`, `<S-Left>`                             | ✅️          
| `<<`                                        | ✅️️              |                                      | `C`                                         |             
| `>>`                                        | ✅️️              |                                      | `c`, `s`                                    |             
| `~`                                         | ✅️              |                                      | `D`                                         |             
| `$`, `<End>`                                | ✅️              |                                      | `d`, `<Del>`, `x`                           |             
| `0`                                         |                 |                                      | `E`                                         | ✅️          
| `A`                                         | ❌️              |                                      | `e`                                         | ✅️          
| `a`                                         | ❌️              |                                      | `F`                                         | ✅️          
| `B`, `<C-Left>`                             | ✅️️              |                                      | `f`                                         | ✅️          
| `b`, `<S-Left>`                             | ✅️️              |                                      | `G`                                         | ✅️          
| `C`, `c$`, `cEnd`                           | ❌️              |                                      | `g_`                                        | ✅️
| `CTRL-B`, `<PageUp>`, `<S-Up>`              |                 |                                      | `g^`                                        |             
| `CTRL-D`                                    |                 |                                      | `g$`, `g<End>`                              | ✅️️          
| `CTRL-F`, `<PageDown>`, `<S-Down>`          |                 |                                      | `g0`, `g<Home>`                             |             
| `CTRL-R`                                    | ✅️              |                                      | `gE`                                        | ✅️          
| `CTRL-U`                                    |                 |                                      | `ge`                                        | ✅️          
| `c0`                                        |                 |                                      | `gg`                                        | ✅️          
| `ca'`                                       | ❌️              |                                      | `gI`                                        |             
| `ca"`                                       | ❌️              |                                      | `gj`, `g<Down>`                             | ✅️          
| `ca[`, `ca]`                                | ❌️              |                                      | `gk`, `g<Up>`                               | ✅️          
| `ca<`, `ca>`                                | ❌️              |                                      | `gx`                                        |
| <code>ca`</code>                            | ❌️              |                                      | `h`, `<BS>`, `CTRL-H`, `<Left>`             | ✅️          
| `caB`, `ca{`, `ca}`                         | ❌️              |                                      | `i'`                                        | ❌️
| `cab`, `ca(`, `ca)`                         | ❌️              |                                      | `i"`                                        | ❌️
| `caW`                                       | ❌️              |                                      | `i[`, `i]`                                  | ❌️
| `caw`                                       | ❌️              |                                      | `i<`, `i>`                                  | ❌️ 
| `cB`                                        | ✅️️              |                                      | `iB`, `i{`, `i}`                            | ❌️ 
| `cb`                                        | ✅️️              |                                      | `ib`, `i(`, `i)`                            | ❌️ 
| `cc`                                        | ❌️              |                                      | `ip`                                        | ❌️
| `cE`                                        | ✅️️              |                                      | `iW`                                        | ❌️          
| `ce`                                        | ✅️️              |                                      | `iw`                                        | ❌️          
| `cF`                                        | ✅️              |                                      | `j`, `CTRL-J`, `CTRL-N`, `<Down>`           | ✅️          
| `cf`                                        | ✅️              |                                      | `k`, `CTRL-P`, `<Up>`                       | ✅️          
| `ch`, `c<BS>`, `cCTRL-H`, `c<Left>`         | ✅️              |                                      | `l`, `<Right>`, `<Space>`                   | ✅️          
| `cG`                                        | ❌️              |                                      | `o`                                         |             
| `cg$`, `cgEnd`                              | ❌️              |                                      | `P`                                         | ❌️          
| `cg0`, `cgHome`                             |   ️              |                                      | `p`                                         | ❌️          
| `cgg`                                       | ❌️              |                                      | `R`                                         |             
| `ci'`                                       | ❌️              |                                      | `S`                                         |             
| `ci"`                                       | ❌️              |                                      | `T`                                         | ✅️          
| `ci[`, `ci]`                                | ❌️              |                                      | `t`                                         | ✅️️          
| `ci<`, `ci>`                                | ❌️              |                                      | `u`                                         | 
| <code>ci`</code>                            | ❌️              |                                      | `V`                                         | ❌️          
| `ciB`, `ci{`, `ci}`                         | ❌️              |                                      | `v`                                         | ❌️          
| `cib`, `ci(`, `ci)`                         | ❌️              |                                      | `W`, `<C-Right>`                            | ✅️          
| `ciW`                                       | ❌️              |                                      | `w`, `<S-Right>`                            | ✅️          
| `ciw`                                       | ❌️              |                                      | `X`                                         |             
| `cj`, `cCTRL-J`, `cCTRL-N`, `c<Down>`       | ❌️              |                                      | `Y`                                         |             
| `ck`, `cCTRL-P`, `c<Up>`                    | ❌️              |                                      | `y`                                         |                 
| `cT`                                        | ✅️              |                                      
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
