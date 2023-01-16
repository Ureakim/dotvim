let g:rust_recommended_style = 0       " do not respect the recommended style

if executable('rustfmt')
	let b:ale_fixers = ['rustfmt']
endif
