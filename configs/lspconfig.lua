local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

local lsp = vim.lsp

local handlers = {
  ["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = "rounded" }),
}

local servers = {
  html = {},
  cssls = {},
  tsserver = {},
  clangd = {},
  sourcekit = {
    root_dir = lspconfig.util.root_pattern('.git', 'Package.swift', 'compile_commands.json'),
    cmd = { "xcrun", "sourcekit-lsp" },
    filetypes = { "swift", "objective-c", "objective-cpp" },
  },
  rust_analyzer = require('rust-tools').setup({}),
}

for server, setup in pairs(servers) do
  setup.on_attach = on_attach
  setup.capabilities = capabilities
  setup.handlers = handlers
  lspconfig[server].setup(setup)
end

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP Actions',
  callback = function(args)
    local wk = require('which-key')
    wk.register({
      K = {"<cmd>lua vim.lsp.buf.hover()<cr>", "LSP hover info"},
      gd = {"<cmd>lua vim.lsp.buf.definition()<cr>", "LSP go to definition"},
      gD = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "LSP go to declaration"},
      gi = {"<cmd>lua vim.lsp.buf.implementation()<cr>", "LSP go to implementation"},
      gr = {"<cmd>lua vim.lsp.buf.references()<cr>", "LSP list references"},
      gs = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "LSP signature help"},
      gn = {"<cmd>lua vim.lsp.buf.rename()<cr>", "LSP rename"},
      ["[g"] = {"<cmd>lua vim.diagnostic.goto_prev()<cr>", "Go to previous diagnostic"},
      ["g]"] = {"<cmd>lua vim.diagnostic.goto_next()<cr>", "Go to next diagnostic"},
    }, {
      mode = 'n',
      silent = true,
    })
  end,
})
