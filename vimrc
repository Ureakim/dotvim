" vim: set foldmethod=marker :
" vim: set foldmarker={{,}} :
" vim: set foldlevel=99 :

" ######################
" General
" {{

filetype on         " activate filetype detection via $VIMRUNTIME/filetype.vim
filetype plugin on  " deactivate filetype plugins (ftplugins)
filetype indent on  " activate filetype indentation via $VIMRUNTIME/indent.vim

set autoread        " auto reload file after an external change

set backspace=indent,eol,start   " more powerful backspacing

set completeopt+=noinsert,preview        " don't auto insert when the autocomplete popup opens

set wildoptions+=fuzzy

set nobackup        " disable backup files
set nowritebackup   " disable backup files during file writing
set noswapfile      " disable the swap file feature
set noundofile      " disable the creation of undo files

set hidden          " hide an unsaved buffer when opening a new one

set nowrap          " no wrapping by default

set timeout          " activate mappings timeout
set ttimeout         " activate keycodes timeout
set timeoutlen=2000  " mappings timeout im ms
set ttimeoutlen=50   " keycodes timeout in ms

set foldmethod=syntax  " use syntax language for folding
set foldlevelstart=99  " don't fold everything by default

augroup generalSettings
	autocmd!

	" Clear jumplist at start
	autocmd VimEnter * :clearjumps

	"	Close preview window after completion
	autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" }}
" ######################
" Ui
" {{

syntax on           " activate syntax highlighting

set splitbelow      " make the new window appear below the current window
set splitright      " make the new window appear on the right

set number          " display line number
set relativenumber  " display line number relative to the cursor
set ruler           " display line and column in the statusbar
set laststatus=2    " always display the status line
set colorcolumn=99  " add a ruler at column 99
set showcmd         " show the current command in the status line
set cursorline      " hightlight the current line
set scrolloff=8     " scroll offset
set ttyfast         " update screen quickly
set visualbell      " screen flash instead of bell sound

set termguicolors   " use 24-bit colors
colorscheme nebulae " set the default colorscheme

" }}
" ######################
" Search
" {{

set hlsearch        " highlight all search matches
set incsearch       " highlight search while typing
set ignorecase      " search is NOT case sensitive
set smartcase       " make search case sensitive if the pattern contains an uppercase
set nohlsearch      " no highlight search

" use ripgrep for the :grep command
if executable('rg')
	set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

" automatically open the location/quickfix window
augroup autoOpenQfixLocWindow
	autocmd!
	autocmd QuickFixCmdPost [^l]* cwindow
	autocmd QuickFixCmdPost l*    lwindow
augroup END

" }}
" ######################
" Encoding
" {{

set encoding=utf-8                                       " encoding for terminal display
set fileencodings=ucs-bom,utf-8,cp1252,default,latin9    " list of encoding of the written file

" }}
" ######################
" Indentation
" {{

set tabstop=2       " how many <space> per <tab>
set softtabstop=2   " how many <space> is deleted when backspacing
set shiftwidth=2    " how many <space> per indent command
set noexpandtab     " don't replace <tab> by <spaces> (because tab > space for indentation)

" }}
" ######################
" Netrw
" {{

let g:netrw_liststyle = 3      " tree view by default
let g:netrw_browse_split = 4   " open file in the previous window
let g:netrw_winsize = 25       " take 25% when open in a split

" }}
" ######################
" Key sequences
" {{

let mapleader = ' '             " use space as leader key

nnoremap <leader>k :bn<CR>
nnoremap <leader>j :bp<CR>

nnoremap <leader>n :Vexplore<CR>

" }}
" ######################
" Commands
" {{

" Grep : launch :grep and redraw (no more "Press ENTER to continue")
command! -nargs=+ -complete=file Grep execute 'silent grep! <args>' | redraw!

" }}
" ######################
" Plugins configuration
" {{

function! PackInit() abort
	" load package manager
	packadd minpac

	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})
	call minpac#add('vimwiki/vimwiki', {'type': 'opt'})
	call minpac#add('vim-airline/vim-airline')
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('junegunn/fzf')
	call minpac#add('prabirshrestha/vim-lsp')
	call minpac#add('dense-analysis/ale')
	call minpac#add('mattn/vim-lsp-settings')
	call minpac#add('prabirshrestha/asyncomplete.vim')
	call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
	call minpac#add('christoomey/vim-tmux-navigator')
	call minpac#add('tpope/vim-vinegar')
	call minpac#add('puremourning/vimspector')
	call minpac#add('SirVer/ultisnips')
endfunction

""""""""""""""""
""""" vim-airline

let g:airline_theme="nebulae"

""""""""""""""""
""""" vim-lsp/asyncomplete

let g:asyncomplete_auto_popup = 0	        " display autocomplete only on demand
let g:asyncomplete_auto_completeopt = 0   " don't auto override completeopt
let g:lsp_diagnostics_enabled = 0         " disable diagnostics support
imap <C-J> <Plug>(asyncomplete_force_refresh)

" keybindings
function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gs <plug>(lsp-document-symbol-search)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-type-definition)
	nmap <buffer> gf <plug>(lsp-type-definition)
	nmap <buffer> <leader>rn <plug>(lsp-rename)
	nmap <buffer> <leader>ca <plug>(lsp-code-action)
	nmap <buffer> K <plug>(lsp-hover)
	nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
	nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction

" call s:on_lsp_buffer_enabled only for languages that has the server registered.
augroup lsp_install
	au!
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


""""""""""""""""
""""" ale

" global fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_disable_lsp = 1          " disable lsp in ale
let g:ale_fix_on_save = 1          " fix files on save
let g:ale_open_list = 1            " auto open error/warning list
let g:ale_list_window_size = 5     " set the size of the error/warning list
let g:ale_virtualtext_cursor = 0   " disable error/warning in virtualtext

nmap <silent> g[ <Plug>(ale_previous_wrap)
nmap <silent> g] <Plug>(ale_next_wrap)

""""""""""""""""
""""" vimwiki

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

""""""""""""""""
""""" ultisnips

let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/snips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

""""""""""""""""
""""" vim-clap

if executable('rg')
	let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'      " use ripgrep as default search command in FZF
end

nnoremap <leader>o :Files<CR>
nnoremap <leader>b :Buffers<CR>

""""""""""""""""
""""" Vimspector

" remaps
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nmap <leader>d<Space> <Plug>VimspectorRunToCursor
nmap <leader>dl <Plug>VimspectorStepOver
nmap <leader>dj <Plug>VimspectorStepInto
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader>df :call vimspector#Continue()<CR>
nmap <leader>da :VimspectorWatch

" }}
