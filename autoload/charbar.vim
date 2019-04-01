" vim-charbar
"
" Copyright 2019 Kim Silkebækken
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to
" deal in the Software without restriction, including without limitation the
" rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
" sell copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
" FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
" IN THE SOFTWARE.

if exists('g:loaded_charbar')
	finish
endif

let g:charbar_bar_styles = {
	\ 'line': ['‾', '⎺', '⎻', '―', '—', '⎼', '⎽', '_'],
	\ 'braille': ['⠁', '⠉', '⠋', '⠛', '⠟', '⠿', '⡿', '⣿'],
	\ 'block': ['█', '▇', '▆', '▅', '▄', '▃', '▂', '▁'],
	\ }

let g:charbar_arrow_styles = {
	\ 'arrow': ['↑', '↓'],
	\ 'triangle': ['▴', '▾'],
	\ }

if !exists('g:charbar_bar_style')
	let g:charbar_bar_style = 'line'
endif

if !exists('g:charbar_arrow_style')
	let g:charbar_arrow_style = 'arrow'
endif

let g:loaded_charbar = 1

function! charbar#Char()
	let arrow_style = g:charbar_arrow_styles[g:charbar_arrow_style]
	let top_line = str2float(line('w0'))
	if top_line == 1
		return arrow_style[0]
	endif
	let bottom_line = str2float(line('w$'))
	let line_count = str2float(line('$'))
	if bottom_line == line_count
		return arrow_style[1]
	endif
	let bar_style = g:charbar_bar_styles[g:charbar_bar_style]
	let screen_line_count = bottom_line - top_line
	let line_pos = top_line / (line_count - screen_line_count)
	return bar_style[float2nr(ceil(line_pos * len(bar_style)) - 1)]
endfunction
