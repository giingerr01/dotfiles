local opt = vim.opt

-- General / System
opt.backup = false -- Disable creating ~ backup files
opt.writebackup = false
opt.swapfile = false -- Disable swap files
opt.undofile = true -- Save undo history to file across restarts
opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.updatetime = 250 -- Faster completion and UI update responsiveness
opt.timeoutlen = 300 -- Faster key sequence completion trigger

-- Line Numbers & Display
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers for easier navigation
opt.signcolumn = "yes" -- Always show sign column (prevents text shift for diagnostics)
opt.cursorline = true -- Highlight current line
opt.wrap = true -- Disable line wrapping
opt.linebreak = true
opt.termguicolors = true -- True color support

-- Indentation & Tabs
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for
opt.softtabstop = 2
opt.smartindent = true -- Insert indents automatically

-- Searching
opt.ignorecase = true -- Case-insensitive searching
opt.smartcase = true -- Sensitive search if uppercase letters are included
opt.hlsearch = true -- Highlight search results
opt.incsearch = true -- Incremental search while typing

-- Splits & Windows
opt.splitbelow = true -- Horizontal splits open below
opt.splitright = true -- Vertical splits open to the right
opt.scrolloff = 8 -- Keep at least 8 lines above/below cursor
opt.sidescrolloff = 8 -- Keep at least 8 columns left/right of cursor
