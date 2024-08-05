return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      -- Setup function for toggleterm
      require("toggleterm").setup({
        open_mapping = [[<c-\>]], -- Key mapping to toggle the terminal
      })

      -- Define a function to set terminal keymaps
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        -- Key mappings for terminal mode
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts) -- Escape to normal mode
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts) -- Alternative escape to normal mode
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts) -- Move to left window
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts) -- Move to bottom window
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts) -- Move to top window
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts) -- Move to right window
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts) -- Close terminal window
      end

      -- Set terminal keymaps when opening a terminal
      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

      -- Function to open a new terminal in a horizontal split
      function _G.open_new_horizontal_terminal()
        require("toggleterm.terminal").Terminal:new({ direction = "horizontal" }):open()
      end

      -- Function to open a new terminal in a vertical split
      function _G.open_new_vertical_terminal()
        require("toggleterm.terminal").Terminal:new({ direction = "vertical" }):open()
      end

      -- Function to toggle the current terminal
      function _G.toggle_current_terminal(direction)
        local term = require("toggleterm.terminal").Terminal:new({ direction = direction })
        term:toggle()
      end

      -- Key mappings for managing terminals, based on AstroVim keymaps
      vim.api.nvim_set_keymap(
        "n",
        "<leader>tt",
        '<cmd>lua toggle_current_terminal("float")<cr>',
        { noremap = true, silent = true }
      ) -- Toggle floating terminal
      vim.api.nvim_set_keymap(
        "n",
        "<leader>tv",
        '<cmd>lua toggle_current_terminal("vertical")<cr>',
        { noremap = true, silent = true }
      ) -- Toggle vertical split terminal
      vim.api.nvim_set_keymap(
        "n",
        "<leader>th",
        '<cmd>lua toggle_current_terminal("horizontal")<cr>',
        { noremap = true, silent = true }
      ) -- Toggle horizontal split terminal

      -- Key mappings to open new terminals in splits
      vim.api.nvim_set_keymap("n", "|", "<cmd>lua open_new_vertical_terminal()<cr>", { noremap = true, silent = true }) -- Open new vertical split terminal
      vim.api.nvim_set_keymap(
        "n",
        "_",
        "<cmd>lua open_new_horizontal_terminal()<cr>",
        { noremap = true, silent = true }
      ) -- Open new horizontal split terminal
    end,
  },
}
