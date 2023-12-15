---@type MappingsTable
local M = {}

M.general = {
  i = {
    -- go to beginning and end
    ["<C-j>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-k>"] = { "<End>", "End of line" },

    -- move line up and down
    ["<A-j>"] = { "<ESC>:m .+1<CR>==gi", "Move line down" },
    ["<A-k>"] = { "<ESC>:m .-2<CR>==gi", "Move line up"},

    -- navigate within insert mode
    ["<A-l>"] = { "<Left>", "Move left" },
    ["<A-'>"] = { "<Right>", "Move right" },
    ["<A-;>"] = { "<Down>", "Move down" },
    ["<A-p>"] = { "<Up>", "Move up" },

    -- Select all, copy and paste in insert mode
    ["<C-a>"] = { "<ESC>ggVG", "Select all text" },
    ["<C-c>"] = { "<Esc>\"+y", "Copy selected text" },
    ["<C-v>"] = { "<Esc>\"+p", "Paste from clipboard" },
  },

  n = {
    -- Base control
    ["<C-s>"] = { "<cmd>w<CR>", "Save" },
    ["<C-z>"] = { "<cmd>u<CR>", "Undo" },

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
    ["<leader>q"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" }, -- Использование Option (Alt) вместо Command

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" }, -- Использование Option (Alt) вместо Command
  },
}

-- more keybinds!

return M
