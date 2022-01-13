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
"set list
"set listchars=tab:\┊\˰,
set ts=4
set shiftwidth=4
set expandtab

"Cursor
"set cursorline

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

" No backup file
set writebackup
set nobackup
" Show line number
set nu!

" indentLine config
if s:extfname ==? "f"
    " Fortran Fixed Format
    let g:indentLine_startColumn = 7
endif
if s:extfname ==? "json"
    let g:indentLine_enabled = 0
endif
if s:extfname ==? "md"
    let g:indentLine_enabled = 0
endif

" Tab settings for different filetype
autocmd FileType fortran setlocal et sta sw=2
autocmd FileType vim setlocal et sta sw=4 sts=4
autocmd FileType c setlocal et sta sw=4 sts=4
autocmd FileType tex setlocal tabstop=4
autocmd FileType yaml setlocal sw=2 ts=2 et ai
autocmd FileType gitcommit setlocal et sta sw=4 sts=4


call plug#begin('~/.vim/plugged')
" File system explorer
Plug 'preservim/nerdtree'
Plug 'vim-scripts/winmanager'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'Shougo/neocomplete.vim'
" Comment using \cc
Plug 'scrooloose/nerdcommenter'
" Auto complete code snippets
"Plug 'honza/vim-snippets' 
"Plug 'vim-scripts/minibufexpl.vim'
Plug 'vim-scripts/graywh' "color theme
Plug 'vim-latex/vim-latex'
Plug 'vim-scripts/fcitx.vim'
" using gvim theme under terminal vim
Plug 'vim-scripts/CSApprox' 
" Code alignment using :Tab/*, * is the divide marker
Plug 'godlygeek/tabular' 
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'Valloric/YouCompleteMe', { 'commit':'d98f896' }
"Plug 'rudrab/vimf90'
"Plug 'bijancn/free-fortran.vim'
"Plug 'vim-scripts/fortran.vim'
Plug 'vim-scripts/compilergfortran.vim'
" My indeltLine 
Plug 'TimoLin/indentLine'
" Comment using <Ctrl-C> <Ctrl-X>
Plug 'TimoLin/foam-comments'
"Plug 'vim-scripts/comments.vim'
" Take control of Spotify in vim
Plug 'HendrikPetertje/vimify'
Plug 'phresher/vim-openfoam'
" Jump to any location specifed by two letter by s
Plug 'justinmk/vim-sneak'
Plug 'tell-k/vim-autopep8'
" Bibtex auto-completion with vim-latex
Plug 'GCBallesteros/vim-autocite'
Plug 'srcery-colors/srcery-vim'
" Matlab plugin
Plug 'andymass/vim-matlab'
" C++ syntax highlighting
Plug 'bfrg/vim-cpp-modern'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

filetype on
filetype plugin on
filetype plugin indent on

" GUI: srcery, TUI: graywh
if has("gui_running")
    colorscheme srcery
else
    colo graywh
endif

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
:command Qa qa
:command-bang Q q<bang>
" map K to k to avoid K show help

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

"YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_extra_conf_globlist=["~/.ycm_extra_conf.py","~/OpenFOAM/OpenFOAM-2.3.1/.ycm_extra_conf.py","~/OpenFOAM/fpvFoam/.ycm_extra_conf.py","~/OpenFOAM/deltaFoam/.ycm_extra_conf.py"]

" VIM-autopep8 autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR> 
" Clang-Format
map <C-K> :py3file /usr/share/clang/clang-format-13/clang-format.py<cr>
imap <C-K> <c-o>:py3file /usr/share/clang/clang-format-13/clang-format.py<cr>

" Python add header
:nnoremap <F7> iif __name__ == "__main__":<CR>
:inoremap <F7> if __name__ == "__main__":<CR>

" ** coc.nvim configs**

" coc.nvim plugins
let g:coc_global_extensions = [ 'coc-pyright', 'coc-vimlsp']

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
