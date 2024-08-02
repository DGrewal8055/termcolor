# termcolor
Colorize terminal Output for [V Language](https://vlang.io).

## Installation
Install `termcolor` module
```
v install --git https://github.com/DGrewal8055/termcolor
```
## Usage

### Example
```v
import termcolor as tc

fn main () {
    println(tc.colorize(text : "Hello World", fc : ".red", style : .bold | .underline))
}
```
```v
import termcolor as tc

fn main () {
    println(tc.colorize(text : "Hello World", frgb : tc.RGB{255, 0, 0}, style : .dim))
}
```
```v
import termcolor as tc

fn main () {
    println(tc.colorize(text : "Hello World", fhex : 0xFF0000, style : .italic))
}
```

### Text Config

These are the all avaiable options

- `text` - string you want to change (required)
- `mode` - change the color mode (default : .col)
- `fc` - foreground color
- `bc` - background color
- `frgb` - foreground color for `.rgb` mode
- `brgb` - background red color for `.rgb` mode 
- `fhex` - foreground color for `.hex` mode
- `bhex` - bacground color for `.hex` mode
- `fbit` - foreground color for `.bit`(256 color) mode
- `bbit` - background color for `.bit`(256 color) mode
- `style` - style for the text

Avaiable Modes :
- `.col` - Normal Color Mode
- `.hex` - Hexa decimal Color Mode `(0xFF00FF)`
- `.bit` - 256 Color Mode
- `.rgb` - RGB Color Mode `(r : 255, g : 0, b : 255)`

Avaiable Normal Colors :
- black
- red
- green
- yellow
- blue
- magenta
- cyan
- white
- default
- light_gray
- light_red
- light_green
- light_yellow
- light_blue
- light_magenta
- light_cyan
- bright_white


Available styles :
- bold
- dim
- italic
- underline
- blink
- rapid
- reverse
- hidden
- crossed
- normal

256 Color Mode :
![256-color-mode](https://i.sstatic.net/KTSQa.png)

# Acknowledgments
Based on Mewzax's [chalk](https://github.com/Mewzax/chalk) library.
 
