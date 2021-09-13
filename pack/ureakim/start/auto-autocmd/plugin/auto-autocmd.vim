" contains the autocmd informations
" key: filetypes
" value : the command
if !exists("g:urk_aac_formatters")
	let g:urk_aac_formatter = {}
endif

" create all autocmd
function s:createAutoCommands()
	augroup UrkAutoAutocmdPre
		" Remove all auto-commands from the group
		autocmd!

		" Assign the commande to a buffer variable
		for [filetypes, cmd] in items(g:urk_aac_formatters)
			execute 'autocmd FileType '.filetypes.' let b:urk_aac_formatter="'.cmd.'"'
		endfor
	augroup END
endfunction
call s:createAutoCommands()

" launch the command if exists
function Urk_LaunchFormatter()
	if exists("b:urk_aac_formatter")
		execute b:urk_aac_formatter
	end
endfunction
