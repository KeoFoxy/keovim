local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {
  sourcekit = {
    root_dir = lspconfig.util.root_pattern('.git', 'Package.swift', 'compile_commands.json'),
    cmd = { "xcrun", "sourcekit-lsp" },
    filetypes = { "swift", "objective-c", "objective-cpp" },
  }
}

for server, setup in pairs(servers) do
  setup.on_attach = on_attach
  setup.capabilities = capabilities
  lspconfig[server].setup(setup)
end
