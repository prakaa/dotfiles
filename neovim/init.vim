if exists('g:vscode')
    " VSCode specific settings
    " Map up/down to scroll by visual lines
    imap <up> <C-O>gk
    imap <down> <C-O>gj
    nmap <up> gk
    nmap <down> gj
    vmap <up> gk
    vmap <down> gj
    " Keep visual block selected after indent
    vmap > >gv
    vmap < <gv
    " Yank from cursor to line end
    nnoremap Y y$
else
    " Map up/down to scroll by visual lines
    imap <up> <C-O>gk
    imap <down> <C-O>gj
    nmap <up> gk
    nmap <down> gj
    vmap <up> gk
    vmap <down> gj
    " Keep visual block selected after indent
    vmap > >gv
    vmap < <gv
    " Yank from cursor to line end
    nnoremap Y y$
    " ordinary neovim
    " Mouse use
    set mouse=a

    " Colors
    set background=dark

    " Spaces & Tabs
    set tabstop=4 " number of spaces per TAB
    set softtabstop=4 "number of spaces in tab when editing
    set shiftwidth=4 "shift when using tab
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

    " spelling language
    set spelllang=en_au

    " neovim mousemodel behaviour
    behave mswin
    set mousemodel=popup

    " Plugins downloaded to specified folder
    " vim-plug: Vim plugin manager
    " ============================
    " Plugins downloaded to specified folder
    call plug#begin('~/.local/share/nvim/plugged')
    

    " List of plugins
    " Pretty stuff
    Plug 'shaunsingh/nord.nvim'
    Plug 'vim-airline/vim-airline' " airline
    Plug 'vim-airline/vim-airline-themes' " airline
    " Git
    Plug 'lewis6991/gitsigns.nvim'
    " LSP config
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    " VIm table
    Plug 'dhruvasagar/vim-table-mode' " table mode for markdown
    " Julia
    Plug 'JuliaEditorSupport/julia-vim' " Julia-vim
    " pandoc
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    " nvim - cmp for autocompletion + LSP support
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    " For luasnip users.
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    " nvim-cmp for pandoc
    Plug 'nvim-lua/plenary.nvim'
    Plug 'aspeddro/cmp-pandoc.nvim'
    " syntax highlighting
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Terminal
    Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
    " Fuzzy finder 
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    " LaTeX equations to ASCII
    Plug 'jbyuki/nabla.nvim'
    " Org mode
    Plug 'nvim-neorg/neorg'

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
    
    "Plugin settings
    "==========================================================================
    "Lua
    "==========================================================================
    " Color scheme
lua << EOF
    vim.cmd[[colorscheme nord]]
EOF
    "--------------------------------------------------------------------------
    " Config for nabla.nvim
    "--------------------------------------------------------------------------
    nnoremap <leader>p :lua require("nabla").popup()<CR> " Customize with popup({border = ...})  : `single` (default), `double`, `rounded`
    "--------------------------------------------------------------------------
    " Lua config for LSP
    "--------------------------------------------------------------------------
lua << EOF
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = { "julials", "ltex", "prosemd_lsp", "jedi_language_server" }
    })
EOF
    "--------------------------------------------------------------------------
    " Lua config for ToggleTerm
    "--------------------------------------------------------------------------
lua << EOF
    require("toggleterm").setup({
        close_on_exit = true,
        open_mapping = [[<c-\>]]
    })
    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end
    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
EOF
    "--------------------------------------------------------------------------
    " Lua config for nvim-cmp
    "--------------------------------------------------------------------------
    set completeopt=menu,menuone,noselect
lua <<EOF
  -- Setup nvim-cmp.
    local cmp = require'cmp'
    cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'cmp_pandoc' },
      { name = 'treesitter' },
      { name = 'path' },
      { name = 'orgmode' },
    }, {
      { name = 'buffer' },
    })
    })
    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
    })
    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
    })
    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
    })

    -- Setup lspconfig.
   local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')['julials'].setup {
    capabilities = capabilities
    }
    require('lspconfig')['ltex'].setup {
    capabilities = capabilities,
    settings = {
          ltex = {
            disabledRules = {
              ["en"]    = { "MORFOLOGIK_RULE_EN"    },
              ["en-AU"] = { "MORFOLOGIK_RULE_EN_AU" },
              ["en-CA"] = { "MORFOLOGIK_RULE_EN_CA" },
              ["en-GB"] = { "MORFOLOGIK_RULE_EN_GB" },
              ["en-NZ"] = { "MORFOLOGIK_RULE_EN_NZ" },
              ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
              ["en-ZA"] = { "MORFOLOGIK_RULE_EN_ZA" },
              ["es"]    = { "MORFOLOGIK_RULE_ES"    },
              ["it"]    = { "MORFOLOGIK_RULE_IT_IT" },
              ["de"]    = { "MORFOLOGIK_RULE_DE_DE" },
            },
          },
        },
    }
    require('lspconfig')['prosemd_lsp'].setup {
    capabilities = capabilities
    }
    require('lspconfig')['jedi_language_server'].setup {
    capabilities = capabilities
    }
EOF
    "--------------------------------------------------------------------------
    " Lua setup for gitsigns
    "--------------------------------------------------------------------------
lua << EOF
    require('gitsigns').setup()
EOF
    "--------------------------------------------------------------------------
    " Lua setup for cmp_pandoc
    "--------------------------------------------------------------------------
lua << EOF
     require'cmp_pandoc'.setup{
        -- What types of files cmp-pandoc works.
        -- 'pandoc', 'markdown' and 'rmd' (Rmarkdown)
        -- @type: table of string
        filetypes = { "pandoc", "markdown", "rmd" },
        -- Customize bib documentation
        bibliography = {
        -- Enable bibliography documentation
        -- @type: boolean
        documentation = true,
        -- Fields to show in documentation
        -- @type: table of string
        fields = { "type", "title", "author", "year" },
        },
        -- Crossref
        crossref = {
        -- Enable documetation
        -- @type: boolean
        documentation = true,
        -- Use nabla.nvim to render LaTeX equation to ASCII
        -- @type: boolean
        enable_nabla = false,
        }
    }
EOF
    "--------------------------------------------------------------------------
    " Lua setup for treesitter
    "--------------------------------------------------------------------------
lua << EOF
    require'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all"
      ensure_installed = { "markdown", "latex", "python", "julia", "org" },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = true
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          scope_incremental = '<CR>',
          node_incremental = '<TAB>',
          node_decremental = '<S-TAB>',
        },
      }
    }
EOF
    "--------------------------------------------------------------------------
    " Lua setup for telescope
    "--------------------------------------------------------------------------
lua << EOF
    require('telescope').setup{}
EOF
    "--------------------------------------------------------------------------
    " Lua setup for org mode
    "--------------------------------------------------------------------------
lua << EOF
require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.norg.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/notes",
                },
            },
        },
    },
}
EOF
    "==========================================================================
    "General
    "==========================================================================
    " Telescope options
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>

    "Airline settings
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    highlight link GitGutterChangeLineNr Underlined

    " vim pandoc
    let g:pandoc#modules#disabled = ["folding"]
    let g:pandoc#biblio#use_bibtool = 1

endif
