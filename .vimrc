" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.

set nocompatible
"filetype plugin on
"filetype plugin indent on

"
set list
set listchars=tab:\┊\˰,

"fortran set up
let s:extfname = expand("%:e")
if s:extfname ==? "f90"
    let fortran_free_source=1
    unlet! fortran_fixed_source
else
    let fortran_fixed_source=1
    unlet! fortran_free_source
endif
"let fortran_have_tabs=1
let fortran_do_enddo=1
let fortran_more_precise=1
let SebuFortranGetFreeIndent=1
"let fortran_have_tabs=1
"let fortran_fold=1
"set foldmethod=syntax
"set foldlevelstart=99

" auto insert mode for brackets
if s:extfname != "tex"
    inoremap () ()<++><ESC>4hi
    inoremap {} {}<++><ESC>4hi
    inoremap [] []<++><ESC>4hi
    inoremap <F5> ! (*  *)<++><ESC>6hi
endif

" turn off latex equation preview
let g:tex_conceal = ""

filetype off
if has("syntax")
    syntax on
endif

filetype on
filetype indent on
filetype plugin on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

"no backup file
set writebackup
set nobackup
"显示行号
set nu!

" indentLine config
if s:extfname ==? "f"
    let g:indentLine_startColumn = 7
endif

autocmd FileType fortran setlocal et sta sw=2
autocmd FileType vim setlocal et sta sw=4 sts=4
autocmd FileType c setlocal et sta sw=4 sts=4
autocmd FileType tex setlocal tabstop=4
"set shiftwidth=2


call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/winmanager'
"Plug 'vim-scripts/Indent-Guides'
Plug 'vim-scripts/comments.vim'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/taglist.vim'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'jlanzarotta/bufexplorer'
Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'honza/vim-snippets' "auto complete
"Plug 'vim-scripts/minibufexpl.vim'
Plug 'vim-scripts/graywh' "color theme
"Plug 'vim-scripts/fortran.vim'
Plug 'vim-scripts/compilergfortran.vim'
Plug 'vim-latex/vim-latex'
Plug 'vim-scripts/VimIM'
Plug 'vim-scripts/fcitx.vim'
Plug 'vim-scripts/CSApprox' " using gvim theme under terminal vim
Plug 'vim-airline/vim-airline'
Plug 'godlygeek/tabular' "code alignment
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'Valloric/YouCompleteMe'
"Plug 'rudrab/vimf90'
"Plug 'bijancn/free-fortran.vim'
Plug 'TimoLin/indentLine'
Plug 'HendrikPetertje/vimify'
"Plug 'ybian/smartim'
call plug#end()

filetype on
filetype plugin on
filetype plugin indent on

colo graywh

"快捷键ctrl+F12,进入代码根目录，打开vim，按下快捷键自动生成tags并默认自动读取当前目录下的tags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"minibuf----
let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0
"end----

"winmanager----
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout='FileExplorer|TagList|BufExplorer'
let g:winManagerWidth=35
function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

nmap wm :WMToggle<CR>
"end----



"智能补全"
let g:NeoComplCache_EnableAtStartup = 1

"插入当前时间，设置快捷键F6"
:nnoremap <F6> "=strftime("20%y/%m/%d %H:%M:%S  zt")<CR>gP
:inoremap <F6> <C-R>=strftime("20%y/%m/%d %H:%M:%S  zt")<CR>

":inoremap <F6> <C-R>=strftime("WRITE(u) ")<CR>


"打开窗口的大小
"set lines=60 columns=109
"end

" mapped some annoying captial-sensitive command
:command WQ wq
:command Wq wq
:command W  w
:command-bang Q q<bang>
:nnoremap K k

let g:tex_flavor = "latex"
let g:Tex_Env_frame="\\begin{frame}{<+title+>}\<cr><++>\<cr>\\end{frame}<++>"
let g:Tex_Env_subfigure="\\begin{subfigure}{<+width+>}\<cr>\\centering\<cr>\\includegraphics[<+width+>]{<+figure+>}\<cr>\\end{subfigure}<++>"

"vim-airline smart tab line
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>
let g:airline_theme='bubblegum'
"let g:airline_solarized_bg='dark'

"Spotify Lyrics
let g:user_name="780apqgor2pffti3dc3ljj6oz"
let g:client_id="0879905d1e16424aa7a8f2d970159670"
let g:client_secret="ed07f900602f485f9a7d653eae460a20"

