set ch=2               " make command line two lines high
set lines=44           " default width of new window
set columns=84         " default hight of new window
set number             " turn on line numbers
set ruler              " turn on ruler
set vb                 " use a visual bell
set mousehide          " hide the mouse when typing text
set laststatus=2       " always show a status line
set showtabline=2      " always show a tab line
set guioptions=gmLt
set guifont=Monaco:h14
winpos 760 10          " default position of top left corner
set writebackup        " make a backup before overwriting a file
set nobackup           " remove backup file created above after successful write
set nowrap             " don't wrap text
set expandtab          " use spaces when inserting a tab
set softtabstop=2      " number of spaces used when pushing tab key
set shiftwidth=2       " number of spaces to use for each auto-indent
set hlsearch           " switch on search pattern highlighting.

" use ii to exit insert mode
:imap ii <Esc>

if !exists("syntax_on")
  syntax on            " switch on syntax highlighting if it wasn't on yet.
endif

"colorscheme darkblue
colorscheme torte
  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when \":lmap\" mappings are active
  " Constants are not underlined but have a slightly lighter background
"  highlight Normal guibg=grey90
"  highlight Cursor guibg=Green guifg=NONE
"  highlight lCursor guibg=Cyan guifg=NONE
"  highlight NonText guibg=grey80
"  highlight Constant gui=NONE guibg=grey95
"  highlight Special gui=NONE guibg=grey95

" , #perl # comments
map ,# :s/^/#/<CR>
" ,/ C/C++/C#/Java // comments
map ,/ :s/^/\/\//<CR>
" ,< HTML comment
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>
map ,> :%s/<!--\(\_.\{-}\)-->/ \1 /<CR><Esc>:nohlsearch<CR> 
" c++ java style comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR><Esc>:nohlsearch<CR>


" old stuff
"cd /Users/justin.wirman
"map <S-Insert> <MiddleMouse> " Make shift-insert work like in Xterm
"map! <S-Insert> <MiddleMouse>
"let c_comment_strings=1 "highlight strings inside C comments



"if has("gui_macvim")
"  set guifont=Monaco:h13.00
"
"  " Fullscreen takes up entire screen
"  set fuoptions=maxhorz,maxvert
"
"  " Command-T for CommandT
"  macmenu &File.New\ Tab key=<D-T>
"  map <D-t> :CommandT<CR>
"  imap <D-t> <Esc>:CommandT<CR>
"
"  " Command-Return for fullscreen
"  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
"
"  " Command-Shift-F for Ack
"  map <D-F> :Ack<space>
"
"  " Command-e for ConqueTerm
"  map <D-e> :call StartTerm()<CR>
"
"  " Command-/ to toggle comments
"  map <D-/> <plug>NERDCommenterToggle<CR>
"  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
"
"
  " Command-R for Run Focused Test"
"  map <D-r> :RunAllRubyTests<CR>
"  imap <D-r> <Esc>:RunAllRubyTests<CR>
"  map <D-R> :RunRubyFocusedUnitTest<CR>
"  imap <D-R> <Esc>:RunRubyFocusedUnitTest<CR>
"  map <D-E> :RunLastRubyTest<CR>
"  imap <D-E> <Esc>:RunLastRubyTest<CR>
"  map <D-C> :RunRubyFocusedContext<CR>
"  imap <D-C> <Esc>:RunRubyFocusedContext<CR>
"
"  " Command-][ to increase/decrease indentation
"  vmap <D-]> >gv
"  vmap <D-[> <gv
"
"  " Map Command-# to switch tabs
"  map  <D-0> 0gt
"  imap <D-0> <Esc>0gt
"  map  <D-1> 1gt
"  imap <D-1> <Esc>1gt
"  map  <D-2> 2gt
"  imap <D-2> <Esc>2gt
"  map  <D-3> 3gt
"  imap <D-3> <Esc>3gt
"  map  <D-4> 4gt
"  imap <D-4> <Esc>4gt
"  map  <D-5> 5gt
"  imap <D-5> <Esc>5gt
"  map  <D-6> 6gt
"  imap <D-6> <Esc>6gt
"  map  <D-7> 7gt
"  imap <D-7> <Esc>7gt
"  map  <D-8> 8gt
"  imap <D-8> <Esc>8gt
"  map  <D-9> 9gt
"  imap <D-9> <Esc>9gt
"
  " Remap jj to Esc"
"  imap jj <Esc>
"
"  " Command-Option-ArrowKey to switch viewports
"  map <D-M-Up> <C-w>k
"  imap <D-M-Up> <Esc> <C-w>k
"  map <D-M-Down> <C-w>j
"  imap <D-M-Down> <Esc> <C-w>j
"  map <D-M-Right> <C-w>l
"  imap <D-M-Right> <Esc> <C-w>l
"  map <D-M-Left> <C-w>h
"  imap <D-M-Left> <C-w>h
"
"  " Adjust viewports to the same size
"  map <Leader>= <C-w>=
"  imap <Leader>= <Esc> <C-w>=
"endif
"
"" Don't beep
"set visualbell
"
"" Start without the toolbar
"set guioptions-=T
"
"" Default gui color scheme
"color ir_black
"
"" ConqueTerm wrapper
"function StartTerm()
"  execute 'ConqueTerm ' . $SHELL . ' --login'
"  setlocal listchars=tab:\ \ 
"endfunction
"
"" Project Tree
"autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
"autocmd FocusGained * call s:UpdateNERDTree()
"autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
"
"" Close all open buffers on entering a window if the only
"" buffer that's left is the NERDTree buffer
"function s:CloseIfOnlyNerdTreeLeft()
"  if exists("t:NERDTreeBufName")
"    if bufwinnr(t:NERDTreeBufName) != -1
"      if winnr("$") == 1
"        q
"      endif
"    endif
"  endif
"endfunction
"
"" If the parameter is a directory, cd into it
"function s:CdIfDirectory(directory)
"  let explicitDirectory = isdirectory(a:directory)
"  let directory = explicitDirectory || empty(a:directory)
"
"  if explicitDirectory
"    exe "cd " . fnameescape(a:directory)
"  endif
"
"  " Allows reading from stdin
"  " ex: git diff | mvim -R -
"  if strlen(a:directory) == 0 
"    return
"  endif
"
"  if directory
"    NERDTree
"    wincmd p
"    bd
"  endif
"
"  if explicitDirectory
"    wincmd p
"  endif
"endfunction
"
"" NERDTree utility function
"function s:UpdateNERDTree(...)
"  let stay = 0
"
"  if(exists("a:1"))
"    let stay = a:1
"  end
"
"  if exists("t:NERDTreeBufName")
"    let nr = bufwinnr(t:NERDTreeBufName)
"    if nr != -1
"      exe nr . "wincmd w"
"      exe substitute(mapcheck("R"), "<CR>", "", "")
"      if !stay
"        wincmd p
"      end
"    endif
"  endif
"
"  if exists(":CommandTFlush") == 2
"    CommandTFlush
"  endif
"endfunction
"
"" Utility functions to create file commands
"function s:CommandCabbr(abbreviation, expansion)
"  execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
"endfunction
"
"function s:FileCommand(name, ...)
"  if exists("a:1")
"    let funcname = a:1
"  else
"    let funcname = a:name
"  endif
"
"  execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
"endfunction
"
"function s:DefineCommand(name, destination)
"  call s:FileCommand(a:destination)
"  call s:CommandCabbr(a:name, a:destination)
"endfunction
"
"" Public NERDTree-aware versions of builtin functions
"function ChangeDirectory(dir, ...)
"  execute "cd " . fnameescape(a:dir)
"  let stay = exists("a:1") ? a:1 : 1
"
"  NERDTree
"
"  if !stay
"    wincmd p
"  endif
"endfunction
"
"function Touch(file)
"  execute "!touch " . shellescape(a:file, 1)
"  call s:UpdateNERDTree()
"endfunction
"
"function Remove(file)
"  let current_path = expand("%")
"  let removed_path = fnamemodify(a:file, ":p")
"
"  if (current_path == removed_path) && (getbufvar("%", "&modified"))
"    echo "You are trying to remove the file you are editing. Please close the buffer first."
"  else
"    execute "!rm " . shellescape(a:file, 1)
"  endif
"
"  call s:UpdateNERDTree()
"endfunction
"
"function Mkdir(file)
"  execute "!mkdir " . shellescape(a:file, 1)
"  call s:UpdateNERDTree()
"endfunction
"
"function Edit(file)
"  if exists("b:NERDTreeRoot")
"    wincmd p
"  endif
"
"  execute "e " . fnameescape(a:file)
"
"ruby << RUBY
"  destination = File.expand_path(VIM.evaluate(%{system("dirname " . shellescape(a:file, 1))}))
"  pwd         = File.expand_path(Dir.pwd)
"  home        = pwd == File.expand_path("~")
"
"  if home || Regexp.new("^" + Regexp.escape(pwd)) !~ destination
"    VIM.command(%{call ChangeDirectory(fnamemodify(a:file, ":h"), 0)})
"  end
"RUBY
"endfunction
"
"" Define the NERDTree-aware aliases
"call s:DefineCommand("cd", "ChangeDirectory")
"call s:DefineCommand("touch", "Touch")
"call s:DefineCommand("rm", "Remove")
"call s:DefineCommand("e", "Edit")
"call s:DefineCommand("mkdir", "Mkdir")
"
"" Include user's local vim config
"if filereadable(expand("~/.gvimrc.local"))
"  source ~/.gvimrc.local
"endif
