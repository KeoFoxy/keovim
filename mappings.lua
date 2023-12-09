---@type MappingsTable
local M = {}

M.general = {
  i = {
    -- go to beginning and end
    ["<S-j>"] = { "<ESC>^i", "Beginning of line" },
    ["<S-l>"] = { "<End>", "End of line" },

  -- navigate within insert mode
    ["<A-l>"] = { "<Left>", "Move left" }, -- Использование Option (Alt) вместо Command
    ["<A-'>"] = { "<Right>", "Move right" },
    ["<A-;>"] = { "<Down>", "Move down" },
    ["<A-p>"] = { "<Up>", "Move up" },

    -- Select all, copy and paste in insert mode
    ["<A-a>"] = { "<ESC>ggVG", "Select all text" },
    ["<A-c>"] = { "<Esc>\"+y", "Copy selected text" },
    ["<A-v>"] = { "<Esc>\"+p", "Paste from clipboard" },
  },

  n = {
    -- Base control
    ["<A-s>"] = { "<cmd>w<CR>", "Save" }, -- Использование Option (Alt) вместо Command
    ["<A-z>"] = { "<cmd>u<CR>", "Undo" },

    -- Window controls
    ["<leader>a"] = { "<C-w>h", "Window left" },
    ["<leader>d"] = { "<C-w>l", "Window right" },
    ["<leader>s"] = { "<C-w>j", "Window down" },
    ["<leader>w"] = { "<C-w>k", "Window up" },

    ["\\"] = { "<cmd>:vsplit <CR>", "Vertical split" },
    ["<leader>]"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
    },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<A-/>"] = { -- Использование Option (Alt) вместо Command
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<A-/>"] = { -- Использование Option (Alt) вместо Command
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<A-q>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" }, -- Использование Option (Alt) вместо Command

    -- focus
    ["<A-e>"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" }, -- Использование Option (Alt) вместо Command
  },
}

-- more keybinds!

return M
