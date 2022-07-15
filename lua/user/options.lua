local opt = vim.opt

-- indentation
opt.expandtab = true            -- expand tabs to spaces
opt.shiftwidth = 2              -- # of spaces for indent
opt.softtabstop = 2             -- # of spaces a tab counts for
opt.smartindent = true          -- smart indentation
opt.showtabline = 2             -- show tabs
opt.autoindent = true           -- autoindent

-- line numbers
opt.number = true               -- enable line numbers
opt.relativenumber = true       -- enable relative line numbers
opt.numberwidth = 4             -- default number column width
opt.signcolumn = "yes"          -- always show sign column w/o shifts


-- panes
opt.splitbelow = true           -- hsplit always splits below
opt.splitright = true           -- vsplit always splits right

-- colors
opt.termguicolors = true        -- terminal colors


-- misc
opt.backup = false              -- disable backup files
opt.clipboard = "unnamedplus"   -- use system clipboard
opt.cmdheight = 2               -- more space for CLI messages
opt.conceallevel = 0            -- show quotes
opt.fileencoding = "utf-8"      -- utf-8 encoding
opt.hlsearch = true             -- HL all previous search
opt.ignorecase = true           -- ignore case in search
opt.mouse = "a"                 -- enable mouse
opt.pumheight = 10              -- pop up menu height
opt.showmode = false            -- disable vim modes
opt.smartcase = true            -- enable smart casing
opt.swapfile = false            -- disable swap file
opt.timeoutlen = 1000           -- keymap timeout
opt.undofile = true             -- enable smart undos
opt.writebackup = false         -- disable backup
opt.scrolloff = 8               -- minimum lines at bottom
opt.sidescrolloff = 8           -- same but for sides
opt.guifont = "monospace:h17"   -- gui fonts
opt.hidden = true               -- keep multiple buffers open
opt.cursorline = true           -- enable cursor line
opt.updatetime = 300            -- update timer
opt.formatoptions = "cro"       -- stop newline continuation of comments
opt.ruler = true                -- show cursor position
opt.wrap = false                -- line wrap
opt.shortmess:append "c"        -- not sure, just saw it in a file lol

-- vim cmds
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]
vim.cmd ":noh"                  -- remove previous highlights

vim.cmd [[autocmd BufRead,BufNewFile *.text,*.tex setlocal spell]]
vim.cmd [[autocmd BufRead,BufNewFile *.text,*.tex set spelllang=en_us]]
vim.cmd [[autocmd BufRead,BufNewFile *.text,*.tex noremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u]]
