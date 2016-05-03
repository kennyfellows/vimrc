set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Add CtrlP Plugin 
set runtimepath^=~/.vim/bundle/ctrlp.vim

" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" React JSX highlighting/indenting
Plugin 'mxw/vim-jsx'

" incremental search and highlighting
Plugin 'haya14busa/incsearch.vim'

" Snipmate 
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Additional Snippets
Plugin 'scrooloose/snipmate-snippets'
Plugin 'rstacruz/vim-ultisnips-css'

" Auto refresh page on save 
Plugin 'jaxbot/browserlink.vim'

" Vim Airline for cool status bar 
Plugin 'bling/vim-airline'

" Twig highlighting 
Plugin 'beyondwords/vim-twig'

" NERD Tree
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete.vim'

" Plugin for commenting code blocks
Plugin 'scrooloose/nerdcommenter'
"
" Syntax and indentation javascript 
" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'pangloss/vim-javascript'

" Always close bracket 
Plugin 'Raimondi/delimitMate' 

" Python AutoComplete 
Plugin 'davidhalter/jedi'

" Hardmode plugin, no HJKL!!
Plugin 'wikitopian/hardmode' 

" Match tags... match open and closing tags
Plugin 'Valloric/MatchTagAlways'

" Ag fuzzy search 
Plugin 'rking/ag.vim' 

" Emmett autocomplete 
Plugin 'mattn/emmet-vim'

" Ack plugin 
Plugin 'mileszs/ack.vim' " Fuzzy search plugin 
Plugin 'scrooloose/syntastic' " Syntax checker plugin 
Plugin 'wincent/command-t' " Fast file search plugin 
let g:CommandTMaxFiles=50000

" Html autocomplete 
Plugin 'othree/html5.vim'

" Search files with context
Plugin 'dyng/ctrlsf.vim'

" More Snippets
Plugin 'SirVer/ultisnips'

" Editor Config
Plugin 'editorconfig/editorconfig-vim'

" jsDOC commenting 
Plugin 'heavenshell/vim-jsdoc'

" Autocompletion 
" Plugin 'Valloric/YouCompleteMe'

" Handlebars syntax highlights
Plugin 'mustache/vim-mustache-handlebars'

" End plugins here 
call vundle#end()

" Autocomplete closing parens with semicolon
autocmd FileType javascript inoremap (; ();<Esc>hi
" Auto complete closing brackets
autocmd FileType javascript inoremap {<CR> {<CR>}<Esc><S-o>
" set tabs to 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set undofile " Maintain undo history between sessions (persistent undo)
set undodir=~/.vim/undodir

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show line numbers by default
set number

if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
highlight Search ctermfg=black ctermbg=lightBlue

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
    set background=dark
    color mango
endif


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
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

else

    set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

" run neocomplete
"let g:neocomplete#enable_at_startup = 1

" Set mapleader key to the comma button
let mapleader = ","

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Indents 
filetype indent on
autocmd FileType html setlocal indentkeys-=*<Return>

" Jump to matching tag
nnoremap <leader>M :MtaJumpToOtherTag<cr>

" Open search with context (CtrlSF)
nnoremap <leader>sf :CtrlSF 

" Open last CtrlSF search
nnoremap <silent> <leader>r :CtrlSFOpen<CR>

" Place vim automatic backup files into backup directory 
set backupdir=~/vimtmp,.
set directory=~/vimtmp,.

" Always show status bar at bottom 
set laststatus=2  

" Set vim font 
set guifont=Terminus:h12

let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"  

" Change cursor depending on mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"" Keep search matches in the middle of the window and pulse the line
"nnoremap n nzzzv:call PulseCursorLine()<cr>
"nnoremap N Nzzzv:call PulseCursorLine()<cr> 

" Upon exiting VIM, open terminal and focus
" autocmd VimLeave * :!open -a Terminal

" }}}
" Pulse ------------------------------------------------------------------- {{{

function! PulseCursorLine()
    let current_window = winnr()

    windo set nocursorline
    execute current_window . 'wincmd w'

    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#2a2a2a
    redraw
    sleep 30m

    hi CursorLine guibg=#333333
    redraw
    sleep 30m

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 30m

    hi CursorLine guibg=#444444
    redraw
    sleep 30m

    hi CursorLine guibg=#4a4a4a
    redraw
    sleep 30m

    hi CursorLine guibg=#555555
    redraw
    sleep 30m

    execute 'hi ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction

" }}}
