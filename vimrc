": Start highlighting and set default for 'background'
syntax on

" Print the line number in front of each line
set number

" Show the line and column number of the cursor position, separated by a comma
set ruler

" Copy indent from current line when starting a new line
set autoindent

" (light/dark) Vim will try to use colors that look good on a light/dark background
set background=dark

" When a bracket is inserted, briefly jump to the matching on
set showmatch

" Enable automatic C program indenting
set cindent

" Number of space that a <Tab> in the file counts for
" There are four main ways to use tabs in Vim...
set shiftwidth=2
set tabstop=2
set expandtab

" When there is a previous search pattern, highlight all its matches
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>

set foldmethod=syntax

set textwidth=0

" Set to auto read when a file is changed from the outside
set autoread

" Onctal number - avoid increase from 07 to 10 with Ctrl-a
set nrformats-=octal

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

" Borrar una línea en insert mode
imap <C-d> <ESC> dd i

" Corrector ortográfico (aspell)
map <C-F10> :w!<CR>:!aspell -d es -c %<CR>:e! %<CR>
map <C-F11> :w!<CR>:!aspell -d en -c %<CR>:e! %<CR>
map <C-F9> :w!<CR>:!aspell --encoding=iso-8859-1 -d es -c %<CR>:e! %<CR>

" Highlighting the current line & column in VIM
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline 
set cursorcolumn

"hi CursorLine cterm=none ctermbg=0
"hi CursorColumn term=none cterm=none ctermbg=7

set iskeyword+=_

"set colorcolumn=80

"imap qq <Esc>

" -------------------------------- vim-latexsuite ------------------------------
" REQUIRED. This makes vim invoke latex-suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that lates
" can be called correctly.
" set sellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

let g:tex_flavor = "latex"

let g:Tex_GotoError=0

let g:Tex_IgnoredWarnings =
       \"Underfull\n".
       \"Overfull\n".
       \"specifier changed to\n".
       \"You have requested\n".
       \"Missing number, treated as zero.\n".
       \"There were undefined references\n".
       \"Citation %.%# undefined\n".
       \"contains only floats."
let g:Tex_IgnoreLevel = 8
" ------------------------------------------------------------------------------


source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

" Opciones gvim (GUI)
"colorscheme desert
"colorscheme delek
"colorscheme elflord
"colorscheme evening
"colorscheme koehler
"colorscheme murphy
"colorscheme pablo
"colorscheme ron
"colorscheme slate
colorscheme torte
"colorscheme zellner

let g:alternateSearchPath='sfr:../h,sfr:../src'
map <F2> <ESC> :A <CR>
let g:C_GlobalTemplateFile=$HOME.'/.vim/ciii_cpp_templates/Templates'
let g:C_LineEndCommColDefault = 60


" ------------------------------------------------------------------------------
let g:NERDTreeWinSize = 45
autocmd VimEnter *.c,*.cc,*.cpp,*.cxx,*.h,*.hpp,*.m,*.world,*.cfg NERDTree
autocmd BufEnter *.c,*.cc,*.cpp,*.cxx,*.h,*.hpp,*.m,*.world,*.cfg NERDTreeMirror
autocmd VimEnter *.c,*.cc,*.cpp,*.cxx,*.h,*.hpp,*.m,*.world,*.cfg wincmd p

" NERD Tree
nmap <silent> <special> <F9> :NERDTreeToggle<RETURN>

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" ------------------------------------------------------------------------------
let mapleader=","
let maplocalleader=","
let g:EnhCommentifyFirstLineMode='Y'

" ------------------------------------------------------------------------------
"  Splitting
"map <A-J> <C-W>j<C-W>_
"map <A-K> <C-W>k<C-W>_
map _ <C-W>_
map + <C-W>+
map - <C-W>-
map < <C-W><
map > <C-W>>
"map <C-=> <C-W>=
map <Tab> <C-W>w
"map <Bar> <C-W>v<C-W><Right>
"map -     <C-W>s<C-W><Down>

set splitbelow
set splitright

" ------------------------------------------------------------------------------
" Octave syntax
" (NOTA: modificar EnhancedCommentify.vim, agregar octave al lado de matlab)
"augroup filetypedetect
"  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
"au BufNewFile,BufRead ciii.frc.utn.edu.ar* setf moin
"augroup END 
" Use keywords from Octave syntax language file for autocomplete
"if has("autocmd") && exists("+omnifunc")
"  autocmd Filetype octave
"  \ if &omnifunc == "" |
"  \ setlocal omnifunc=syntaxcomplete#Complete |
"  \ endif
"endif 

" GNU/Octave info
autocmd FileType matlab setlocal keywordprg=info\ octave\ --vi-keys\ --index-search
" with Rik's octave.vim (syntax file)
"autocmd FileType octave setlocal keywordprg=info\ octave\ --vi-keys\ --index-search

"if &term =~ "xterm\\|rxvt"
"    " use an orange cursor in insert mode
"    let &t_SI = "\<Esc>]12;orange\x7"
"    " use a red cursor otherwise
"    let &t_EI = "\<Esc>]12;red\x7"
"    silent !echo -ne "\033]12;red\007"
"    " reset cursor when vim exits
"    autocmd VimLeave * silent !echo -ne "\033]112\007"
"    " use \003]12;gray\007 for gnome-terminal
"endif


execute pathogen#infect()

nmap \l :setlocal number!<CR>
nmap \o :set paste!<CR>

