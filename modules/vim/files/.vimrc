se cmdheight=1 " Avoids "press <Enter> to continue"
se noswapfile
se nobackup
se nocp
se cpoptions-=< " allow '<keycode>' forms in mappings, e.g. <CR>
se backspace=indent,eol,start
syntax enable 
colorscheme darkblue
se hls " Highlight search matches, and set incremental searching on ***
se incsearch 
se laststatus=2 " Always have status line
se stl=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" prevent the comment character from forcibly being inserted in column 1
inoremap # X<BS>#
se cinkeys-=0#    " # in column 1 does not prevent >> from indenting
se indentkeys-=0#
filetype on
filetype plugin on
se foldlevelstart=99
se report=0
se hi=50
se ts=4
se nowrap
se expandtab
se sw=2
se autoindent
se smartindent
se ignorecase
se fdm=marker

if (has("win32") || has("win16") || has("win64") || has("win32unix") || has("win95")) 
  behave mswin
endif

se hidden " Allow go between buffers without writing changes 
" Use SHIFT-CTRL-p/n to go between buffers
map <M-.> :bn<CR>
map <M-,> :bp<CR>
map! <M-.> <ESC>:bn<CR>
map! <M-,> <ESC>:bp<CR>
"" CTRL-Tab for same
map <C-Tab> <M-n>
map <C-S-Tab> <M-p>
map! <C-Tab> <M-n>
map! <C-S-Tab> <M-p>
" F12 or CTRL-S to save all changes.
" Always leaves you in normal mode.
map <F12> <ESC><ESC>:wa<CR>
map! <F12> <ESC><ESC>:wa<CR>
map <C-S> <F12>
map! <C-S> <F12>

" Insert datetime when you press F5 like in notepad
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>

" Allow different python interpreters to be used...
let g:interpreter = "c:\\python27\\python"
se makeprg="".g:interpreter
function! ToggleInterpreter()
  if g:interpreter == "c:\\python27\\python"
    let g:interpreter = "c:\\ironpython\\ipy"
  else 
    let g:interpreter = "c:\\python27\\python" 
  endif  
  se makeprg="".g:interpreter
  ec g:interpreter
endfunction

map <F8> :let g:makefile=expand('%:p')<cr>
map! <F8> <esc>:let g:makefile=expand('%:p')<cr>i
map <S-F8> :call ToggleInterpreter()<cr>
map! <S-F8> <esc>:call ToggleInterpreter()<cr>i
map <S-F9> <F12>:exec "!".g:interpreter." ".g:makefile<CR>
map! <S-F9> <F12>:exec "!".g:interpreter." ".g:makefile<CR>
map <F9> <F12>:e out<cr>ggdG:exec "r !".g:interpreter." ".g:makefile<cr>
map! <F9> <F12>:e out<cr>ggdG:exec "r !".g:interpreter." ".g:makefile<cr>
map <C-F9> <F12>:exec "make ".g:makefile<cr>:cla<cr>:cc<cr>
map! <C-F9> <F12>:exec "make ".g:makefile<cr>:cla<cr>:cc<cr>

function! FileType_Python()
    "set errorformat=\ \ File\ \"%f\"\\,\ line\ %l%.%#,
    "the last line: \%-G%.%# is meant to suppress some
    "late error messages that I found could occur e.g.
    "with wxPython and that prevent one from using :clast
    "to go to the relevant file and line of the traceback.
    setlocal errorformat=
	\%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
	\%C\ \ \ \ %.%#,
	\%+Z%.%#Error\:\ %.%#,
	\%A\ \ File\ \"%f\"\\\,\ line\ %l,
	\%+C\ \ %.%#,
	\%-C%p^,
	\%Z%m,
	\%-G%.%#

    " A little trick to stop # char taking to col 1 :h smartindent
    inoremap # x#<left><left><del><right>

endfunction

autocmd BufNew,BufRead *.py call FileType_Python()
