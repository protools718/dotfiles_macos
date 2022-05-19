filetype plugin indent on
syntax on			" Enable Syntax Highlighting

let mapleader=" "			" Leader key is S P A C E

"==================================================================================
" => Document Formatting, Navigation, etc.
"==================================================================================

set autoindent					" align the new line indent with the previous line”
set backspace=indent,eol,start  " restore default backspace behaviour
set cursorline					" Highlight current line
set encoding=utf-8				" Enable UTF-8 support
set expandtab					" insert spaces when hitting TABs
set incsearch					" Search as you type
set mouse=nicr                  " enable mouse
set nohlsearch					" Disable Highlight search matches
set noswapfile					" new buffers created without swapfiles
set nu rnu						" Enable Hybrid line number mode
set scrolloff=8					" x number of lines seen above/below when scrolling
set shiftround					" round indent to multiple of 'shiftwidth'
set shiftwidth=4				" operation >> indents 4 columns; << unindents 4 columns
set smartindent					" Enable Smart Indent
set softtabstop=4				" insert/delete 4 spaces when hitting a TAB/BACKSPACE
set tabstop=4					" a hard TAB displays as 4 columns
set termguicolors				" Enable true color support
set textwidth=79				" lines longer than 79 columns will be broken
set ttyfast						" optimize for fast terminal connections
set undodir=~/.vim/undodir		" directory for undo history files
set undofile					" save undo history to dedicated file
set updatetime=300				" swapfile written after time in ms
set wildmenu					" Enhanced command completion

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-initialize Vim Plug if not already set up
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'gruvbox-community/gruvbox'		 " Gruvbox Theme
Plug 'joshdick/onedark.vim'				 " OneDark Theme
Plug 'jacoborus/tender.vim'				 " Tender Theme
Plug 'ryanoasis/vim-devicons'			 " Vim Dev Icons
Plug 'vim-airline/vim-airline'			 " Status line
Plug 'vim-airline/vim-airline-themes'    " Status line themes
Plug 'tpope/vim-commentary'              " Comment lines using 'gcc'
Plug 'tpope/vim-surround'                " Modify surrounding quotes/tags
Plug 'preservim/nerdtree'				 " Nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'		 " Nerdtree git plugin
Plug 'tpope/vim-fugitive'                " git wrapper
" Plug 'edkolev/tmuxline.vim'              " Enables airline in tmux

call plug#end()

"==================================================================================
" Modifiers For Installed Plugins
"==================================================================================

" Launch NERDTree with Ctrl + n
map <C-n> :NERDTreeToggle<CR>

" Close vim is NERDTree is only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme and Color adjustments
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use OneDark Theme
colorscheme onedark

" OneDark 256 color mode support
let g:onedark_termcolors=256

" Enable powerline fonts in airline
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright


" Split Navigation with Ctrl + HJKL
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" " Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K


" Don’t add empty newlines at the end of files
" set binary
" set noeol
" commenting these lines as I suspect this might conflict with other settings

" Toggles between absolute and hybrid line numbers
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" auto reload .vimrc
autocmd BufWritePost .vimrc source %
