filetype plugin indent on

if exists("syntax_on")
    syntax reset
endif

if has("multi_lang")
    language C
endif

if has("autocmd")
    autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType js          setlocal sw=2 sts=2 ts=2 et
    autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
    autocmd FileType json        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType css         setlocal sw=2 sts=2 ts=2 et
    autocmd FileType scss        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType sass        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType vue         setlocal sw=2 sts=2 ts=2 et
    autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
    autocmd FileType rust        setlocal sw=4 sts=4 ts=4 et
    autocmd FileType vim         setlocal sw=4 sts=4 ts=4 et
    autocmd FileType yaml         setlocal sw=2 sts=2 ts=2 et
    autocmd FileType netrw setl bufhidden=delete
endif

set runtimepath+=~/.config/vim
set fileencodings=utf-8
set wildignore+=log/**,tmp/**,target/**,dist/**,.bundle/**,.git/**,node_modules/**
set encoding=utf-8
set fileformats=unix,dos,mac
set nocompatible
set cwh=1
set visualbell t_vb=
set nobackup
set noswapfile
set noerrorbells
set autoread
set hidden
set virtualedit=onemore
set backspace=indent,eol,start
set breakindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set hlsearch
set incsearch
set whichwrap=b,s,h,l,<,>,[,]
set ignorecase
set pumheight=10
set foldlevel=200
set clipboard=unnamed
" set laststatus=2
set laststatus=1
set statusline=%f%m%=\ %{&fenc!=''?&fenc:&enc}
set display=lastline

command! Reload so ~/.config/vim/.vimrc

let g:fzf_layout = { 'down': '~40%' }
let g:snipMate = { 'snippet_version' : 1 }
let g:python3_host_prog = expand('/usr/local/bin/python3')
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
let g:go_fmt_command = "goimports"
let g:go_gocode_unimported_packages = 1
let dart_format_on_save = 1
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let s:treedepthstring= "-"
let mapleader = "\<Space>"
let loaded_matchparen = 1

nnoremap <C-n> :bn<cr>
nnoremap <C-p> :bp<cr>
nnoremap <esc><esc> :nohlsearch<cr>
nnoremap <silent>j gj
nnoremap <silent>k gk
nnoremap <Leader>f :<C-u>FZF<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>d :bw!<CR>
nnoremap <Leader>w :Gwrite<CR>
nnoremap <Leader>c :Gcommit<CR>
nnoremap <Leader><Leader> :vim  **<left><left><left>
nnoremap <C-a> 0
nnoremap <C-e> $
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-h> <Left>
vnoremap <silent> <expr> p <sid>Repl()

function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

function! s:remove_line_in_last_line()
    if getline('$') == ""
        $delete _
    endif
endfunction

" Plugins
call plug#begin('~/.config/vim/plugins')
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'dart-lang/dart-vim-plugin'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

" Highlights
hi! clear
hi! Comment     term=none cterm=none ctermfg=white ctermbg=black
hi! Directory   term=none cterm=none ctermfg=white ctermbg=black
hi! Constant    term=none cterm=none ctermfg=white ctermbg=black
hi! Identifier  term=none cterm=none ctermfg=white ctermbg=black
hi! Statement   term=none cterm=none ctermfg=white ctermbg=black
hi! PreProc     term=none cterm=none ctermfg=white ctermbg=black
hi! Type        term=none cterm=none ctermfg=white ctermbg=black
hi! Special     term=none cterm=none ctermfg=white ctermbg=black
hi! SpecialKey  term=none cterm=none ctermfg=white ctermbg=black
hi! Underlined  term=none cterm=none ctermfg=white ctermbg=black
hi! Ignore      term=none cterm=none ctermfg=white ctermbg=black
hi! Error       term=none cterm=none ctermfg=white ctermbg=black
hi! Todo        term=none cterm=none ctermfg=white ctermbg=black
hi! Folded      term=none cterm=none ctermfg=white ctermbg=black
hi! Question    term=none cterm=none ctermfg=white ctermbg=black
hi! SignColumn  term=none cterm=none ctermfg=white ctermbg=black
hi! MatchParen  term=none cterm=none ctermfg=white ctermbg=black
hi! NonText     term=none cterm=none ctermfg=black ctermbg=black
hi! ToolbarLine term=none cterm=none ctermfg=white ctermbg=black
hi! vimWarn     term=none cterm=none ctermfg=white ctermbg=black
hi! Search      term=none cterm=none ctermfg=black ctermbg=white
hi! DiffChange  term=none cterm=none ctermfg=black ctermbg=white
hi! VertSplit   term=none cterm=none ctermfg=white ctermbg=white
hi! CursorLine  term=none cterm=none ctermfg=black ctermbg=white
hi! StatusLineTerm  term=none cterm=none ctermfg=black ctermbg=white

" Utils
" :so $VIMRUNTIME/syntax/hitest.vim
" :so $VIMRUNTIME/syntax/colortest.vim
