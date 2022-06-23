if exists('g:vscode')
    " VSCode specific settings
else
    " ordinary neovim
    " Mouse use
    set mouse=a

    " Colors
    set background=dark
    colorscheme badwolf " colorscheme

    " Spaces & Tabs
    set tabstop=4 " number of spaces per TAB
    set softtabstop=4 "number of spaces in tab when editing
    set shiftwidth=4 "indent corresponds to single tab
    set expandtab "tabs = spaces
    set virtualedit=all
    filetype plugin indent on

    " UI Config
    set number " show line numbers
    set showcmd "show command bar
    set cursorline "highlight current line
    set wildmenu " visual autocomplete for cmd menu
    set showmatch "highlight matching parenthesis-like

    " Search
    set hlsearch "highlight matches
    set incsearch "search as characters are entered

    " Leader shortcuts
    let mapleader="," " leader is comma

    " Plugins downloaded to specified folder
    " vim-plug: Vim plugin manager
    " ============================
    " Plugins downloaded to specified folder
    call plug#begin('~/.local/share/nvim/plugged')

    " List of plugins
    " Pretty stuff
    Plug 'vim-airline/vim-airline' " airline
    Plug 'vim-airline/vim-airline-themes' " airline
    Plug 'nathanaelkane/vim-indent-guides' " indent guides
    " Git
    Plug 'tpope/vim-fugitive' " Git wrapper
    Plug 'airblade/vim-gitgutter' "Git
    " CtrlP
    Plug 'kien/ctrlp.vim' " Fuzzy finder
    " LSP config
    Plug 'neovim/nvim-lspconfig' " neovim language server protocol
    Plug 'williamboman/nvim-lsp-installer' " lsp installer
    " VIm table
    Plug 'dhruvasagar/vim-table-mode' " table mode for markdown
    " Julia
    Plug 'JuliaEditorSupport/julia-vim' " Julia-vim
    " pandoc
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    " deoplete autocomplete
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/deoplete-lsp'

    "   " Any valid git URL is allowed
    "   Plug 'https://github.com/junegunn/vim-github-dashboard.git'
    "
    "   " Multiple Plug commands can be written in a single line using | separators
    "   Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    "
    "   " On-demand loading
    "   Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    "   Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
    "
    "   " Using a non-master branch
    "   Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
    "
    "   " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
    "   Plug 'fatih/vim-go', { 'tag': '*' }
    "
    "   " Plugin options
    "   Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
    "
    "   " Plugin outside ~/.vim/plugged with post-update hook
    "   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    "
    "   " Unmanaged plugin (manually installed and updated)
    "   Plug '~/my-prototype-plugin'
    "
    " Initialize plugin system
    call plug#end()
    "
    "
    "Plugin settings

    " Indent guides
    let g:indent_guides_enable_on_vim_startup = 1

    "Airline settings
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1

    "Git Gutter
    let g:gitgutter_enabled = 1

    "CtrlP settings
    let g:ctrlp_map = '<Leader>t'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_match_window = 'bottom, order:ttb' "Order top to bottom
    let g:ctrlp_switch_buffer = 0 "Always open new files in new buffer

    " vim pandoc
    let g:pandoc#modules#disabled = ["folding"]
    let g:pandoc#biblio#use_bibtool = 1

    " deoplete
    let g:deoplete#enable_at_startup = 1
    " This is new style
    call deoplete#custom#var('omni', 'input_patterns', {
      \ 'pandoc': '@'
      \})


   "" Point YCM to the Pipenv created virtualenv, if possible
   "" At first, get the output of 'pipenv --venv' command.
   "let pipenv_venv_path = system('pipenv --venv')
   "" The above system() call produces a non zero exit code whenever
   "" a proper virtual environment has not been found.
   "" So, second, we only point YCM to the virtual environment when
   "" the call to 'pipenv --venv' was successful.
   "" Remember, that 'pipenv --venv' only points to the root directory
   "" of the virtual environment, so we have to append a full path to
   "" the python executable.
   "if v:shell_error == 0
   "  let venv_path = substitute(pipenv_venv_path, '\n', '', '')
   "  let g:ycm_python_binary_path = venv_path . '/bin/python3.6'
   "else
   "  let g:ycm_python_binary_path = 'python'
   "endif

    " Plug options:
    "
    "| Option                  | Description                                      |
    "| ----------------------- | ------------------------------------------------ |
    "| `branch`/`tag`/`commit` | Branch/tag/commit of the repository to use       |
    "| `rtp`                   | Subdirectory that contains Vim plugin            |
    "| `dir`                   | Custom directory for the plugin                  |
    "| `as`                    | Use different name for the plugin                |
    "| `do`                    | Post-update hook (string or funcref)             |
    "| `on`                    | On-demand loading: Commands or `<Plug>`-mappings |
    "| `for`                   | On-demand loading: File types                    |
    "| `frozen`                | Do not update unless explicitly specified        |
    "
    " More information: https://github.com/junegunn/vim-plug
endif
