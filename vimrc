" ######################
" General

filetype on         " activate filetype detection via $VIMRUNTIME/filetype.vim
filetype plugin on  " deactivate filetype plugins (ftplugins)
filetype indent on  " activate filetype indentation via $VIMRUNTIME/indent.vim

set autoread        " auto reload file after an external change

set backspace=indent,eol,start   " more powerful backspacing

set completeopt+=noinsert        " don't auto insert when the autocomplete popup opens

set noswapfile      " disable the swap file feature
set hidden          " hide an unsaved buffer when opening a new one

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
" Key sequences

let mapleader = ','             " use comma as leader key

nnoremap <leader>k :bn<CR>
nnoremap <leader>j :bp<CR>

" ######################
"

" Rust
let g:rust_recommended_style = 0   " do not respect the recommended style

" ######################
" Plugins configuration

" 
" vim-lsc

let g:lsc_enable_autocomplete = v:false               " disable autocomplete (manual completion only)
let g:lsc_auto_map = v:true                           " Use the defaults key mapping

let g:lsc_server_commands = {}                        " Map a filetype to the command that starts the language server

if executable('rust-analyzer')
	let g:lsc_server_commands.rust = 'rust-analyzer'
endif

if executable('typescript-language-server')
	let g:lsc_server_commands.javascript = 'typescript-language-server --stdio'
	let g:lsc_server_commands.typescript = 'typescript-language-server --stdio'
end

"
" NerdTree

" toggle the file tree split"
nnoremap <leader>n :NERDTreeToggle<CR>

"
" FZF

" open the Fuzzy file search split"
nnoremap <leader>f :FZF<CR>

