" Vim color file
" Nebulae
" Created by Ureakim with ThemeCreator (https://github.com/mswift42/themecreator)

hi clear

if exists("syntax on")
	syntax reset
endif

set t_Co=256
set background=dark
let g:colors_name = "Nebulae"


" Define reusable colorvariables.
let s:black="#121212"
let s:purple="#9e85ac"
let s:blue="#6a8599"
let s:brown="#977e78"
let s:beige="#a79a88"
let s:orange="#dba95a"
let s:red="#e57b73"

let s:gray10="#b2b2b2"
let s:gray20="#a4a4a4"
let s:gray30="#969696"
let s:gray40="#878787"
let s:gray50="#5a5a5a"
let s:gray60="#494949"
let s:gray70="#373737"
let s:gray80="#101010"

let s:bg="#262626"
let s:fg="#b2b2b2"

exe 'hi Normal guifg='s:fg' guibg='s:bg
exe 'hi NonText guifg='s:fg' guibg='s:bg
exe 'hi Visual guibg='s:gray80
exe 'hi Cursor guifg='s:bg' guibg='s:fg
exe 'hi CursorLine  guibg='s:gray70' cterm=NONE'
exe 'hi CursorLineNr guifg='s:fg' guibg='s:gray70' cterm=NONE'
exe 'hi CursorColumn  guibg='s:gray70
exe 'hi ColorColumn  guibg='s:black
exe 'hi LineNr guifg='s:gray50' guibg='s:bg
exe 'hi SignColumn guifg='s:gray50' guibg='s:bg
exe 'hi VertSplit guifg='s:fg' guibg='s:black
exe 'hi MatchParen guifg='s:orange'  gui=underline'
exe 'hi StatusLine guifg='s:fg' guibg='s:gray70' gui=bold cterm=bold'
exe 'hi Pmenu guifg='s:fg' guibg='s:gray70
exe 'hi PmenuSel  guibg='s:gray60
exe 'hi IncSearch guifg='s:bg' guibg='s:purple' cterm=NONE'
exe 'hi Search  guifg='s:black' guibg='s:beige
exe 'hi Directory guifg='s:purple
exe 'hi Folded guifg='s:gray40' guibg='s:bg
exe 'hi WildMenu guifg='s:black' guibg='s:brown' gui=bold cterm=bold'

" Constants
exe 'hi Comment guifg='s:gray40
" Keywords
exe 'hi Conditional guifg='s:beige
exe 'hi Define guifg='s:beige
exe 'hi Keyword guifg='s:beige'  gui=bold'
exe 'hi Operator guifg='s:beige
exe 'hi PreProc guifg='s:beige
exe 'hi Statement guifg='s:beige
exe 'hi Tag guifg='s:beige
" Constants & Primitive
exe 'hi Constant guifg='s:purple
exe 'hi Number guifg='s:purple
exe 'hi Float guifg='s:purple
exe 'hi Boolean guifg='s:purple
exe 'hi Character guifg='s:purple
exe 'hi Label guifg='s:purple
" Function & Type
exe 'hi Function guifg='s:blue
exe 'hi Type guifg='s:blue
exe 'hi Identifier guifg='s:blue'  gui=italic'
exe 'hi StorageClass guifg='s:blue'  gui=italic'
" String
exe 'hi String guifg='s:brown

exe 'hi Special guifg='s:fg
exe 'hi Title guifg='s:fg'  gui=bold'

exe 'hi DiffAdd guifg=#fafafa guibg=#123d0f gui=bold'
exe 'hi DiffDelete guibg='s:gray70
exe 'hi DiffChange  guibg=#151b3c guifg=#fafafa'
exe 'hi DiffText guifg=#ffffff guibg=#ff0000 gui=bold'

exe 'hi Todo guibg='s:bg
exe 'hi ErrorMsg guifg='s:red' guibg='s:gray70' gui=bold'
exe 'hi WarningMsg guifg='s:bg' guibg='s:orange
exe 'hi SpecialKey guifg='s:gray20' guibg='s:gray70
exe 'hi Todo guifg='s:gray20'  gui=inverse,bold'
exe 'hi Underlined   gui=underline'

exe 'hi SpellCap guifg='s:blue' guibg=NONE cterm=underline'
exe 'hi SpellBad guifg='s:orange' guibg=NONE cterm=underline'
exe 'hi Error guifg='s:red' guibg=NONE cterm=underline'

" Neovim Terminal Mode
let g:terminal_color_0 = s:bg
let g:terminal_color_1 = s:red
let g:terminal_color_2 = s:beige
let g:terminal_color_3 = s:gray50
let g:terminal_color_4 = s:blue
let g:terminal_color_5 = s:beige
let g:terminal_color_6 = s:gray30
let g:terminal_color_7 = s:brown
let g:terminal_color_8 = s:gray70
let g:terminal_color_9 = s:orange
let g:terminal_color_10 = s:gray20
let g:terminal_color_11 = s:purple
let g:terminal_color_12 = s:blue
let g:terminal_color_13 = s:purple
let g:terminal_color_14 = s:gray40
let g:terminal_color_15 = s:gray50

" Ruby Highlighting
exe 'hi rubyAttribute guifg='s:beige
exe 'hi rubyLocalVariableOrMethod guifg='s:purple
exe 'hi rubyGlobalVariable guifg='s:purple' gui=italic'
exe 'hi rubyInstanceVariable guifg='s:purple
exe 'hi rubyKeyword guifg='s:beige
exe 'hi rubyKeywordAsMethod guifg='s:beige' gui=bold'
exe 'hi rubyClassDeclaration guifg='s:beige' gui=bold'
exe 'hi rubyClass guifg='s:beige' gui=bold'
exe 'hi rubyNumber guifg='s:purple

" Python Highlighting
exe 'hi pythonBuiltinFunc guifg='s:beige

" Go Highlighting
exe 'hi goBuiltins guifg='s:beige
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints      = 1
let g:go_highlight_chan_whitespace_error  = 1
let g:go_highlight_extra_types            = 1
let g:go_highlight_fields                 = 1
let g:go_highlight_format_strings         = 1
let g:go_highlight_function_calls         = 1
let g:go_highlight_function_parameters    = 1
let g:go_highlight_functions              = 1
let g:go_highlight_generate_tags          = 1
let g:go_highlight_operators              = 1
let g:go_highlight_space_tab_error        = 1
let g:go_highlight_string_spellcheck      = 1
let g:go_highlight_types                  = 1
let g:go_highlight_variable_assignments   = 1
let g:go_highlight_variable_declarations  = 1

" Javascript Highlighting
exe 'hi jsBuiltins guifg='s:beige
exe 'hi jsFunction guifg='s:beige' gui=bold'
exe 'hi jsGlobalObjects guifg='s:blue
exe 'hi jsAssignmentExps guifg='s:purple

" Html Highlighting
exe 'hi htmlLink guifg='s:purple' gui=underline'
exe 'hi htmlStatement guifg='s:beige
exe 'hi htmlSpecialTagName guifg='s:beige

" Markdown Highlighting
exe 'hi markdownH1 guifg='s:beige' gui=bold'
exe 'hi markdownH2 guifg='s:beige' gui=bold'
exe 'hi markdownH3 guifg='s:beige' gui=bold'
exe 'hi markdownH4 guifg='s:beige' gui=bold'
exe 'hi markdownH5 guifg='s:beige' gui=bold'
exe 'hi markdownH6 guifg='s:beige' gui=bold'
exe 'hi markdownBold gui=italic'
exe 'hi markdownItalic gui=italic'
exe 'hi markdownListMarker guifg='s:blue' gui=bold'
exe 'hi markdownOrderedListMarker guifg='s:blue' gui=bold'
exe 'hi markdownLinkText guifg='s:blue' gui=bold'
exe 'hi markdownLink guifg='s:beige' gui=bold'
exe 'hi markdownUrl guifg='s:beige' gui=bold'

" VimWiki Highlighting
exe 'hi VimwikiBold gui=bold'
exe 'hi VimwikiListTodo guifg='s:blue
exe 'hi VimwikiWebLink1 guifg='s:brown
