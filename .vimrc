set nocompatible  " be iMproved, required
filetype off  " required
set exrc

set encoding=UTF-8

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

source $HOME/.vim/vpm/sources.vim

call vundle#end()
filetype plugin indent on

" ==== Colors and other basic settings
colorscheme gruvbox
" colorscheme C64
set guifont=Inconsolata\ 14
" set guifont=C64\ Pro\ Mono\ 8
set fillchars+=vert:\|
syntax enable
set background=dark
set ruler
set hidden
set number
set laststatus=2
set smartindent
set st=2 sw=2 et
set shiftwidth=2
set tabstop=2
let g:vim_json_syntax_conceal = 0
set colorcolumn=80
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set lines=999 columns=999

" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>

" ==== Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint', 'tslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'flake8', 'python' ]
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_python_flake8_config_file='.flake8'

" === typescript
let g:tsuquyomi_disable_default_mappings = 1
autocmd FileType typescript noremap <silent> <C-]> :TsuDefinition<CR>
autocmd FileType typescriptreact noremap <silent> <C-]> :TsuDefinition<CR>

" === flake8
let g:flake8_show_in_file=1

" ==== snippets
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_semantic_triggers =  { 'c' : ['->', '.', '::', 're!gl'], 'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s'] }
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/.ycm_extra_conf.py'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ==== Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)

" ==== moving around
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" ==== disable mouse
set mouse=c

" ==== disable swap file warning
set shortmess+=A

" === generate ctags
" echo "generating tags..."
" call system('ctags -R . ')

let g:pymode_indent = 0
" ==== custom commands
command JsonPretty execute ":%!python -m json.tool"
set secure
