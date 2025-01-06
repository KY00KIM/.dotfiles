call plug#begin()
    Plug 'morhetz/gruvbox'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    "Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    " Plug 'numToStr/Comment.nvim'
    " Plug 'neovim/nvim-lspconfig'
    " Plug 'hrsh7th/cmp-nvim-lsp'
    " Plug 'hrsh7th/cmp-buffer'
    " Plug 'hrsh7th/cmp-path'
    " Plug 'hrsh7th/cmp-cmdline'
    " Plug 'hrsh7th/nvim-cmp'

    " Plug 'hrsh7th/vim-vsnip'
    " Plug 'hrsh7th/vim-vsnip-integ'

call plug#end()

let mapleader = " "

set tabstop=4        " Number of spaces that a <Tab> counts for
set shiftwidth=4     " Number of spaces to use for autoindent
set expandtab        " Convert tabs to spaces (remove if you want actual tabs)
set autoindent       " Copy indent from current line when starting a new line
set smartindent      " Automatically indent new lines in some cases

" Line numbers
set number           " Enable line numbers

" Search settings
set ignorecase       " Ignore case in search
set smartcase        " Override ignorecase if search contains uppercase
set incsearch        " Show matches as you type
set hlsearch         " Highlight all search matches

" Interface enhancements
set cursorline       " Highlight the current line
set wrap             " Enable line wrapping
set scrolloff=8      " Keep 8 lines visible above and below the cursor
set showmode         " Show mode (e.g., -- INSERT --)
set signcolumn=yes   " Always show the sign column (for diagnostics, Git, etc.)

" Clipboard
set clipboard=unnamedplus " Use system clipboard for copy/paste

" Split behavior
set splitright       " Open vertical splits to the right of the current window
set title " Show file title
set wildmenu " Show a more advance menu
filetype plugin indent on   " Allow auto-indenting depending on file type
filetype plugin on

syntax on
set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim

let NERDTreeShowHidden=1


" Color Scheme config
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme gruvbox

autocmd VimEnter * NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
"nnoremap <`> :NERDTreeToggle<CR>
nmap ` :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>


" Treesitter : Higlighter Settings
lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

"lua << EOF
"local lspconfig = require('lspconfig')
"
"local on_attach = function(client, bufnr)
"    local opts = { noremap = true, silent = true, buffer = bufnr }
"
"    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
"    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
"    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
"    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
"    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
"    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
"end
"
"lspconfig.pyright.setup({ on_attach = on_attach })
"lspconfig.clangd.setup({ on_attach = on_attach })
"EOF
"
"" AutoComplete nvim-cmp
"lua <<EOF
"  -- Set up nvim-cmp.
"  local cmp = require'cmp'
"
"  cmp.setup({
"    snippet = {
"      -- REQUIRED - you must specify a snippet engine
"      expand = function(args)
"        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
"      end,
"    },
"    window = {
"      -- completion = cmp.config.window.bordered(),
"      -- documentation = cmp.config.window.bordered(),
"    },
"    mapping = cmp.mapping.preset.insert({
"      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
"      ['<C-f>'] = cmp.mapping.scroll_docs(4),
"      ['<C-m>'] = cmp.mapping.complete(),
"      ['<C-e>'] = cmp.mapping.abort(),
"      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
"    }),
"    sources = cmp.config.sources({
"      { name = 'nvim_lsp' },
"      { name = 'vsnip' }, -- For vsnip users.
"    }, {
"      { name = 'buffer' },
"    })
"  })
"
"  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
"  -- Set configuration for specific filetype.
"  --[[ cmp.setup.filetype('gitcommit', {
"    sources = cmp.config.sources({
"      { name = 'git' },
"    }, {
"      { name = 'buffer' },
"    })
" })
" require("cmp_git").setup() ]]-- 
"
"  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
"  cmp.setup.cmdline({ '/', '?' }, {
"    mapping = cmp.mapping.preset.cmdline(),
"    sources = {
"      { name = 'buffer' }
"    }
"  })
"
"  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
"  cmp.setup.cmdline(':', {
"    mapping = cmp.mapping.preset.cmdline(),
"    sources = cmp.config.sources({
"      { name = 'path' }
"    }, {
"      { name = 'cmdline' }
"    }),
"    matching = { disallow_symbol_nonprefix_matching = false }
"  })
"
"  -- Set up lspconfig.
"  local capabilities = require('cmp_nvim_lsp').default_capabilities()
"  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
"  require('lspconfig').pyright.setup {
"        capabilities = capabilities
"    }
"  require('lspconfig').clangd.setup {
"        capabilities = capabilities
"      }
"  require('lspconfig')['dockerls'].setup {
"        capabilities=capabilities
"      }
"EOF
"
"" Comment
"lua << EOF
"require('Comment').setup({
"    opleader = {
"        ---Set Ctrl-/ for line-comment in VISUAL mode
"        line = '<C-_>',
"        ---Set Ctrl-/ for block-comment in VISUAL mode
"        block = '<C-_>',
"    }
"})
"EOF

" Find files using Telescope command-line sugar.
lua << EOF
require('telescope').load_extension('fzf')
EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


