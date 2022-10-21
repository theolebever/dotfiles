"  _   __(_)___ ___  __________
" | | / / / __ `__ \/ ___/ ___/
" | |/ / / / / / / / /  / /__
" |___/_/_/ /_/ /_/_/   \___/

" Basics

        let mapleader=" "
        set nocompatible
        filetype plugin on
        filetype plugin indent on
        syntax on
        set encoding=utf-8
        set number relativenumber

"Set Delete key  working on MacOS
		set backspace=indent,eol,start
" Error column on the right
        set signcolumn=yes

" Line never to exceed
        set colorcolumn=80

" No annoying swap file
        set noswapfile

" Incremental search
        set incsearch

" Erase highlight when search is done
        set nohlsearch

" set tab size
        set tabstop=4

" Display unprintable chars f12
        set list
        set listchars=tab:⇒\ ,trail:•,extends:»,precedes:«

" Disable automatic commenting on new line
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set spellcheck to SP o (orthography) + n (English)
        map <leader>o :setlocal spell! spelllang=en <CR>

" Splits at the bottom and right
        set splitbelow splitright

" Shortcutting split navigation
        map <C-j> <C-w>h
        map <C-k> <C-w>j
        map <C-i> <C-w>k
        map <C-l> <C-w>l

" Ensure files are read as they should
        let g:vimwiki_ext2syntax={'.Rmd': 'markdown', '.rmd': 'markdown', '.md': 'markdown', '.markdown': "markdown", '.mdown': 'markdown'}
        autocmd BufRead,BufNewFile /tmp/calcurse*.,~/.calcurse/notes/* set filetype=markdown
        autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
        autocmd BufRead,BufNewFile *.tex set filetype=tex

" Airline
        let g:airline_theme='ayu_dark'
        let g:airline_powerline_fonts=1
        let g:airline#extensions#tabline#enabled=1

" NERDtree
        map <leader>n :NERDTreeToggle<CR>

" Remap Fzf :
        nnoremap <silent> <s-f> :Files<CR>
        nnoremap <silent> <C-f> :Rg<CR>

" Clang Format on c file
		autocmd FileType c ClangFormatAutoEnable
		let g:clang_format#detect_style_file=1
		let g:clang_format#enable_fallback_style=0
		let g:clang_format#auto_format=1

call plug#begin('~/.vim/plugged')

" Best file explorer for vim
Plug 'preservim/nerdtree'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Bar at the bottom of the editor, so handful
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax checking and semantic error
Plug 'dense-analysis/ale'

" color schemes
Plug 'hzchirs/vim-material'
Plug 'ayu-theme/ayu-vim'

" Clang Format for vim

Plug 'rhysd/vim-clang-format'

" Auto close tag
Plug 'townk/vim-autoclose'

call plug#end()

" Colorscheme
        set t_Co=256
        set termguicolors

        " ayu
                 let ayucolor="dark"
                 colorscheme ayu

        " challenger-deep
                " colorscheme challenger_deep

        " deus
                " set background=dark
                " colorscheme deus
                " let g:deus_termcolors=256

        " rigel
                " colorscheme rigel

        " gruvbox
                " set background=dark
                " colorscheme gruvbox
                " let g:gruvbox_contrast_dark = 'medium'

        " solarized
                " set background=dark
                " colorscheme solarized
        " material ocean
                "set background=dark
                "let g:material_style='oceanic'
                "colorscheme vim-material

" Functions

fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
endfun

fun! TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

augroup BELVEDERE
        autocmd!
        autocmd BufWritePre * :call TrimWhitespace()
        autocmd BufWritePre * :call TrimEndLines()
augroup END
