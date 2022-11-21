let mapleader = ","

set number relativenumber
set nu rnu
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set cursorline
set signcolumn=yes
set nocompatible
set nohlsearch              " Highlight search results
set ignorecase            " Search ingnoring case
set smartcase             " Do not ignore case if the search patter has uppercase
set noerrorbells          " I hate bells
set belloff=esc
set tabstop=4             " Tab size of 4 spaces
set softtabstop=4         " On insert use 4 spaces for tab
set shiftwidth=2
set expandtab             " Use apropiate number of spaces
set nowrap                " Wrapping sucks (except on markdown)
set mouse=a
autocmd BufRead,BufNewFile *.md,*.txt setlocal wrap " DO wrap on markdown files
set noswapfile            " Do not leve any backup files
set nobackup
set undofile
set undodir=~/.vim/undodir
set clipboard=unnamed
set showmatch
set termguicolors
set scrolloff=10
set smartindent
set splitright splitbelow
" set cursorline
" set list lcs=tab:\¦\      "(here is a space)
let &t_SI = "\e[6 q"      " Make cursor a line in insert
let &t_EI = "\e[2 q"      " Make cursor a line in insert

" Keep VisualMode after indent with > or <
vmap < <gv
vmap > >gv
"
" Move Visual blocks with J an K
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
vnoremap // y/\V<C-R>=escape(@",'/\')<cr><cr>

" Autocomand to remember las editing position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

call plug#begin('~/.vim/plugged')
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'mattn/emmet-vim'
Plug 'roxma/nvim-yarp'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/tagalong.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'davidhalter/jedi-vim'
Plug 'wesleyche/Trinity'
Plug 'wesleyche/SrcExpl'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
" colorscheme
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'glepnir/zephyr-nvim'
" Plug 'ayu-theme/ayu-vim'
" Plug 'wadackel/vim-dogrun'
" Plug 'rafamadriz/neon'
" Plug 'phanviet/vim-monokai-pro'

" Plug 'github/copilot.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'psliwka/vim-smoothie'
Plug 'mhinz/vim-startify'
Plug 'sainnhe/gruvbox-material'
Plug 'OmniSharp/omnisharp-vim'
Plug 'liuchengxu/vista.vim'
Plug 'rhysd/vim-clang-format'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'bfrg/vim-cpp-modern'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

set termguicolors
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
" let g:gruvbox_material_background = 'hard'
" colorscheme gruvbox-material
" colorscheme monokai_pro
colorscheme zephyr

let g:jedi#environment_path = '/usr/bin/python3'
let g:python3_host_prog = '/usr/bin/python3'

let g:indentLine_char = '|'
let g:indentLine_setColors = 0
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

" Format code
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>c :ClangFormat<cr>
nnoremap <leader>c :Autoformat<cr>

" Default fzf layout
" - Popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

" - Window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \   'bg':      ['bg', 'Normal'],
      \   'hl':      ['fg', 'Comment'],
      \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \   'hl+':     ['fg', 'Statement'],
      \   'info':    ['fg', 'PreProc'],
      \   'border':  ['fg', 'Ignore'],
      \   'prompt':  ['fg', 'Conditional'],
      \   'pointer': ['fg', 'Exception'],
      \   'marker':  ['fg', 'Keyword'],
      \   'spinner': ['fg', 'Label'],
      \   'header':  ['fg', 'Comment'] }

set laststatus=2

set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     " MacOSX/Linux

nmap zs :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap zg :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap zc :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap zt :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap ze :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap zf :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap zi :cs find i ^<C-R>=expand("<cfile>")<cr>$<cr>
nmap zd :cs find d <C-R>=expand("<cword>")<cr><cr>

set ut=100
nmap <Leader>m :wa<cr>:!make<cr>
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>

autocmd FileType python map <buffer> <F5> :w<cr>:exec '!python3' shellescape(@%, 1)<cr>
autocmd FileType python imap <buffer> <F5> <esc>:w<cr>:exec '!python3' shellescape(@%, 1)<cr>
autocmd FileType verilog set syntax=verilog

" autocmd FileType c,cpp Leaderf gtags --update<cr>

let g:ale_fixers = {'javascript': ['eslint'], 'typescript': ['eslint'], 'typescriptreact': ['eslint']}
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!!'
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_c_gcc_options = '-std=gnu99'
let g:ale_cpp_gcc_options = '-std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_sign_error = "\ue009\ue009"

let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme='ayu'
let g:airline_theme='gruvbox_material'
let g:airline#extensions#clock#format = '%H:%M:%S'
let g:airline#extensions#clock#updatetime = 500

hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

inoremap <C-e> <C-o>A

nnoremap N Nzzzv
nnoremap n nzzzv

" Undo break point
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap / /<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap _ _<c-g>u
inoremap < <<c-g>u
inoremap > ><c-g>u

nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<cr>

set completeopt=menu,menuone,noselect

lua <<EOF
require("mason").setup()
require("mason-lspconfig").setup()
require("telescope").load_extension "file_browser"
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "phpdoc" },
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
        },
        },
        indent = {
          enable = true
        }
        }
EOF

lua <<EOF
require("nvim-tree").setup()
EOF

lua <<EOF
-- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-j>'] = cmp.mapping.scroll_docs(1),
      ['<C-k>'] = cmp.mapping.scroll_docs(-1),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
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

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
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

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
EOF
" Jump forward or backward
imap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
smap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
imap <expr> <C-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-k>'
smap <expr> <C-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-k>'

let g:OmniSharp_selector_findusages = 'fzf'

let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 40
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

