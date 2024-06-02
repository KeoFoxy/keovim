local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {
  tsserver = {},
  eslint = {}
}

for server, setup in pairs(servers) do
  setup.on_attach = on_attach
  setup.capabilities = capabilities
  lspconfig[server].setup(setup)
end

local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
  b.formatting.deno_fmt,
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "javascriptreact", "typescriptreact" } },
  b.diagnostics.eslint_d,
  b.code_actions.eslint_d,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd [[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]]
    end
  end,
}
