local rust_tools = require("rust-tools")

rust_tools.setup({
  server = {
    on_attach = require("plugins.configs.lspconfig").on_attach,
    capabilities = require("plugins.configs.lspconfig").capabilities,
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          command = "clippy",
        },
        procMacro = {
          enable = true,
        },
        diagnostics = {
          enable = true,
          disabled = { "unresolved-proc-macro" },
        },
      },
    },
  },
})
