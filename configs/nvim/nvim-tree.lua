require("nvim-tree").setup({
  view = {
    width = 30,
    side = "left",
  },
  filters = {
    dotfiles = false,
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
})
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
