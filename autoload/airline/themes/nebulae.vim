" vim-airline
" from the atomic theme

let g:airline#themes#nebulae#palette = {}

function! airline#themes#nebulae#refresh()
	let s:N1 = airline#themes#get_highlight2(['CursorLine', 'bg'], ['CursorLine', 'fg'], 'none')
	let s:N2 = airline#themes#get_highlight2(['CursorLine', 'bg'], ['CursorLine', 'fg'], 'none')
	let s:N3 = airline#themes#get_highlight2(['CursorLine', 'fg'], ['CursorLine', 'bg'], 'none')
	let g:airline#themes#nebulae#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

	let s:I1 = airline#themes#get_highlight2(['Identifier', 'bg'], ['Identifier', 'fg'], 'none')
	let s:I2 = airline#themes#get_highlight2(['Identifier', 'bg'], ['Identifier', 'fg'], 'none')
	let s:I3 = airline#themes#get_highlight2(['CursorLine', 'fg'], ['CursorLine', 'bg'], 'none')
	let g:airline#themes#nebulae#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

	let s:R1 = airline#themes#get_highlight2(['Constant', 'bg'], ['Constant', 'fg'], 'none')
	let s:R2 = airline#themes#get_highlight2(['Constant', 'bg'], ['Constant', 'fg'], 'none')
	let s:R3 = airline#themes#get_highlight2(['CursorLine', 'fg'], ['CursorLine', 'bg'], 'none')
	let g:airline#themes#nebulae#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

	let s:V1 = airline#themes#get_highlight2(['Keyword', 'bg'], ['Keyword', 'fg'], 'none')
	let s:V2 = airline#themes#get_highlight2(['Keyword', 'bg'], ['Keyword', 'fg'], 'none')
	let s:V3 = airline#themes#get_highlight2(['CursorLine', 'fg'], ['CursorLine', 'bg'], 'none')
	let g:airline#themes#nebulae#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

	let s:IA1 = airline#themes#get_highlight2(['CursorLine', 'fg'], ['StatusLine', 'bg'], 'none')
	let s:IA2 = airline#themes#get_highlight2(['CursorLine', 'fg'], ['StatusLine', 'bg'], 'none')
	let s:IA3 = airline#themes#get_highlight2(['CursorLine', 'fg'], ['CursorLine', 'bg'], 'none')
	let g:airline#themes#nebulae#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

	" Accent color
	" It helps to remove the bold typography into modes section
	let g:airline#themes#nebulae#palette.accents = {'black' : airline#themes#get_highlight2(['CursorLine', 'bg'], ['ModeMsg', 'fg'], 'none')}

	" Mode map
	let g:airline_mode_map = {
		\ '__' : '--',
		\ 'n'  : 'N',
		\ 'i'  : 'I',
		\ 'R'  : 'R',
		\ 'c'  : 'C',
		\ 'v'  : 'V',
		\ 'V'  : 'V-L',
		\ '' : 'V-B',
		\ 's'  : 'S',
		\ 'S'  : 'S-L',
		\ '' : 'S-B',
		\ 't'  : 'T',
		\ }

	" Settings
	let g:airline_symbols.paste = 'Ξ'
	let g:airline_symbols.spell = 'S'

endfunction

call airline#themes#nebulae#refresh()
