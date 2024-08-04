module termcolor

pub enum FG {
	black         = 30
	red
	green
	yellow
	blue
	magenta
	cyan
	white
	default       = 39
	light_gray    = 90
	light_red
	light_green
	light_yellow
	light_blue
	light_magenta
	light_cyan
	bright_white
}

pub enum BG {
	black         = 40
	red
	green
	yellow
	blue
	magenta
	cyan
	white
	default       = 49
	light_gray    = 100
	light_red
	light_green
	light_yellow
	light_blue
	light_magenta
	light_cyan
	bright_white
}

@[flag]
pub enum Style {
	bold
	dim
	italic
	underline
	blink
	rapid
	reverse
	hidden
	crossed
	normal
}

fn (s Style) to_styles() string {
	mut a := u16(s)
	mut c := ''
	for i := 1; i <= 10; i++ {
		if a % 2 == 1 {
			c = c + ';' + i.str()
		}
		a = a >> 1
	}
	return c
}

pub enum Mode {
	col
	rgb
	hex
	bit
	@none
}

@[params]
pub struct Text {
pub:
	text  string @[required]
	fc    FG = .default
	bc    BG = .default
	fhex  u32
	bhex  u32
	frgb  struct {
	pub:	
		r u8
		g u8
		b u8
	}
	brgb  struct {
	pub:
		r u8
		g u8
		b u8
	}
	fbit  int
	bbit  int
	style Style = .normal
	mode  Mode  = .col
}

const fg_rgb = 38
const bg_rgb = 48

const prefix = '\033['
const suffix = 'm'
const reset = '${prefix}0${suffix}'

pub fn colorize(text Text) string {
	mut styles := text.style.to_styles()

	fr := u8(text.fhex >> 16)
	fg := u8(text.fhex >> 8)
	fb := u8(text.fhex)

	br := u8(text.bhex >> 16)
	bg := u8(text.bhex >> 8)
	bb := u8(text.bhex)

	match text.mode {
		.col {
			return '${prefix}${int(text.bc)};${int(text.fc)}${styles}${suffix}${text.text}${reset}'
		}
		.hex {
			if text.bhex == 0 {
				return '${prefix}${fg_rgb};2;${fr};${fg};${fb}${styles}${suffix}${text.text}${reset}'
			} else {
				return '${prefix}${bg_rgb};2;${br};${bg};${bb};${fg_rgb};2;${fr};${fg};${fb}${styles}${suffix}${text.text}${reset}'
			}
		}
		.rgb {
			if text.brgb == struct{} {
				return '${prefix}${fg_rgb};2;${text.frgb.r};${text.frgb.g};${text.frgb.b}${styles}${suffix}${text.text}${reset}'
			} else {
				return '${prefix}${bg_rgb};2;${text.brgb.r};${text.brgb.g};${text.brgb.b};${fg_rgb};2;${text.frgb.r};${text.frgb.g};${text.frgb.b}${styles}${suffix}${text.text}${reset}'
			}
		}
		.bit {
			if text.bbit == 0 {
				return '${prefix}38;5;${text.fbit}${styles}${suffix}${text.text}${reset}'
			} else {
				return '${prefix}48;5;${text.bbit};38;5;${text.fbit}${styles}${suffix}${text.text}${reset}'
			}
		}
		else {
			return '${prefix}${int(FG.default)}${styles}${suffix}${text.text}${reset}'
		}
	}
}
