" Vim color file
" Maintainer:   Your name <youremail@something.com>
" Last Change:  
" URL:		

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

" your pick:
" set background=light	" or dark
set background=light

hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name="grayOnBlack"

"hi Normal

" OR

" highlight clear Normal
" set background&
" highlight clear
" if &background == "light"
"   highlight Error ...
"   ...
" else
"   highlight Error ...
"   ...
" endif

highlight clear



" A good way to see what your colorscheme does is to follow this procedure:
" :w 
" :so % 
"
" Then to see what the current setting is use the highlight command.  
" For example,
" 	:hi Cursor
" gives
"	Cursor         xxx guifg=bg guibg=fg 
 	


" Uncomment and complete the commands you want to change from the default.
" use :help highlight-groups for explanation of each group
" or :help GroupName
" or :help cterm<TAB>

let g:mydarkblue=17
let g:mydarkred=52
let g:mydarkgreen=22

hi Cursor	ctermfg=black guifg=black 
"hi CursorIM	
"hi CursorColumn
"hi CursorLine
"hi Directory	
hi DiffAdd ctermfg=black guifg=black ctermbg=blue guibg=blue
"hi DiffChange	ctermfg=black guifg=black
hi DiffChange ctermbg=53 guibg=DarkRed
"hi DiffDelete	
hi DiffText	ctermbg=52 guibg=DarkRed
"hi ErrorMsg	
"hi VertSplit	
hi Folded		ctermbg=17 guibg=DarkBlue
hi! def link FoldColumn	Folded
"hi SignColumn
"hi LineNr		
hi MatchParen ctermfg=black  ctermbg=DarkGray guifg=black guibg=DarkGray
"hi ModeMsg		
"hi MoreMsg		
"hi NonText		
" settings for popup menu
hi Pmenu ctermfg=black guifg=black
hi PmenuSel ctermfg=black guifg=black
hi PmenuSbar ctermfg=black guifg=black
"hi PmenuThumb

"hi Question	
hi Search	ctermfg=black ctermbg=green guifg=black guibg=green	
hi! default link IncSearch Search
"hi SpecialKey	
hi SpellBad ctermfg=black ctermbg=red guifg=black guibg=red
hi SpellCap ctermbg=blue ctermfg=black guibg=blue guifg=black
let g:mydarkcyan=23
hi SpellLocal ctermbg=23 guibg=DarkCyan 
hi! def link SpellRare SpellCap
"hi StatusLine	
"hi StatusLineNC	
"hi TabLine
"hi TabLineFill
"hi TabLineSel
"hi Title		
let g:myVeryDarkGray=235
hi Visual ctermbg=235 guifg=Gray20
"hi VisualNOS	
"hi WarningMsg	
"hi WildMenu	
"hi Menu		
"hi Scrollbar	
"hi Tooltip		



""""""""""""""""""""""""""""""
" syntax highlighting groups
""""""""""""""""""""""""""""""

"hi Comment


"hi Constant	
" subgroups
" light red
hi! String ctermfg=9 guifg=LightRed
"hi Character
"hi Number
" blue"
hi Boolean ctermfg=25
"hi Float


hi Identifier	ctermfg=DarkCyan guifg=DarkCyan
" subgroups
hi Function ctermfg=11 guifg=LightCyan
"
hi Statement	ctermfg=Yellow guifg=Yellow
" subgroups
"hi Conditional 
"hi Repeat 
"hi Label 
"hi Operator 
"hi Keyword 
"hi Exception
"
"
"hi PreProc	
" subgroups
"hi Include 
"hi Define 
"hi Macro
"
"
"
"hi Type		
" subgroups
"hi StorageClass 
"hi Structure 
"hi Typedef
"
"
hi Special	ctermfg=DarkYellow guifg=DarkYellow
" subroups
"hi Tag 
"hi SpecialChar 
"hi Delimiter 
"hi SpecialComment 
"hi Debug
"
"
"hi Underlined	
"hi Ignore		
hi! def link Error SpellBad		
"hi Todo		

