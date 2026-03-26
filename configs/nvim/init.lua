-- ===========================
-- Options
-- ===========================
local opt = vim.opt

opt.backspace = { 'indent', 'eol', 'start' }
opt.belloff = 'all'
opt.number = true
opt.cursorline = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true
opt.mouse = 'a'
opt.encoding = 'utf-8'
opt.hidden = true
opt.backup = false
opt.writebackup = false
opt.shortmess:append('c')
opt.signcolumn = 'number'
opt.updatetime = 300
opt.termguicolors = true

-- ===========================
-- Highlights
-- ===========================
vim.cmd([[
  hi LineNr ctermbg=0 ctermfg=172
  hi CursorLineNr ctermbg=8 ctermfg=172
  hi clear CursorLine
  hi SignColumn ctermbg=black
  hi Pmenu ctermbg=white ctermfg=black
  hi PmenuSel ctermbg=cyan ctermfg=black
]])

-- ===========================
-- Globals
-- ===========================
local g = vim.g

g.airline_theme = 'jellybeans'
g['airline#extensions#tabline#enabled'] = 1
g.airline_powerline_fonts = 1

-- ===========================
-- Keymaps
-- ===========================
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Change Vim's Tab
map('n', '<C-t>', ':tabe ', { noremap = true })
map('n', 't', 'gt', opts)
map('n', 'T', 'gT', opts)
map('i', '<C-t>', '<Esc>gta', opts)
map('i', '<C-S-t>', '<Esc>gTa', opts)

-- Change Mode
map('n', '<C-]>', 'a', opts)
map('i', '<C-]>', '<Esc>', opts)
map('v', '<C-]>', '<Esc>', opts)

-- Move Cursor
map('n', '<C-h>', '<Home>', opts)
map('n', '<C-l>', '<End>', opts)
map('i', '<C-h>', '<Home>', opts)
map('i', '<C-l>', '<End>', opts)

-- Undo & Redo
map('n', 'r', '<C-r>', opts)

-- Move Line(s)
map('n', '<C-S-Up>', '"zdd<Up>"zP', opts)
map('n', '<C-S-Down>', '"zdd"zp', opts)
map('i', '<C-S-Down>', '<Esc>"zdd"zpA', opts)
map('i', '<C-S-Up>', '<Esc>"zdd<Up>"zPA', opts)
map('v', '<C-S-Up>', '"zx<Up>"zP`[V`]', opts)
map('v', '<C-S-Down>', '"zx"zp`[V`]', opts)

-- Cut & Paste
map('i', '<C-v>', '<C-o>p', opts)

-- Indent Line(s)
map('n', '<Tab>', '>>', opts)
map('n', '<S-Tab>', '<<', opts)
map('i', '<S-Tab>', '<C-o><<', opts)
map('v', '<Tab>', '>`[V`]', opts)
map('v', '<S-Tab>', '<`[V`]', opts)

-- Search & Replace
map('n', '<Space><Space>', ":let @/ = '\\<'.expand('<cword>').'\\>'<CR>:set hlsearch<CR>", opts)
map('n', '<Esc><Esc>', ':set nohlsearch<CR>', opts)
map('n', '#', '<Space><Space>:%s/<C-r>///g<Left><Left>', { noremap = false })

-- Comment Out
map('n', '<C-/>', 'gcc', { remap = true, silent = true })
map('n', '<C-_>', 'gcc', { remap = true, silent = true })
map('i', '<C-/>', '<Esc>gcca', { remap = true, silent = true })
map('i', '<C-_>', '<Esc>gcca', { remap = true, silent = true })
map('v', '<C-/>', 'gc', { remap = true, silent = true })
map('v', '<C-_>', 'gc', { remap = true, silent = true })

-- Select All / Save
map('n', '<C-A>', 'ggVG', opts)
map('n', 'ss', ':w<CR>', opts)


-- ===========================
-- Clipboard (for SSH)
-- ===========================
opt.clipboard = "unnamedplus"
g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

-- ===========================
-- FZF
-- ===========================
map('n', '<C-P>', ':Files<CR>', opts)
map('i', '<C-P>', '<Esc>:Files<CR>', opts)

-- ===========================
-- LSP Setting
-- ===========================
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('nil_ls',  { capabilities = capabilities })
vim.lsp.enable( 'nil_ls ')

vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Show diagnostic error/warning" })
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, opts)
