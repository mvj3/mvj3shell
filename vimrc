" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" |                                                                           |
" | Some highlights:                                                          |
" | jj = <esc>  Very useful for keeping your hands on the home row            |
" | ,n = toggle NERDTree off and on                                           |
" |                                                                           |
" | ,f = fuzzy find all files                                                 |
" | ,b = fuzzy find in all buffers                                            |
" |                                                                           |
" | hh = inserts '=>'                                                         |
" | aa = inserts '@'                                                          |
" |                                                                           |
" | ,h = new horizontal window                                                |
" | ,v = new vertical window                                                  |
" |                                                                           |
" | enter and shift-enter = adds a new line after and before the current line |
" |                                                                           |
" | :call Tabstyle_tabs = set tab to real tabs                                |
" | :call Tabstyle_spaces = set tab to 2 spaces                               |
" -----------------------------------------------------------------------------  

set nocompatible

" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

function! Tabstyle_tabs()
  " Using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
  autocmd User Rails set softtabstop=4
  autocmd User Rails set shiftwidth=4
  autocmd User Rails set tabstop=4
  autocmd User Rails set noexpandtab
endfunction

function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

if hostname() == "Macintosh.local"
  call Tabstyle_spaces()
else
  call Tabstyle_tabs() 
endif


" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent	(local to buffer)


" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4


" Windows *********************************************************************
"set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

"Vertical split then hop to new buffer
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>

" enable control + vim directionkey remapping [hjkl]
:noremap <C-J> <C-W>j
:noremap <C-K> <C-W>k
:noremap <C-H> <C-W>h
:noremap <C-L> <C-W>l

:noremap ,q :q<cr>
:noremap ,w :w<cr>

" Cursor highlights ***********************************************************
"set cursorline
"set cursorcolumn


" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase


" Colors **********************************************************************
"set t_Co=256 " 256 colors
"set background=dark 
syntax on " syntax highlighting
"colorscheme ir_black
colorscheme wombat


" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
set ch=2 " Make command line two lines high


" Line Wrapping ***************************************************************
"set nowrap
set linebreak  " Wrap at word


" Mappings ********************************************************************
" Professor VIM says '87% of users prefer jj over esc', jj abrams strongly disagrees
imap jj <Esc>
imap uu _
imap hh =>
imap aa @


" Directories *****************************************************************
" Setup backup location and enable
"set backupdir=~/backup/vim
"set backup

" Set Swap directory
"set directory=~/backup/vim/swap

" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h


" File Stuff ******************************************************************
filetype plugin indent on
" To show current filetype use: set filetype

"autocmd FileType html :set filetype=xhtml 


" Inser New Line **************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)


" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize


" Misc ************************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off the bell, this could be more annoying, but I'm not sure how
set noswapfile

" Set list Chars - for showing characters that are not
" normally displayed i.e. whitespace, tabs, EOL
function! Invisible_chars_show()
  set listchars=trail:.,tab:>-,eol:$
  set list
endfunction
function! Invisible_chars_hide()
  set nolist
endfunction


" Mouse ***********************************************************************
set mouse=a " Enable the mouse
behave xterm
set selectmode=mouse


" Cursor Movement *************************************************************
" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge


" Ruby stuff ******************************************************************
compiler ruby         " Enable compiler support for ruby
map <F5> :!ruby %<CR>


" Omni Completion *************************************************************
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete " may require ruby compiled in



" -----------------------------------------------------------------------------  
" |                              Pluggins                                     |
" -----------------------------------------------------------------------------  

" NERDTree ********************************************************************
:noremap ,n :NERDTreeToggle<CR>

" User instead of Netrw when doing an edit /foobar
let NERDTreeHijackNetrw=1

" Single click for everything
let NERDTreeMouseMode=1


" SnippetsEmu *****************************************************************
"imap <unique> <C-j> <Plug>Jumper
"let g:snip_start_tag = "_\."
"let g:snip_end_tag = "\._"
"let g:snip_elem_delim = ":"
"let g:snip_set_textmate_cp = '1'  " Tab to expand snippets, not automatically.


" fuzzyfinder_textmate ********************************************************
map ,f :FuzzyFinderTextMate<CR>
map ,b :FuzzyFinderBuffer<CR>
"let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'

" autocomplpop ***************************************************************
" complete option
set complete=.,w,b,u,t,k
let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2



" -----------------------------------------------------------------------------  
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------  

" Mac *************************************************************************
"if has("mac") 
  "" 
"endif
 
" Windows *********************************************************************
"if has("gui_win32")
  "" 
"endif



" -----------------------------------------------------------------------------  
" |                               Startup                                     |
" -----------------------------------------------------------------------------  
" Open NERDTree on start
"autocmd VimEnter * exe 'NERDTree' | wincmd l 







 
 
set nobackup
set nowritebackup
set history=50    " keep 50 lines of command line history
 
" Don't use Ex mode, use Q for formatting
map Q gq
 
" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp
 
 
" Only do this part when compiled with support for autocommands.
if has("autocmd")
 
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
 
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
 
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
 
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
 
  augroup END
 
else
 
  set autoindent    " always set autoindenting on
 
endif " has("autocmd")
 
if has("folding")
  set foldenable
  set foldmethod=syntax
  set foldlevel=1
  set foldnestmax=2
  set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
 
  " automatically open folds at the starting cursor position
  " autocmd BufReadPost .foldo!
endif
 
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
 
" Always display the status line
set laststatus=2
 
" \ is the leader character
let mapleader = "\\"
 
" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>
 
" Leader shortcuts for Rails commands
map <Leader>m :Rmodel 
map <Leader>c :Rcontroller 
map <Leader>v :Rview 
map <Leader>u :Runittest 
map <Leader>f :Rfunctionaltest 
map <Leader>tm :RTmodel 
map <Leader>tc :RTcontroller 
map <Leader>tv :RTview 
map <Leader>tu :RTunittest 
map <Leader>tf :RTfunctionaltest 
map <Leader>sm :RSmodel 
map <Leader>sc :RScontroller 
map <Leader>sv :RSview 
map <Leader>su :RSunittest 
map <Leader>sf :RSfunctionaltest 
 
" Hide search highlighting
map <Leader>h :set invhls <CR>
 
" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
 
" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
 
" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
 
" Maps autocomplete to tab
imap <Tab> <C-N>
 
" Duplicate a selection
" Visual mode: D
vmap D y'>p
 
" For Haml
au! BufRead,BufNewFile *.haml         setfiletype haml
 
" No Help, please
nmap <F1> <Esc>
 
" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>
 
" Display extra whitespace
set list listchars=tab:»·,trail:·
 
" Edit routes
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb
 
" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif
 
" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif
 
" Color scheme
highlight NonText guibg=#060606
highlight Folded  guibg=grey guifg=red
highlight FoldColumn guibg=darkgrey guifg=white
 
" Numbers
set number
set numberwidth=5
 
" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"
 
" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
 
" added for macvim code.google.com/p/macvim/faq
set imd
set go-=T

set bg=dark


" FoldSearch-based folding.
" Copyright (C) 2005 Mauricio Fernandez <mfp@acm.org>
" Current version: http://eigenclass.org/hiki.rb?Usable+Ruby+folding+for+Vim
"
" Add this to your .vimrc and fold with :R. The default fold expression will
" work with Ruby scripts; you can specify where folds start with
" let b:foldsearchexpr = 'myexpression'
" e.g.
"  let b:foldsearchexpr='\(^\s*\(\(private\|public\|protected\|class\)\s\)\)'
" or so for Java.
" One way to have this buffer-local variable set is
" au Filetype java let b:foldsearchexpr='\(^\s*\(\(private\|public\|protected\|class\)\s\)\)'
"
" It is possible to have comments above a method/class/etc be included in the
" fold, by setting b:foldsearchprefix. All the lines above the detected fold
" matching b:foldsearchprefix will be included in said fold.
" For instance, for Ruby code:
"   let b:foldsearchprefix = '\v^\s*(#.*)?$'
" which can be automated with
"   au Filetype ruby let b:foldsearchprefix='\v^\s*(#.*)?$'
"
" Changelog:
" 2005-12-12  1.1  use b:foldsearchprefix to prepend comments to a fold.

"{{{ set s:sid

map <SID>xx <SID>xx
let s:sid = maparg("<SID>xx")
unmap <SID>xx
let s:sid = substitute(s:sid, 'xx', '', '')

"{{{ FoldText
function! s:Num2S(num, len)
    let filler = "                                                            "
    let text = '' . a:num
    return strpart(filler, 1, a:len - strlen(text)) . text
endfunction

execute 'set foldtext=' .  s:sid . 'MyNewFoldText()'
function! <SID>MyNewFoldText()
	let linenum = v:foldstart
	while linenum <= v:foldend
	    let line = getline(linenum)
	    if !exists("b:foldsearchprefix") || match(line, b:foldsearchprefix) == -1
		break
	    else
		let linenum = linenum + 1
	    endif
	endwhile
	if exists("b:foldsearchprefix") && match(line, b:foldsearchprefix) != -1
	    " all lines matched the prefix regexp
	    let line = getline(v:foldstart)
	endif
	let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
	let diff = v:foldend - v:foldstart + 1
	return  '+ [' . s:Num2S(diff,4) . ']' . sub
endfunction

"{{{~foldsearch adapted from t77: Fold on search result (Fs <pattern>)
"Fs pattern Fold search
"Vimtip put to good use by Ralph Amissah zxy@irc.freenode.net
"Modified by Mauricio Fernandez <mfp@acm.org>
function! Foldsearch(search)
	setlocal fdm=manual
	let origlineno = line(".")
	normal zE
	normal G$
	let folded = 0     "flag to set when a fold is found
	let flags = "w"    "allow wrapping in the search
	let line1 =  0     "set marker for beginning of fold
	if a:search == ""
	    if exists("b:foldsearchexpr")
		let searchre = b:foldsearchexpr
	    else
		"Default value, suitable for Ruby scripts
		"\(^\s*\(\(def\|class\|module\)\s\)\)\|^\s*[#%"0-9]\{0,4\}\s*{\({{\|!!\)
		let searchre = '\v(^\s*(def|class|module|attr_reader|attr_accessor|alias_method)\s' . 
		             \ '|^\s*\w+attr_(reader|accessor)\s|^\s*[#%"0-9]{0,4}\s*\{(\{\{|!!))' .
		             \ '|^\s*[A-Z]\w+\s*\='
		let b:foldsearchexpr = searchre
	    endif
	else
	    let searchre = a:search
	endif
	while search(searchre, flags) > 0
		let  line2 = line(".")
		while line2 - 1 >= line1 && line2 - 1 > 0 "sanity check
		   let prevline = getline(line2 - 1)
		   if exists("b:foldsearchprefix") && (match(prevline, b:foldsearchprefix) != -1)
		       let line2 = line2 - 1
		   else
		       break
		   endif
		endwhile
		if (line2 -1 >= line1)
			execute ":" . line1 . "," . (line2-1) . "fold"
			let folded = 1       "at least one fold has been found
		endif
		let line1 = line2     "update marker
		let flags = "W"       "turn off wrapping
	endwhile
	normal $G
	let  line2 = line(".")
	if (line2  >= line1 && folded == 1)
		execute ":". line1 . "," . line2 . "fold"
	endif
	execute "normal " . origlineno . "G"
endfunction

"{{{~folds Fold Patterns
" Command is executed as ':Fs pattern'"
command! -nargs=? -complete=command Fs call Foldsearch(<q-args>)
command! -nargs=? -complete=command Fold call Foldsearch(<q-args>)
"command! R Fs \(^\s*\(\(def\|class\|module\)\s\)\)\|^\s*[#%"0-9]\{0,4\}\s*{\({{\|!!\)
command! R Fs 

" ########################################################################
"               END OF RUBY FOLDING
" ########################################################################







" -----------------------------------------------------------------------------
" |                              JavaScript                                   |
" -----------------------------------------------------------------------------
" javascript folding
let b:javascript_fold=1
" dom, html, css
let javascript_enable_domhtmlcss=1
