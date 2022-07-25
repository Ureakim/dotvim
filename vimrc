" ######################
" Variable definition

let g:lsc_server_commands = {}          " Map filetypes to the command that starts the language server

" ######################
" General

filetype on         " activate filetype detection via $VIMRUNTIME/filetype.vim
filetype plugin on  " deactivate filetype plugins (ftplugins)
filetype indent on  " activate filetype indentation via $VIMRUNTIME/indent.vim

set autoread        " auto reload file after an external change

set backspace=indent,eol,start   " more powerful backspacing

set completeopt+=noinsert        " don't auto insert when the autocomplete popup opens

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

" Clear jumplist at start
autocmd VimEnter * :clearjumps

" Close preview window after completion
autocmd CompleteDone * silent! pclose

" ######################
" Ui

syntax on           " activate syntax highlighting

set splitbelow      " make the new window appear below the current window
set splitright      " make the new window appear on the right

set number          " display line number
set relativenumber  " display line number relative to the cursor
set ruler           " display line and column in the statusbar
set laststatus=2    " always display the status line
set showcmd         " show the current command in the status line
set cursorline      " hightlight the current line
set ttyfast         " update screen quickly
set visualbell      " screen flash instead of bell sound

set termguicolors   " use 24-bit colors
colorscheme nebulae " set the default colorscheme

" ######################
" Search

set hlsearch        " highlight all search matches
set incsearch       " highlight search while typing
set ignorecase      " search is NOT case sensitive
set smartcase       " make search case sensitive if the pattern contains an uppercase

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

" ######################
" Encoding

set encoding=utf-8                                       " encoding for terminal display
set fileencodings=ucs-bom,utf-8,cp1252,default,latin9    " list of encoding of the written file

" ######################
" Indentation

set tabstop=2       " how many <space> per <tab>
set softtabstop=2   " how many <space> is deleted when backspacing
set shiftwidth=2    " how many <space> per indent command
set noexpandtab     " don't replace <tab> by <spaces> (because tab > space for indentation)

" ######################
" Netrw

let g:netrw_liststyle = 3      " tree view by default
let g:netrw_browse_split = 4   " open file in the previous window
let g:netrw_winsize = 25       " take 25% when open in a split

" ######################
" Key sequences

let mapleader = ','             " use comma as leader key

nnoremap <leader>k :bn<CR>
nnoremap <leader>j :bp<CR>

nnoremap <leader>n :Vexplore<CR>

nnoremap <leader>g :Neoformat<CR>

" ######################
" Commands

" Grep : launch :grep and redraw (no more "Press ENTER to continue")
command! -nargs=+ -complete=file Grep execute 'silent grep! <args>' | redraw!

" ######################
" Language configuration

""""""""""""""""
""""" Rust
let g:rust_recommended_style = 0       " do not respect the recommended style

" use rust-analyzer as lsp server
if executable('rust-analyzer')
	let g:lsc_server_commands.rust = 'rust-analyzer'
endif

""""""""""""""""
""""" Go
" use gopls as lsp server
if executable('gopls')
	let g:lsc_server_commands.go = {
		\ 'command': 'gopls serve',
		\ 'log_level': -1,
		\ 'suppress_stderr': v:true,
	\}
endif

""""""""""""""""
""""" JavaScript/TypeScript

" use typescript-language-server as lsp server
if executable('typescript-language-server')
	let g:lsc_server_commands.javascript = 'typescript-language-server --stdio'
	let g:lsc_server_commands.typescript = 'typescript-language-server --stdio'
end

" ######################
" Plugins configuration

function! PackInit() abort
	" load package manager
	packadd minpac

	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})
	call minpac#add('vim-airline/vim-airline')
	call minpac#add('junegunn/fzf')
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('sbdchd/neoformat')
	call minpac#add('natebosch/vim-lsc')
	call minpac#add('christoomey/vim-tmux-navigator')
	call minpac#add('tpope/vim-vinegar')
	call minpac#add('puremourning/vimspector')
	call minpac#add('SirVer/ultisnips')
endfunction

""""""""""""""""
""""" vim-airline

let g:airline_theme="nebulae"

""""""""""""""""
""""" ultisnips

let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/snips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

""""""""""""""""
""""" vim-lsc

let g:lsc_enable_autocomplete = v:false      " disable autocomplete (manual completion only)
let g:lsc_auto_map = {
			\ 'defaults': v:false,
			\ 'GoToDefinition': '<C-]>',
			\ 'FindReferences': '<leader>lr',
			\ 'NextReference': '<C-n>',
			\ 'PreviousReference': '<C-p>',
			\ 'FindImplementations': '<leader>li',
			\ 'FindCodeActions': '<leader>la',
			\ 'Rename': '<leader>lc',
			\ 'SignatureHelp': '<leader>lm',
			\ 'ShowHover': v:true,
			\ 'Completion': 'completefunc',
\}

inoremap <C-l> <C-x><C-u>

""""""""""""""""
""""" FZF

if executable('rg')
	let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'      " use ripgrep as default search command in FZF
end

" open the Fuzzy file search split"
nnoremap <leader>o :FZF<CR>
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

