# termcolor
Colorize terminal Output for V Language

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
    println(tc.colorize(text : "Hello World", fc : ".red"))
}
```

### Text Config

These are the all avaiable options

- `text` - string you want to change
- `mode` - change the color mode
- `fc` - foreground color
- `bc` - background color
- `r` - red color for `.rgb` mode
- `g` - green color for `.rgb` mode
- `b` - blue color for `.rgb` mode
- `br` - background red color for `.rgb` mode 
- `bg` - background green color for `.rgb` mode 
- `bb` - background blue color for `.rgb` mode 
- `fhex` - foreground color for `.hex` mode
- `bhex` - bacground color for `.hex` mode
- `fbit` - foreground color for `.bit`(256 color) mode
- `bbit` - background color for `.bit`(256 color) mode
- `style` - style for the text


Avaiable Colors :
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


 
