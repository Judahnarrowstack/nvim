return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      transparent = true, -- Enable transparent background
      italic_comments = true, -- Enable italics for comments
      hide_fillchars = true, -- Clean look
      borderless_telescope = true, -- Modern borderless telescope theme
      terminal_colors = true, -- Set terminal colors
    })
    vim.cmd("colorscheme cyberdream")
  end,
}
