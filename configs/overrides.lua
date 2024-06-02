local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "swift",
    "rust",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua_ls",

    -- web dev stuff
    "cssls",
    "html",
    "tsserver",
    "denols",

    -- c/cpp stuff
    "clangd",

    -- rust stuff
    "rust_analyzer",
  },
}

M.tools = {
  -- linters and formatters
  "stylua",
  "prettier",
  "clang-format",
}

M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
