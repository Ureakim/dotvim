" contains the autocmd information
" key: the file extension
" value : the command
if !exists("g:urk_aac_formatter")
	let g:urk_aac_formatter = {}
endif

" create all autocmd
function UrkAutoCmd()
	augroup UrkAutocmdPre
		" Remove all auto-commands from the group
		autocmd!

		for [filetypes, cmd] in items(g:urk_aac_formatter)
			execute 'autocmd FileType '.filetypes.' setlocal equalprg='.cmd
		endfor
	augroup END
endfunction
call UrkAutoCmd()

" Save the actual window view before launching the command
" then restore the window view
" Naive fix to the cursor jumping to the beginning of file
function LaunchFormatter(cmd)
	let view = winsaveview()
	exe a:cmd
	call winrestview(view)
endfunction
