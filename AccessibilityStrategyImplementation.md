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
| `])`                                        | ❌️              |                                      | `a[`, `a]`                                  | ❌️
| `]}`                                        | ❌️              |                                      | `aB`, `a{`, `a}`                            | ❌️
| `{`                                         | ❌️              |                                      | `ab`, `a(`, `a)`                            | ❌️
| `}`                                         | ❌️              |                                      | `B`, `<C-Left>`                             | ✅️          
| `/`                                         | ✅️              |                                      | `b`, `<S-Left>`                             | ✅️          
| `/<CR>`                                     | ✅️              |                                      | `C`                                         |             
| `%`                                         |                 |                                      | `c`, `s`                                    |             
| `^`                                         |                 |                                      | `D`                                         |             
| `+`, `<CR>`, `<CTRL-M>`, `<Enter>`          | ✅️️              |                                      | `d`, `<Del>`, `x`                           |             
| `<<`                                        | ✅️️              |                                      | `E`                                         | ✅️          
| `>>`                                        | ✅️️              |                                      | `e`                                         | ✅️          
| `~`                                         | ✅️              |                                      | `F`                                         | ✅️          
| `$`, `<End>`                                | ✅️              |                                      | `f`                                         | ✅️          
| `0`                                         |                 |                                      | `G`                                         | ✅️          
| `A`                                         | ❌️              |                                      | `g_`                                        | ✅️
| `a`                                         | ❌️              |                                      | `g^`                                        |             
| `B`, `<C-Left>`                             | ✅️️              |                                      | `g$`, `g<End>`                              | ✅️️          
| `b`, `<S-Left>`                             | ✅️️              |                                      | `g0`, `g<Home>`                             |             
| `C`, `c$`, `cEnd`                           | ❌️              |                                      | `gE`                                        | ✅️          
| `CTRL-B`, `<PageUp>`, `<S-Up>`              |                 |                                      | `ge`                                        | ✅️          
| `CTRL-D`                                    |                 |                                      | `gg`                                        | ✅️          
| `CTRL-F`, `<PageDown>`, `<S-Down>`          |                 |                                      | `gI`                                        |             
| `CTRL-R`                                    | ✅️              |                                      | `gj`, `g<Down>`                             | ✅️          
| `CTRL-U`                                    |                 |                                      | `gk`, `g<Up>`                               | ✅️          
| `c0`                                        |                 |                                      | `gx`                                        |
| `ca'`                                       | ❌️              |                                      | `h`, `<BS>`, `CTRL-H`, `<Left>`             | ✅️          
| `ca"`                                       | ❌️              |                                      | `i[`, `i]`                                  | ❌️
| `ca[`, `ca]`                                | ❌️              |                                      | `iB`, `i{`, `i}`                            | ❌️ 
| `ca<`, `ca>`                                | ❌️              |                                      | `ip`                                        | ❌️
| <code>ca`</code>                            | ❌️              |                                      | `iW`                                        | ❌️          
| `caB`, `ca{`, `ca}`                         | ❌️              |                                      | `iw`                                        | ❌️          
| `cab`, `ca(`, `ca)`                         | ❌️              |                                      | `j`, `CTRL-J`, `CTRL-N`, `<Down>`           | ✅️          
| `caW`                                       | ❌️              |                                      | `k`, `CTRL-P`, `<Up>`                       | ✅️          
| `caw`                                       | ❌️              |                                      | `l`, `<Right>`, `<Space>`                   | ✅️          
| `cB`                                        | ✅️️              |                                      | `o`                                         |             
| `cb`                                        | ✅️️              |                                      | `P`                                         | ❌️          
| `cc`                                        | ❌️              |                                      | `p`                                         | ❌️          
| `cE`                                        | ✅️️              |                                      | `R`                                         |             
| `ce`                                        | ✅️️              |                                      | `S`                                         |             
| `cF`                                        | ✅️              |                                      | `T`                                         | ✅️          
| `cf`                                        | ✅️              |                                      | `t`                                         | ✅️️          
| `ch`, `c<BS>`, `cCTRL-H`, `c<Left>`         | ✅️              |                                      | `u`                                         | 
| `cG`                                        | ❌️              |                                      | `V`                                         | ❌️          
| `cg$`, `cgEnd`                              | ❌️              |                                      | `v`                                         | ❌️          
| `cg0`, `cgHome`                             |   ️              |                                      | `W`, `<C-Right>`                            | ✅️          
| `cgg`                                       | ❌️              |                                      | `w`, `<S-Right>`                            | ✅️          
| `ci'`                                       | ❌️              |                                      | `X`                                         |             
| `ci"`                                       | ❌️              |                                      | `Y`                                         |             
| `ci[`, `ci]`                                | ❌️              |                                      | `y`                                         |                 
| `ci<`, `ci>`                                | ❌️              |                                      
| <code>ci`</code>                            | ❌️              |                                      
| `ciB`, `ci{`, `ci}`                         | ❌️              |                                      
| `cib`, `ci(`, `ci)`                         | ❌️              |                                      
| `ciW`                                       | ❌️              |                                      
| `ciw`                                       | ❌️              |                                      
| `cj`, `cCTRL-J`, `cCTRL-N`, `c<Down>`       | ❌️              |                                      
| `ck`, `cCTRL-P`, `c<Up>`                    | ❌️              |                                      
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
