---@type MappingsTable
local M = {}

M.general = {
  i = {
    -- move line up and down
    ["<A-l>"] = { "<ESC>:m .+1<CR>==gi", "Move line down" },
    ["<A-o>"] = { "<ESC>:m .-2<CR>==gi", "Move line up"},

    -- -- navigate within insert mode
    -- ["<C-a>"] = { "<Left>", "Move left" },
    -- ["<C-d>"] = { "<Right>", "Move right" },
    -- ["<C-s>"] = { "<Down>", "Move down" },
    -- ["<C-w>"] = { "<Up>", "Move up" },

    -- Select all, copy and paste in insert mode
    ["<A-A>"] = { "<ESC>ggVG", "Select all text" },
    -- ["<A-c>"] = { "<Esc>\"+y", "Copy selected text" },
    -- ["<A-v>"] = { "<Esc>\"+p", "Paste from clipboard" },
  },

  n = {

    -- Split resize
    ["<C-sp>"] = { "<cmd>:vertical resize +1<CR>"},
    ["<C-so>"] = { "<cmd>:vertical resize -1<CR>"},

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
    ["<A-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<A-/>"] = {
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
