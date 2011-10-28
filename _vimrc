colorscheme blackboard 

" Add Pep8 configuration
source ~/.vim/.vimrc-pep8

set softtabstop=4
set ruler
set showcmd
set hls
set is

set foldmethod=indent
set foldlevel=99

set number

syntax on
filetype on
filetype plugin indent on

" Set statusline
set statusline=%{fugitive#statusline()}\ %<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%d-%m-%Y\ %H:%M\")}%=\ col:%c%V\ pos:%o\ lin:%l\/%L\ %P
set laststatus=2

" Activate pathogen to simplify runtimepath management
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Map Ctrl+<movement> keys to move between buffers
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Map \td to open my task list
map <leader>td <Plug>TaskList

" Map \g to bring up the revision list
map <leader>g :GundoToggle<CR>

" Jump between Pep8 violations with \8
let g:pep8_map='<leader>8'

" Enable context sensitive autocompletion with SuperTab
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Map \n to show a file browser using NERD Tree
map <leader>n :NERDTreeToggle<CR>

" Map keys to ropevim for easy refactoring
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Map \a to Ack for easy searching of variable, class and method names
nmap <leader>a <Esc>:Ack!

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
