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

filetype plugin indent on

"
set list
set listchars=tab:\|\
"

"let fortran_fold=1
"set foldmethod=syntax
"set foldlevelstart=99


if has("syntax")
  syntax on
endif

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

""vundle plugin manager
set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()  
"plugins mangaged by Vundle should be placed between vundle#begin() and vundle#end()  
"let Vundle manage Vundle  
"required!   
Plugin 'VundleVim/Vundle.vim'  
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/winmanager'
Plugin 'vim-scripts/Indent-Guides'
Plugin 'vim-scripts/comments.vim'
Plugin 'vim-scripts/grep.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/minibufexpl.vim'
Plugin 'vim-scripts/graywh'
Plugin 'vim-scripts/compilergfortran.vim'
""vundle end
call vundle#end()
"filetype on
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

"插入当前时间，设置快捷键F5"
:nnoremap <F5> "=strftime("20%y/%m/%d %H:%M:%S  zt")<CR>gP
:inoremap <F5> <C-R>=strftime("20%y/%m/%d %H:%M:%S  zt")<CR>

:inoremap <F6> <C-R>=strftime("WRITE(u) ")<CR>


"打开窗口的大小
set lines=60 columns=109
"end

" mapped some annoying captial-sensitive command
:command WQ wq
:command Wq wq
:command W  w
:command Q  q


