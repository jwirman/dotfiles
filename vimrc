set nocompatible        " use vim defaults
set ch=2                " Make command line two lines high
set history=1000        " Set history size to allow searching of previous commands
set mousehide           " Hide the mouse when typing text
set number             " turn on line numbers
set ruler              " turn on ruler
set laststatus=2       " status bar
set vb                 " use a visual bell
set autoindent
set clipboard=unnamed  " copy to system clipboard
set background=dark
set t_Co=8

" whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=4
set softtabstop=4
set expandtab
set list listchars=tab:\>\ ,trail:·

" directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup


:hi Normal ctermbg=white

" default color scheme
colorscheme torte

"highlight NonText cterm=none ctermfg=0 guifg=#073642
"highlight NonText cterm=none ctermfg=2 guifg=#e82343
hi NonText term=bold ctermfg=3 guifg=#0000c0
" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
  syntax on
endif

" Switch on search pattern highlighting.
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show relative paths in buffer explorer.
let g:bufExplorerShowRelativePath=1  

" \h turns off highlighting
map <Leader>h :noh<CR>

" NERDTree configuration
"let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
" allow vcscommand to operate on directory
let g:NERDTreeHijackNetrw = 0
" \n toggles the nerd tree
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" cursor color/shape
if &term =~ "xterm"
  let &t_SI = "\<Esc>]12;purple\x7" " insert mode
  let &t_EI = "\<Esc>]12;blue\x7"
  "let &t_SI = "\033]12;purple\007"
  "let &t_EI = "\033]12;blue\007"

  " 1 or 0 -> blinking block
  " 2 -> solid block
  " 3 -> blinking underscore
  " 4 -> solid underscore
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
  let &t_SI .= "\<Esc>[4 q" " solid underscore
  let &t_EI .= "\<Esc>[2 q" " solid block
endif

" use ii to exit insert mode
:imap ii <Esc>

" use <ctrl-h,j,k,l> to select active window
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-l> :wincmd l<CR>

" , #perl # comments
map ,# :s/^/#/<CR>
" ,/ C/C++/C#/Java // comments
map ,/ :s/^/\/\//<CR>
" ,< HTML comment
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>
map ,> :%s/<!--\(\_.\{-}\)-->/ \1 /<CR><Esc>:nohlsearch<CR>
" c++ java style comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR><Esc>:nohlsearch<CR>

" scss syntax highlighting
au BufRead,BufNewFile *.scss set filetype=scss

" remove trailing whitespace from ruby files 
autocmd BufWritePre *.rb :%s/\s\+$//e
"autocmd FileType rb,erb autocmd BufWritePre <buffer> :%s/\s\+$//e

" to get coffee.vim to work...
filetype plugin indent on




"
"let g:ConqueTerm_InsertOnEnter = 0
"syntax on
"
"" Set encoding
"set encoding=utf-8
"
"
"" * Window Splits
"" Open new horizontal windows below.
"set splitbelow
"" Open new vertical windows to the right.
"set splitright
"
"
"
"" Tab completion
"set wildmode=list:longest,list:full
"set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
"
"
"" Without setting this, ZoomWin restores windows in a way that causes
"" equalalways behavior to be triggered the next time CommandT is used.
"" This is likely a bludgeon to solve some other issue, but it works
"set noequalalways
"
"
"
"" ZoomWin configuration
"map <Leader><Leader> :ZoomWin<CR>
"
"" CTags
"map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
"map <C-\> :tnext<CR>
"
"" Remember last location in file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif
"
"function s:setupWrapping()
"  set wrap
"  set wrapmargin=2
"  set textwidth=72
"endfunction
"
"function s:setupMarkup()
"  call s:setupWrapping()
"  map <buffer> <Leader>p :Hammer<CR>
"endfunction
"
"" History.
"set history=100
"
"" make uses real tabs
"au FileType make set noexpandtab
"
"" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
"au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
"
"" md, markdown, and mk are markdown and define buffer-local preview
"au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
"
"" add json syntax highlighting
"au BufNewFile,BufRead *.json set ft=javascript
"
"au BufRead,BufNewFile *.txt call s:setupWrapping()
"
"" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
"au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
"
"" allow backspacing over everything in insert mode
"set backspace=indent,eol,start
"
"" load the plugin and indent settings for the detected filetype
"filetype plugin indent on
"
"" Opens an edit command with the path of the currently edited file filled in
"" Normal mode: <Leader>e
"map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"
"" Opens a tab edit command with the path of the currently edited file filled in
"" Normal mode: <Leader>t
"map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
"
"" Inserts the path of the currently edited file into a command
"" Command mode: Ctrl+P
"cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
"
"" Unimpaired configuration
"" Bubble single lines
"nmap <C-Up> [e
"nmap <C-Down> ]e
"" Bubble multiple lines
"vmap <C-Up> [egv
"vmap <C-Down> ]egv
"
"" Enable syntastic syntax checking
"let g:syntastic_enable_signs=1
"let g:syntastic_quiet_warnings=1
"
"" gist-vim defaults
"if has("mac")
"  let g:gist_clip_command = 'pbcopy'
"elseif has("unix")
"  let g:gist_clip_command = 'xclip -selection clipboard'
"endif
"let g:gist_detect_filetype = 1
"let g:gist_open_browser_after_post = 1
"
"" Use modeline overrides
"set modeline
"set modelines=10
"
"
"" Make non-selected window's status bars readable
"autocmd ColorScheme * highlight StatusLineNC guifg=#555555 guibg=#202020
"
"
"" Turn off jslint errors by default
"let g:JSLintHighlightErrorLine = 0
"
"" MacVIM shift+arrow-keys behavior (required in .vimrc)
"let macvim_hig_shift_movement = 1
"
"" % to bounce from do to end etc.
"runtime! macros/matchit.vim
"
"" Show (partial) command in the status line
"set showcmd
"
"augroup BWCCreateDir
"  au!
"  autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
"augroup END
