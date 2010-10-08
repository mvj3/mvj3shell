" Encoding *******************************************************************
set fileencodings=utf-8,gbk,ucs-bom,cp936,gb2312,gb18030
set encoding=utf-8

set nocompatible
"set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O><F2>
set pastetoggle=<F2>

" Tabs ************************************************************************
" Convert tabs to spaces
set expandtab

" Display extra whitespace
autocmd User Rails set list listchars=tab:»·,trail:·

" Use 2 spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set smarttab

" overwrite it cause of damn rails
autocmd User Rails set noexpandtab
 
" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent	(local to buffer)


" Scrollbars ******************************************************************
set sidescrolloff=2

" Windows *********************************************************************
"set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

"Vertical split then hop to new buffer
":noremap ,v :vsp^M^W^W<cr>
:noremap ,v :vsp<cr>
:noremap ,h :split<cr>

" enable control + vim directionkey remapping [hjkl]
:noremap <C-J> <C-W>j
:noremap <C-K> <C-W>k
:noremap <C-H> <C-W>h
:noremap <C-L> <C-W>l

:noremap ,q :q<cr>
:noremap ,w :w<cr>
:noremap ,t :tabnew<cr>

"imap <F1> :holi<CR>

set showtabline=2 " File tabs allways visible

" Cursor highlights ***********************************************************
"set cursorline
"set cursorcolumn

" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase

" Colors **********************************************************************
set t_Co=256
set background=dark 
syntax on
colorscheme vividchalk

" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
set statusline=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %F%m%r%h%w
set laststatus=2

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
"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete " may require ruby compiled in

let filetype_m='objc'

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
"map ,f :FuzzyFinderTextMate<CR>
map ,f :FuzzyFinderFile<CR>
map ,b :FuzzyFinderBuffer<CR>
let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'

" autocomplpop ***************************************************************
" complete option
set complete=.,w,b,u,t,k
let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2

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
 
" Edit routes
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb
 
" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif
 
" Color scheme
highlight NonText guibg=#060606
highlight Folded  guibg=blue guifg=white
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
 
" -----------------------------------------------------------------------------
" |                              JavaScript                                   |
" -----------------------------------------------------------------------------
" javascript folding
"let b:javascript_fold=1
" dom, html, css
let javascript_enable_domhtmlcss=1
function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1


" Rcodetools *****************************************************************
let g:RCT_toggle_binding="<C-X><C-t>"  " use ^X^T to go test <=> implementation
let g:rct_completion_use_fri = 1  " 0 by default (disabled)
let g:rct_completion_info_max_len = 20 
let g:RCT_ri_cmd = "ri -T -f plain "
let g:RCT_ri_binding="<C-X><C-R>" " use ^X^R to call vim on current word

" 开启中文输入法
":let g:vimim_static_input_style=2

" 去除菜单栏
set guioptions-=m
set go-=T

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
 
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif
