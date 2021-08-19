" contains the autocmd information
" key: the file extension
" value : the command

if !exists("g:urk_autocmd_pre")
    let g:urk_autocmd_pre = {}
endif

" create all autocmd
function UrkAutocmd()
	augroup UrkAutocmdPre
		 " Remove all auto-commands from the group
		autocmd!

		for [filetypes, cmd] in items(g:urk_autocmd_pre)
			execute 'autocmd BufWritePre '.filetypes.' '.cmd
		endfor
	augroup END
endfunction
call UrkAutocmd()
